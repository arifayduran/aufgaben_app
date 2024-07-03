/*
5. Kombination
Aufgabe:
  Erstelle eine komplexe Benutzeroberfläche, die alle bisher besprochenen Widgets kombiniert.
  Die Benutzeroberfläche sollte eine Column enthalten, die zwei Card-Widgets enthält.
  Jedes Card-Widget sollte eine Row mit einem Icon und Text enthalten. Die Cards sollten durch einen Divider getrennt sein.
  Die erste Karte sollte eine onTap-Aktion haben, die einen AlertDialog anzeigt. Der Dialog sollte eine “OK”-Schaltfläche haben,
  die eine Snackbar anzeigt, wenn sie gedrückt wird. Die zweite Karte sollte ein TextButton enthalten, der eine Snackbar anzeigt,
  wenn er gedrückt wird. Verwende das Expanded-Widget, um den Platz in den Rows auszufüllen.

Anforderungen:
	1.	Die Column sollte zwei Card-Widgets enthalten.
	2.	Jede Card sollte eine Row enthalten, die ein Icon und einen Text enthält.
	3.	Die Card-Widgets sollten durch einen Divider getrennt sein.
	4.	Die erste Card sollte eine onTap-Aktion haben, die einen AlertDialog anzeigt.
	5.	Der AlertDialog sollte eine “OK”-Schaltfläche haben, die eine Snackbar anzeigt, wenn sie gedrückt wird.
	6.	Die zweite Card sollte ein TextButton enthalten, der eine Snackbar anzeigt, wenn er gedrückt wird.
	7.	Verwende das Expanded-Widget, um den Platz in den Rows auszufüllen.
*/

import 'package:flutter/material.dart';

void main() {
  runApp(const Kombination453());
}

class Kombination453 extends StatelessWidget {
  const Kombination453({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Kombination"),
          centerTitle: true,
          backgroundColor: Colors.amber,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Center(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Alert Dialog"),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Snackbar durch AlertDialog"),
                                  ),
                                );
                              },
                              child: const Text("OK"))
                        ],
                      );
                    },
                  );
                },
                child: const Card(
                  child: Row(
                    children: [
                      Icon(Icons.gamepad),
                      Expanded(child: SizedBox()),
                      Text("AlertDialog Card, GestureDetector"),
                    ],
                  ),
                ),
              ),
              const Divider(),
              Card(
                child: Row(
                  children: [
                    const Icon(Icons.sos),
                    const Expanded(child: SizedBox()),
                    TextButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Snackbar durch TextButton"),
                          ),
                        );
                      },
                      child: const Text("Snackbar Card, TextButton"),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
