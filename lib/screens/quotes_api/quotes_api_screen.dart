import 'dart:convert';

import 'package:aufgaben_app/screens/quotes_api/categories.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class QuotesApiScreen extends StatefulWidget {
  const QuotesApiScreen({super.key});

  @override
  State<QuotesApiScreen> createState() => _QuotesApiScreenState();
}

class _QuotesApiScreenState extends State<QuotesApiScreen> {
  String? _selectedCategory;
  String? _quote;
  String? _author;
  bool _isLoading = false;
  final String _myApiKey = "fDEVS7DJgzYy8WZ39IhJEg==5knz25rDdCPoluJv";
  List<String> capitalizedCategories = [];
  List<String> savedQuotes = [];

  @override
  void initState() {
    super.initState();
    _loadSavedQuotes();

    for (var category in categories) {
      capitalizedCategories
          .add(category[0].toUpperCase() + category.substring(1));
    }
  }

  Future<void> fetchQuotes() async {
    setState(() {
      _isLoading = true;
    });
    final response = await http.get(
      Uri.parse(_selectedCategory == null || _selectedCategory == "all"
          ? "https://api.api-ninjas.com/v1/quotes"
          : "https://api.api-ninjas.com/v1/quotes?category=${_selectedCategory}"),
      headers: {'X-Api-Key': _myApiKey},
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final List<dynamic> data = json.decode(response.body);
      if (data.isNotEmpty) {
        setState(() {
          _quote = data[0]['quote'];
          _author = data[0]['author'];
          _isLoading = false;
        });
        _saveQuote(_quote!, _author!, _selectedCategory ?? "all");
      } else {
        setState(() {
          _quote = "No quote found";
          _author = "";
          _isLoading = false;
        });
      }
    } else {
      setState(() {
        _quote = "Failed to load quote";
        _author = "";
        _isLoading = false;
      });
      throw Exception('Failed to load data');
    }
  }

  void _saveQuote(String quote, String author, String category) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String formattedQuote = 'Category: $category\n"$quote"\n-- $author';
    savedQuotes.add(formattedQuote);

    await prefs.setStringList('saved_quotes', savedQuotes);

    setState(() {});
  }

  void _loadSavedQuotes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      savedQuotes = prefs.getStringList('saved_quotes') ?? [];
    });
  }

  void _clearSavedQuotes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('saved_quotes');
    setState(() {
      savedQuotes = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quotes API"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            DropdownButton(
              value: _selectedCategory,
              hint: const Text("Select a Category"),
              onChanged: (value) {
                setState(() {
                  _selectedCategory = value;
                });
              },
              items: [
                const DropdownMenuItem(
                  value: "all",
                  child: Text("All Categories"),
                ),
                ...capitalizedCategories.map(
                  (category) => DropdownMenuItem(
                    value: category,
                    child: Text(category),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: _isLoading ? null : fetchQuotes,
              child: _isLoading
                  ? const CircularProgressIndicator()
                  : const Text("Generate Quote"),
            ),
            const Divider(),
            if (_quote != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  '"$_quote"',
                  style: const TextStyle(
                      fontWeight: FontWeight.w700, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
            if (_author != null)
              Text(
                "-- $_author",
                style:
                    const TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
              ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: _clearSavedQuotes,
                  icon: const Icon(Icons.delete),
                ),
                const Text(
                  "Saved Quotes:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 300,
              child: ListView.separated(
                separatorBuilder: (context, index) =>
                    const Divider(color: Colors.grey),
                itemCount: savedQuotes.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(savedQuotes[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
