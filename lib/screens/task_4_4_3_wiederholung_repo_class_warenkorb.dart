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

Map<int, Product> shoppingCart = {};

class BonnusRepoClassListWarenkorb extends StatefulWidget {
  const BonnusRepoClassListWarenkorb({super.key});

  @override
  State<BonnusRepoClassListWarenkorb> createState() =>
      _BonnusRepoClassListWarenkorbState();
}

class _BonnusRepoClassListWarenkorbState
    extends State<BonnusRepoClassListWarenkorb> {
  int incrementProduct = 1;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: const MyBottomNavigationBar(),
        appBar: AppBar(
          title: const Text(
            "ListView Warenkorb Home",
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
                onTap: () {
                  setState(() {
                    incrementProduct++;
                    shoppingCart[incrementProduct] = products[index];
                  });
                },
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
      ),
    );
  }
}

class Warenkorb extends StatefulWidget {
  const Warenkorb({super.key});

  @override
  State<Warenkorb> createState() => _WarenkorbState();
}

class _WarenkorbState extends State<Warenkorb> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: const MyBottomNavigationBar(),
        appBar: AppBar(
          title: const Text(
            "ListView Warenkorb",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: false,
          backgroundColor: const Color.fromARGB(255, 73, 148, 236),
        ),
        body: Center(
          child: ListView.builder(
            itemCount: shoppingCart.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                dense: true,
                leadingAndTrailingTextStyle: const TextStyle(
                    color: Color.fromARGB(255, 0, 20, 43),
                    fontWeight: FontWeight.bold),
                leading: shoppingCart[shoppingCart.keys.toList()[index]]?.icon,
                subtitle: Text(shoppingCart.keys.toList()[index].toString()),
                horizontalTitleGap: 30,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(5),
                ),
                onTap: () {
                  setState(() {
                    shoppingCart.remove(shoppingCart.keys.toList()[index]);
                  });
                },
                title: Text(
                  shoppingCart[shoppingCart.keys.toList()[index]]!.name,
                  style: const TextStyle(letterSpacing: 2),
                ),
                trailing: Text(
                  "\$${shoppingCart.values.toList()[index].price.toStringAsFixed(2).replaceAll('.', ',')}",
                  style: const TextStyle(
                      fontSize: 15, decoration: TextDecoration.underline),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: 0,
        onTap: (currentIndex) {
          if (currentIndex == 1) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const Warenkorb()));
          }
          if (currentIndex == 0) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const BonnusRepoClassListWarenkorb()));
          }
        },
        backgroundColor: const Color.fromARGB(255, 73, 148, 236),
        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: "Warenkorb"),
        ]);
  }
}
