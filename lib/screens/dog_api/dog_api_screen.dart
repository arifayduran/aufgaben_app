import 'dart:convert';
// import 'package:aufgaben_app/screens/dog_api/dog_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DogApiScreen extends StatefulWidget {
  const DogApiScreen({super.key});

  @override
  State<DogApiScreen> createState() => _DogApiScreenState();
}

class _DogApiScreenState extends State<DogApiScreen> {
  String? _selectedBreed;
  String? _imageUrl;
  bool? _isLoading = false;
  final List<String> _breeds = [];

  @override
  void initState() {
    super.initState();
    fetchBreeds();
  }

  Future<void> fetchBreeds() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final response =
          await http.get(Uri.parse('https://dog.ceo/api/breeds/list/all'));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        final Map<String, dynamic> breedsJson =
            json.decode(response.body)["message"];
        setState(() {
          _breeds.addAll(breedsJson.keys
              .map((breed) => breed[0].toUpperCase() + breed.substring(1))
              .toList());

          _isLoading = false;
        });
      } else {
        throw Exception('Failed to load data');
      }
    } on Exception {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> fetchRandomBreeds() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final breed = _selectedBreed?.toLowerCase() ?? "random";
      final response = await http.get(Uri.parse(breed == "random"
          ? "https://dog.ceo/api/breeds/image/random"
          : "https://dog.ceo/api/breed/$breed/images/random"));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        setState(() {
          _imageUrl = json.decode(response.body)["message"];
          _isLoading = false;
        });
      } else {
        throw Exception('Failed to load data');
      }
    } on Exception {
      setState(() {
        _isLoading = false;
      });
    }
  }

  // ElevatedButton(
  //   onPressed: () async {
  //     final response = await http
  //         .get(Uri.parse('https://api.thedogapi.com/v1/breeds'));
  //     if (response.statusCode >= 200 || response.statusCode < 300) {
  //       final data = json.decode(response.body);
  //       setState(() {
  //         _dogs = data;
  //       });
  //     } else {
  //       throw Exception('Failed to load data');
  //     }
  //   },
  //   child: const Text('Load Dog Breeds'),
  // ),
  // ListView.builder(
  //   itemCount: _dogs.length,
  //   itemBuilder: (context, index) {
  //     final dog = _dogs[index];
  //     return ListTile(
  //       title: Text(dog['name']),
  //       onTap: () {
  //         Navigator.push(
  //             context,
  //             MaterialPageRoute(
  //                 builder: (context) => const DogDetailScreen()));
  //       },
  //     );
  //   },
  // )

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Text("Dog API"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (_breeds.isNotEmpty)
                  DropdownButton(
                    value: _selectedBreed,
                    hint: const Text("Bitte wähle eine Hunderasse aus"),
                    onChanged: (value) {
                      setState(() {
                        _selectedBreed = value;
                      });
                    },
                    items: [
                      const DropdownMenuItem(
                        value: "random",
                        child: Text("-- Zufällige Rasse --"),
                      ),
                      ..._breeds.map(
                        (breed) => DropdownMenuItem(
                          value: breed,
                          child: Text(breed),
                        ),
                      ),
                    ],
                  ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: fetchRandomBreeds,
                    child: const Text("Hundebild anzeigen"))
              ],
            ),
          ),
          Expanded(
              child: Center(
                  child: _isLoading!
                      ? const CircularProgressIndicator()
                      : _imageUrl != null
                          ? Padding(
                              padding: const EdgeInsets.all(16),
                              child: Image.network(
                                _imageUrl!,
                              ),
                            )
                          : const Text("Bitte wähle einen Hund aus"))),
        ],
      ),
    );
  }
}
