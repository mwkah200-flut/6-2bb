// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/screens/mcdonalds.dart' show Mcdonalds;
import 'package:flutter_application_1/services/api_service.dart';
import 'package:flutter_svg/svg.dart';

class AddCard extends StatefulWidget {
  const AddCard({super.key});

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryController = TextEditingController();
  final TextEditingController _cvcController = TextEditingController();
  bool _isSaving = false;

  @override
  void dispose() {
    _cardNumberController.dispose();
    _expiryController.dispose();
    _cvcController.dispose();
    super.dispose();
  }

  void showInvoiceSheet(double amount) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Order Invoice",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Divider(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Total Amount", style: TextStyle(fontSize: 18)),
                Text(
                  "${amount.toStringAsFixed(2)} EGP",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                             Navigator.push(context, MaterialPageRoute(builder: (_)=>Mcdonalds()));
                },
                child: Text(
                  "Confirm Order ✅",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double orderTotal =
        ModalRoute.of(context)?.settings.arguments as double? ?? 0.0;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Add your payment method",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Text(
                "this card will only be charged when",
                style: TextStyle(color: Colors.grey),
              ),
              Text("you place an order", style: TextStyle(color: Colors.grey)),
              SizedBox(height: 40),

              _buildTextFieldContainer(
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/images/credit-card-credit-svgrepo-com.svg",
                      height: 30,
                      placeholderBuilder: (context) => Icon(Icons.credit_card),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        controller: _cardNumberController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(16),
                          CardNumberFormatter(),
                        ],
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "4343 4343 4343 4343",
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildTextFieldContainer(
                      width: 160,
                      child: TextField(
                        controller: _expiryController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(4),
                          CardExpirationFormatter(),
                        ],
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "MM/YY",
                        ),
                      ),
                    ),
                    _buildTextFieldContainer(
                      width: 160,
                      child: TextField(
                        controller: _cvcController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(4),
                        ],
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "CVC",
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 100),

              _isSaving
                  ? CircularProgressIndicator(color: Color(0xFF931818))
                  : SizedBox(
                      height: 50,
                      width: 350,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          backgroundColor: const Color(0xFF931818),
                        ),

                        onPressed: () async {
                          if (_cardNumberController.text.isEmpty ||
                              _expiryController.text.isEmpty ||
                              _cvcController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Please fill all fields"),
                              ),
                            );
                            return;
                          }

                          List<String> expiryParts = _expiryController.text
                              .split('/');
                          int month = int.tryParse(expiryParts[0]) ?? 12;
                          int year = expiryParts.length > 1
                              ? int.parse("20${expiryParts[1]}")
                              : 2026;

                          setState(() => _isSaving = true);

                          final result = await ApiService.addPaymentMethod(
                            cardNumber: _cardNumberController.text.replaceAll(
                              ' ',
                              '',
                            ),
                            expiryMonth: month,
                            expiryYear: year,
                            cvv: _cvcController.text,
                          );

                          setState(() => _isSaving = false);

                          if (result['success'] == true ||
                              result['error']?['code'] == "Unauthorized") {
                            if (orderTotal > 0) {
                              showInvoiceSheet(orderTotal);
                            } else {
                              Navigator.pop(context, true);
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  result['message'] ?? "Error in the process",
                                ),
                              ),
                            );
                            if (orderTotal > 0) showInvoiceSheet(orderTotal);
                          }
                        },

                        child: Text(
                          "Add card",
                          style: TextStyle(fontSize: 22, color: Colors.white),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextFieldContainer({required Widget child, double width = 350}) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: const Color.fromARGB(135, 238, 238, 238),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 1, color: Colors.grey[300]!),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: child,
    );
  }
}

class CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    var text = newValue.text.replaceAll(' ', '');
    var buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 4 == 0 && nonZeroIndex != text.length) {
        buffer.write(' ');
      }
    }
    var string = buffer.toString();
    return newValue.copyWith(
      text: string,
      selection: TextSelection.collapsed(offset: string.length),
    );
  }
}

class CardExpirationFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    var text = newValue.text.replaceAll('/', '');
    var buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 2 == 0 && nonZeroIndex != text.length) {
        buffer.write('/');
      }
    }
    var string = buffer.toString();
    return newValue.copyWith(
      text: string,
      selection: TextSelection.collapsed(offset: string.length),
    );
  }
}
