import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/addcard.dart';
import 'package:flutter_application_1/services/api_service.dart';
import 'package:flutter_application_1/services/storage_service.dart';

class PaymentMethodsPage extends StatefulWidget {
  const PaymentMethodsPage({super.key});

  @override
  State<PaymentMethodsPage> createState() => _PaymentMethodsPageState();
}

class _PaymentMethodsPageState extends State<PaymentMethodsPage> {
  List _cards = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchPaymentMethods();
  }

  Future<void> _fetchPaymentMethods() async {
    if (_cards.isEmpty) setState(() => _isLoading = true);

    final result = await ApiService.getPaymentMethods();
    print("DEBUG: API Response Data: ${result['data']}");

    if (mounted) {
      if (result['success']) {
        setState(() {
          _cards = result['data'];
          _isLoading = false;
        });
      } else {
        setState(() => _isLoading = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(result['message'] ?? "Error loading cards"),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Payment Methods",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: _isLoading
                ? const Center(
                    child: CircularProgressIndicator(color: Color(0xFF931818)),
                  )
                : RefreshIndicator(
                    onRefresh: _fetchPaymentMethods,
                    color: const Color(0xFF931818),
                    child: _cards.isEmpty
                        ? _buildEmptyState()
                        : _buildCardsList(),
                  ),
          ),
          _buildAddCardButton(),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return ListView(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.2),
        Center(
          child: Column(
            children: [
              Icon(
                Icons.credit_card_off_outlined,
                size: 80,
                color: Colors.grey[300],
              ),
              const SizedBox(height: 10),
              const Text(
                "No saved cards found",
                style: TextStyle(color: Colors.grey, fontSize: 18),
              ),
              const Text(
                "Swipe down to refresh",
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCardsList() {
    return ListView.builder(
      padding: const EdgeInsets.all(15),
      itemCount: _cards.length,
      itemBuilder: (context, index) {
        final card = _cards[index];
        return _buildCardUI(card);
      },
    );
  }

  Widget _buildCardUI(Map card) {
    String brand = card['cardBrand']?.toString().toUpperCase() ?? "VISA";
    String last4 = card['lastFourDigits']?.toString() ?? "****";

    String expMonth = card['expiryMonth']?.toString().padLeft(2, '0') ?? "01";

    String fullYear = card['expiryYear']?.toString() ?? "26";
    String expYear = fullYear.length > 2
        ? fullYear.substring(fullYear.length - 2)
        : fullYear;

    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          padding: const EdgeInsets.all(20),
          height: 200,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF931818), Color(0xFF4A0C0C)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.red.withOpacity(0.2),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.contactless, color: Colors.white, size: 30),
                  Text(
                    brand,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Text(
                "**** **** **** $last4", 
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  letterSpacing: 4,
                  fontFamily: 'monospace',
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "CARD HOLDER",
                        style: TextStyle(color: Colors.white54, fontSize: 10),
                      ),
                      Text(
                        "BITE BACK USER",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "EXPIRES",
                        style: TextStyle(color: Colors.white54, fontSize: 10),
                      ),
                      Text(
                        "$expMonth/$expYear",
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),

        Positioned(
          top: -5,
          right: -5,
          child: IconButton(
            icon: const Icon(Icons.delete_outline, color: Colors.white70),
            onPressed: () => _confirmDelete(card['id']),
          ),
        ),
      ],
    );
  }

  void _confirmDelete(String cardId) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text("Delete Card"),
        content: const Text(
          "Are you sure you want to remove this payment method?",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(dialogContext); 
              setState(() => _isLoading = true);

              final token = await StorageService.getToken();
              final result = await ApiService.deletePaymentMethod(
                cardId,
                token ?? '',
              );

              if (!mounted) return;

              if (result['success']) {
                _fetchPaymentMethods();
              } else {
                setState(() => _isLoading = false);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      result['message']?.toString() ?? 'Could not remove card',
                    ),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            child: const Text("Delete", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  Widget _buildAddCardButton() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddCard()),
          );

          if (result == true) {
            _fetchPaymentMethods();
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF931818),
          minimumSize: const Size(double.infinity, 55),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 2,
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add_rounded, color: Colors.white),
            SizedBox(width: 10),
            Text(
              "Add New Card",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
