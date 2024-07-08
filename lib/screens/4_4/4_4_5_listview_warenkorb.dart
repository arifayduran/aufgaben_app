/*
Aufhübschung
Aufgabe “Columns and Rows”
Findest du eine Möglichkeit, die Boxen in Aufgabe 1 besser aussehen zu lassen? Dies könnte zum Beispiel durch Farben oder Ähnliches sein.

Wende die Möglichkeiten an 🙂
Aufgabe “ListView”
Bisher heißen die Produkte “Produkt 1”, “Produkt 2” etc. Ändere die Namen in etwas besseres. Dabei darfst du dich gerne von deinen Hobbies und Interessen leiten lassen.

Außerdem bietet sich eine ListTile für die Darstellung der einzelnen Produkte an.  Informiere dich darüber, wie diese funktioniert, und verwende die ListTile, um die einzelnen Produkte anzuzeigen.

Wenn die ListTile eingebaut ist, kannst du auch mit den verschiedenen Arten von ListTile herumspielen und schauen, welche dir von der Anzeige her am besten gefällt (mit/ohne Leading, mit/ohne Titel, dense, …).


Repository-Klasse (mittelschwer)
Hier soll die ListView-Aufgabe angepasst werden.

Die einzelnen Produkte der ListView-Aufgabe sind vermutlich noch direkt in derselben Datei wie der restliche Code. Diese sollen nun in einem Repository gespeichert werden.

Hierfür bietet sich der folgende Ansatz an:
Umbau auf Product-Klasse
Falls noch nicht geschehen, erstelle eine Klasse Product, die die Daten der einzelnen Produkte enthält (Preis, Name, …). Diese Klasse ist kein Widget! Sie soll nur die Daten für ein Product enthalten.
Erstelle eine Liste von Produkten, jetzt mit der Product-Klasse.
Baue die ListView so um, dass sie die Product-Klassen verwendet, also die Daten daraus anzeigt.
Erstellung Repository
Erstelle eine Klasse ProductRepository, in einer eigenen Datei.
Das ProductRepository soll die Liste an Produkten enthalten und eine Methode, um diese abzurufen. Die Methode gibt also alle Produkte zurück.
Verwendung Repository
Nun sollen die Produkte aus dem ProductRepository in der ListView angezeigt werden.

Lege hierfür ein Objekt der Klasse ProductRepository in der main-Funktion an. Dieses Objekt soll der Klasse, die die ListView enthält, als Attribut übergeben werden. 
Baue also ein entsprechendes Attribut in das Widget ein, das die ListView enthält.
Übergebe das ProductRepository, das in der main-Funktion erstellt wurde, an das Widget.
Verwende in der ListView nun die Produkte aus dem ProductRepository.

Warenkorb (sehr schwer!)
Kannst du eine funktionierende Warenkorbanzeige einbauen?

Es soll irgendwo angezeigt werden, wie viele Produkte im Warenkorb sind.

Bei einem Klick auf das Warenkorb-Icon eines Produktes soll dieses in den Warenkorb gelegt werden. Ist das Produkt bereits im Warenkorb, soll dieses wieder herausgenommen werden.

Wenn ein Produkt im Warenkorb ist, soll das Warenkorb-Icon eine andere Farbe haben.
*/

import 'package:flutter/material.dart';

int incrementProduct = 1;

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

double totalPrice() {
  double summe = 0.0;
  for (Product product in shoppingCart.values) {
    summe += product.price;
  }
  return summe;
}

class BonnusRepoClassListWarenkorb extends StatefulWidget {
  const BonnusRepoClassListWarenkorb({super.key});

  @override
  State<BonnusRepoClassListWarenkorb> createState() =>
      _BonnusRepoClassListWarenkorbState();
}

class _BonnusRepoClassListWarenkorbState
    extends State<BonnusRepoClassListWarenkorb> {
  int itemCount = shoppingCart.length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  backgroundColor: const Color.fromARGB(255, 73, 148, 236),
                  child: const Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
                ),
              ),
              itemCounter(),
            ],
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
                    itemCount = shoppingCart.length + 1;
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
                  "\$ ${products[index].price.toStringAsFixed(2).replaceAll('.', ',')}",
                  style: const TextStyle(
                      fontSize: 15, decoration: TextDecoration.underline),
                ),
              );
            },
          ),
        ),
      
    );
  }

  void cardBottomSheet(BuildContext context) {
    showBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox.expand(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text('Bottom sheet'),
                ElevatedButton(
                  child: const Text('Close'),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
        );
      },
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
}

class Warenkorb extends StatefulWidget {
  const Warenkorb({super.key});

  @override
  State<Warenkorb> createState() => _WarenkorbState();
}

class _WarenkorbState extends State<Warenkorb> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          child: Column(
            children: [
              SizedBox(
                height: 600,
                child: ListView.builder(
                  itemCount: shoppingCart.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      dense: true,
                      leadingAndTrailingTextStyle: const TextStyle(
                          color: Color.fromARGB(255, 0, 20, 43),
                          fontWeight: FontWeight.bold),
                      leading:
                          shoppingCart[shoppingCart.keys.toList()[index]]?.icon,
                      subtitle:
                          Text(shoppingCart.keys.toList()[index].toString()),
                      horizontalTitleGap: 30,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      onTap: () {
                        setState(() {
                          shoppingCart
                              .remove(shoppingCart.keys.toList()[index]);
                        });
                      },
                      title: Text(
                        shoppingCart[shoppingCart.keys.toList()[index]]!.name,
                        style: const TextStyle(letterSpacing: 2),
                      ),
                      trailing: Text(
                        "\$ ${shoppingCart.values.toList()[index].price.toStringAsFixed(2).replaceAll('.', ',')}",
                        style: const TextStyle(
                            fontSize: 15, decoration: TextDecoration.underline),
                      ),
                    );
                  },
                ),
              ),
              Text(
                  "Gesamtsumme: \$ ${totalPrice().toStringAsFixed(2).replaceAll('.', ',')}"),
            ],
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
