// Erstelle die UI von dem Screenshot. (assets/images/443wiederholung_1.png)
// Hierzu musst du sowohl Column als auch Row Widgets verwenden.
// Hinweis: Beachte, wie die Elemente genau angeordnet sind.

import 'package:flutter/material.dart';

class Task443Wiederholung1 extends StatelessWidget {
  const Task443Wiederholung1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Wiederholung 4.4.3 Aufgabe 1",
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
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "A",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.amber,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "B",
                    style: TextStyle(fontSize: 30, color: Colors.red),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "C",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue,
                    ),
                  ),
                  Text(
                    "D",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.green,
                        fontStyle: FontStyle.italic),
                  ),
                ],
              ),
              Text(
                "E",
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
        ),
      ),
    );
  }
}
