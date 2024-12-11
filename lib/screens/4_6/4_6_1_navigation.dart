/*
Aufgabe 1:
  Baue zunächst die Screens unten nach. Verwende ein beliebiges Icon und einen FAB.
  Hinweis: Der Pfeil auf dem rechten Screenshot muss selbst nicht eingebaut werden.

assets/images/fab_navigation.png

Aufgabe 2:
  Es soll nun möglich sein, vom HomeScreen (dem linken Screen) auf den DetailsScreen (den rechten Screen) navigieren zu können.
  Füge also Funktionalität ein, sodass beim Tappen des Buttons unten rechts auf dem HomeScreen zum DetailsScreen navigiert wird.
  Nun sollte im DetailsScreen auch automatisch der Pfeil oben erscheinen, wenn dorthin navigiert wird.

Aufgabe 3:
  Der DetailsScreen soll nun das Produkt von außen übergeben bekommen, also als Argument in der Navigation.
  Baue den DetailsScreen so um, dass er Daten übergeben bekommen kann.
  Erstelle ein Objekt der Produkt-Klasse in HomeScreen.
  Übergebe das Produkt als Parameter bei der Navigation.
  Baue den DetailsScreen so um, dass er die Daten, die ihm übergeben wurden, anzeigt.

Aufgabe 4:
  Füge im DetailsScreen einen Button hinzu, der es dem Benutzer ermöglicht, zum HomeScreen zurückzunavigieren.
  Hinweis: Du kannst zum Beispiel einen OutlinedButton oder ElevatedButton verwenden. Diese haben ein child und eine onPressed.
*/

import 'package:flutter/material.dart';

class Product {
  String title;
  String description;
  double price;
  Image? image;

  Product(this.title, this.description, this.price, {this.image});
}

List<Product> products = [
  Product("Hemd", "Ein Hemd, dass wirklich gut passt", 49.99,
      image: Image.asset("assets/images/hemd.jpg")),
  Product("Hose", "Eine Hose, die wirklich gut passt", 29.99,
      image: Image.network(
        "https://api.meleven.de/out/engbers/h_747,w_560,m_limit,o_resize/27.1d.f9.32648front.jpg",
      )),
  Product("Hut", "Ein Hut, dass sehr gut aussieht", 24.99),
  Product("Socken", "Ein paar Socken, die bequem sind", 9.99),
  Product("Kopf", "Ein Kopf aus Stahl", 999.99,
      image: Image.asset("assets/images/steel.png")),
];

Map<Product, int> shoppingCart = {};

int? choosenProduct;
int itemCount = shoppingCart.length;
double totalAmount = 0;

class FabNavigation extends StatefulWidget {
  const FabNavigation({super.key});

  @override
  State<FabNavigation> createState() => _FabNavigationState();
}

