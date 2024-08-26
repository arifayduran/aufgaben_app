import 'package:aufgaben_app/screens/api_test/api_response.dart';
import 'package:aufgaben_app/screens/api_test/cryptocurrency_from_json.dart';
import 'package:flutter/material.dart';

class ApiScreen extends StatefulWidget {
  const ApiScreen({super.key});

  @override
  State<ApiScreen> createState() => _ApiScreenState();
}

class _ApiScreenState extends State<ApiScreen> {
  late Future<List<Cryptocurrency>> futureCryptocurrencies;

  @override
  void initState() {
    super.initState();
    futureCryptocurrencies = fetchCryptocurrencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cryptocurrency Prices'),
      ),
      body: FutureBuilder<List<Cryptocurrency>>(
        future: futureCryptocurrencies,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data![index].name),
                  subtitle: Text(
                      '\$${snapshot.data![index].currentPrice.toStringAsFixed(2)}'),
                  leading: Image.network(
                    snapshot.data![index].image,
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('${snapshot.error}'));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
