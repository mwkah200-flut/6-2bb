import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/homepage.dart';
import 'package:flutter_application_1/services/api_service.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController _searchController = TextEditingController();

  List<String> _recentSearches = [
    "burger",
    "pizza",
    "subway",
    "sandwich",
    "cake",
  ];

  List _results = [];
  bool _isLoading = false;

  void _addToRecent(String query) {
    String trimmed = query.trim();
    if (trimmed.isEmpty) return;

    setState(() {
      _recentSearches.remove(trimmed);
      _recentSearches.insert(0, trimmed);

      if (_recentSearches.length > 6) {
        _recentSearches.removeLast();
      }
    });
  }

  void _onSearchChanged(String query) async {
    if (query.isEmpty) {
      setState(() => _results = []);
      return;
    }

    setState(() => _isLoading = true);
    var response = await ApiService.search(query: query);
    setState(() {
      if (response['success'] == true) {
        var data = response['data'];

        if (data is List) {
          _results = data;
        } else if (data is Map && data.containsKey('data')) {
          _results = data['data'] is List ? data['data'] : [];
        } else {
          _results = [];
        }
      } else {
        _results = [];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        controller: _searchController,
                        onChanged: _onSearchChanged,
                        onSubmitted: (value) {
                          _addToRecent(value);
                        },
                        decoration: const InputDecoration(
                          hintText: "Search",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                          ),
                          prefixIcon: Icon(Icons.search, color: Colors.black),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 12),
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      _searchController.clear();
                      setState(() => _results = []);
                      FocusScope.of(context).unfocus();
                    },
                    child: const Text(
                      "Cancel",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 147, 24, 24),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: _searchController.text.isEmpty
                  ? _buildRecentSection()
                  : _buildResultsSection(),
            ),

            _buildBottomNavigation(),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentSection() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Recent searches",
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
                TextButton(
                  onPressed: () => setState(() => _recentSearches.clear()),
                  child: const Text(
                    "Clear",
                    style: TextStyle(
                      color: Color.fromARGB(255, 147, 24, 24),
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ..._recentSearches.map((item) => _buildRecentItem(item)).toList(),
        ],
      ),
    );
  }

  Widget _buildRecentItem(String text) {
    return InkWell(
      onTap: () {
        _searchController.text = text;
        _onSearchChanged(text);
        _addToRecent(text);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        child: Row(
          children: [
            const Icon(Icons.history, color: Colors.grey, size: 25),
            const SizedBox(width: 15),
            Text(
              text,
              style: const TextStyle(fontSize: 18, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResultsSection() {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(
          color: Color.fromARGB(255, 147, 24, 24),
        ),
      );
    }
    if (_results.isEmpty && _searchController.text.isNotEmpty) {
      return const Center(child: Text("No results found"));
    }
    return ListView.builder(
      itemCount: _results.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(_results[index]['name']),
          onTap: () => _addToRecent(_searchController.text),
        );
      },
    );
  }

  Widget _buildBottomNavigation() {
    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey[200]!)),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _navItem(Icons.food_bank_outlined, "Home", false, () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Homepage()),
            );
          }),
          _navItem(Icons.search, "Search", true, () {}),
          _navItem(Icons.receipt_long, "Orders", false, () {
            Navigator.pushNamed(context, "/Yourorders2");
          }),
          _navItem(Icons.person, "Profile", false, () {
            Navigator.pushNamed(context, "/Account");
          }),
        ],
      ),
    );
  }

  Widget _navItem(
    IconData icon,
    String label,
    bool isActive,
    VoidCallback onTap,
  ) {
    final color = isActive
        ? const Color.fromARGB(255, 147, 24, 24)
        : Colors.black;
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 30),
          Text(label, style: TextStyle(color: color, fontSize: 13)),
        ],
      ),
    );
  }
}