class _FabNavigationState extends State<FabNavigation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Produkte"),
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "Schaue ein schönes Produkt an, indem du ein Produkt auswählst und dann auf FAB drückst:",
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SizedBox(
                height: 400,
                child: ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        onTap: () {
                          setState(() {
                            choosenProduct = index;
                          });
                        },
                        leading: SizedBox(
                          height: 50,
                          width: 70,
                          child: products[index].image ??
                              Image.asset(
                                "assets/images/noimage.jpg",
                              ),
                        ),
                        trailing: Text(
                            "${products[index].price.toStringAsFixed(2).replaceAll(".", ",")} €"),
                        splashColor: Colors.redAccent.withValues(alpha: .2),
                        horizontalTitleGap: 10,
                        title: Text(
                          products[index].title,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        dense: true,
                        subtitle: Text(products[index].description),
                        shape: Border.all(
                          color: Colors.grey,
                        ),
                      );
                    }),
              ),
            ),
            const Text("Ausgewähltes Produkt:"),
            Text(
              choosenProduct != null ? products[choosenProduct!].title : "",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (choosenProduct == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Sie haben nichts ausgewählt!"),
                            ),
                          );
                        } else {
                          if (shoppingCart
                              .containsKey(products[choosenProduct!])) {
                            shoppingCart[products[choosenProduct!]] =
                                (shoppingCart[products[choosenProduct!]] ?? 0) +
                                    1;
                            totalAmount += products[choosenProduct!].price;
                          } else {
                            shoppingCart[products[choosenProduct!]] = 1;
                            totalAmount += products[choosenProduct!].price;
                          }
                        }

                        itemCount = shoppingCart.length;
                      });
                    },
                    style: const ButtonStyle(
                        foregroundColor: WidgetStatePropertyAll(Colors.black),
                        backgroundColor: WidgetStatePropertyAll(
                            Color.fromARGB(255, 232, 232, 232))),
                    child: const Text("Zum Warenkorb Hinzufügen")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailsScreen(
                                    choosenProductDetails:
                                        choosenProduct != null
                                            ? products[choosenProduct!]
                                            : null,
                                  )));
                    },
                    style: const ButtonStyle(
                        foregroundColor: WidgetStatePropertyAll(Colors.black),
                        backgroundColor: WidgetStatePropertyAll(
                            Color.fromARGB(255, 232, 232, 232))),
                    child: const Text("Details anzeigen")),
              ],
            ),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        height: 75,
        width: 60,
        child: Stack(
          children: [
            Positioned(
              right: 4,
              bottom: 4,
              child: FloatingActionButton(
                onPressed: () {
                  cardBottomSheet(context);
                },
                elevation: 2,
                backgroundColor: const Color.fromARGB(255, 211, 211, 211),
                child: const Icon(
                  Icons.shopping_cart,
                  color: Colors.black,
                ),
              ),
            ),
            itemCounter(),
          ],
        ),
      ),
    );
  }

  Positioned itemCounter() {
    if (itemCount == 0) {
      return const Positioned(
        child: SizedBox(),
      );
    } else {
      return Positioned(
        right: 0,
        top: 0,
        child: Container(
          margin: const EdgeInsets.fromLTRB(0, 5, 5, 0),
          height: 20,
          width: 20,
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(25)),
          child: Center(
            child: Text(
              itemCount.toString(),
            ),
          ),
        ),
      );
    }
  }

  void cardBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 500,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                    child: ListView.builder(
                        itemCount: shoppingCart.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            onTap: () {
                              setState(() {
                                // if (shoppingCart.values.toList()[index] > 1) {
                                //   shoppingCart.values.toList()[index]--;
                                // } else if (shoppingCart.values
                                //         .toList()[index] ==
                                //     1) {
                                //   shoppingCart.remove(
                                //       shoppingCart.keys.toList()[index]);
                                // }
                                // totalAmount -=
                                //     shoppingCart.keys.toList()[index].price;
                              });
                            },
                            leading: SizedBox(
                              height: 20,
                              width: 40,
                              child: Text(
                                  "${shoppingCart.values.toList()[index]} St."),
                            ),
                            trailing: Text(
                                "Gesamtpreis: ${(shoppingCart.keys.toList()[index].price * shoppingCart.values.toList()[index]).toStringAsFixed(2).replaceAll(".", ",")} €"),
                            shape: Border.all(
                              color: Colors.grey,
                            ),
                            horizontalTitleGap: 10,
                            dense: true,
                            title:
                                Text(shoppingCart.keys.toList()[index].title),
                            subtitle: Text(
                                "Stückpreis: ${shoppingCart.keys.toList()[index].price.toStringAsFixed(2).replaceAll(".", ",")} €"),
                          );
                        })),
                const SizedBox(
                  height: 30,
                ),
                Text(
                    "Gesamtpreis: ${totalAmount.toStringAsFixed(2).replaceAll(".", ",")} €"),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: const ButtonStyle(
                        foregroundColor: WidgetStatePropertyAll(Colors.black),
                        backgroundColor: WidgetStatePropertyAll(
                            Color.fromARGB(255, 232, 232, 232))),
                    child: const Text("Schliessen")),
                const SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class DetailsScreen extends StatelessWidget {
  final Product? choosenProductDetails;
  const DetailsScreen({super.key, this.choosenProductDetails});

  Image _productImage() {
    if (choosenProductDetails == null) {
      return Image.asset("assets/images/noimage.jpg");
    } else {
      if (choosenProductDetails!.image == null) {
        return Image.asset("assets/images/noimage.jpg");
      } else {
        return choosenProductDetails!.image!;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(choosenProductDetails != null
            ? "Details zu ${choosenProductDetails!.title}"
            : "Kein Produkt ausgewählt"),
        centerTitle: false,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                choosenProductDetails != null
                    ? choosenProductDetails!.title
                    : "",
                style: const TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Text(
                choosenProductDetails != null
                    ? choosenProductDetails!.description
                    : "",
                style: const TextStyle(fontSize: 12),
              ),
            ),
            Text(
              choosenProduct != null
                  ? "Preis: ${choosenProductDetails!.price.toStringAsFixed(2).replaceAll(".", ",")} €"
                  : "",
              style: const TextStyle(fontSize: 12),
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(height: 200, width: 200, child: _productImage()),
            const Expanded(child: SizedBox()),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: const ButtonStyle(
                    foregroundColor: WidgetStatePropertyAll(Colors.black),
                    backgroundColor: WidgetStatePropertyAll(
                        Color.fromARGB(255, 200, 200, 200))),
                child: const Text("Zurück zu den Produkten")),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
