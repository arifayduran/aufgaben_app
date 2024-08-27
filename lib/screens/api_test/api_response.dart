import 'dart:convert';
import 'package:aufgaben_app/screens/api_test/cryptocurrency_from_json.dart';
import 'package:http/http.dart' as http;

Future<List<Cryptocurrency>> fetchCryptocurrencies() async {
  final response = await http.get(
    Uri.parse('https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd'),
  );

  if (response.statusCode >= 200 && response.statusCode < 300) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => Cryptocurrency.fromJson(data)).toList();
  } else {
    throw Exception('Failed to load cryptocurrencies');
  }
}
