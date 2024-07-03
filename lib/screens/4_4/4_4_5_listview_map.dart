/* Implementiere die UI von dem Screenshot. Sie zeigt eine Liste von Produkten.
Jedes Listenelement soll ein Warenkorb-Icon, einen Titel und einen Preis enthalten.

Hierbei soll eine ListView verwendet werden.

Hinweis: Ein Icon-Widget wird mit Icon(...) erstellt. Das Icon unten ist “Icons.shopping_cart”.
Hinweis: Hier kann das Spacer() oder das Expanded(...) Widget sehr nützlich sein.
*/
import 'package:flutter/material.dart';

Map<String, double> products = {
  "MacBook Pro": 2999.99,
  "iPhone 16 Pro Max": 1499.99,
  "Spiegel": 30.30,
  "Product 4": 40.0,
  "Product 5": 50.0,
};

class Task443Wiederholung3 extends StatelessWidget {
  const Task443Wiederholung3({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "ListView von Map",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: false,
          backgroundColor: const Color.fromARGB(255, 73, 148, 236),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            color: Colors.white,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Center(
          child: ListView.builder(
            itemCount: products.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                dense: false,
                leadingAndTrailingTextStyle: const TextStyle(
                    color: Color.fromARGB(255, 73, 148, 236),
                    fontWeight: FontWeight.bold),
                leading: const Icon(
                  Icons.shopping_cart,
                  color: Colors.grey,
                ),
                horizontalTitleGap: 30,
                title: Text(
                  products.keys.toList()[index],
                  style: const TextStyle(letterSpacing: 3),
                ),
                trailing: Text(
                  "\$${products.values.toList()[index].toStringAsFixed(2).replaceAll('.', ',')}",
                  style: const TextStyle(fontSize: 15),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
