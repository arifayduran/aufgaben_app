import 'package:flutter/material.dart';

class Product {
  String name;
  double price;
  Icon icon;

  Product(this.name, this.price, this.icon);
}

List<Product> products = [
  Product("MacBook Pro", 2999.99, const Icon(Icons.laptop_mac)),
  Product("iPhone 16 Pro Ma", 1499.99, const Icon(Icons.phone_iphone)),
  Product("Playstation 7", 699.99, const Icon(Icons.games)),
];

class BonnusRepoClassList extends StatelessWidget {
  const BonnusRepoClassList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ListView Repository-Klasse",
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
              dense: true,
              leadingAndTrailingTextStyle: const TextStyle(
                  color: Color.fromARGB(255, 0, 20, 43),
                  fontWeight: FontWeight.bold),
              leading: products[index].icon,
              horizontalTitleGap: 30,
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(5),
              ),
              title: Text(
                products[index].name,
                style: const TextStyle(letterSpacing: 2),
              ),
              trailing: Text(
                "\$${products[index].price.toStringAsFixed(2).replaceAll('.', ',')}",
                style: const TextStyle(
                    fontSize: 15, decoration: TextDecoration.underline),
              ),
            );
          },
        ),
      ),
    );
  }
}
