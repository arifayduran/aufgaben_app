/*
1. Einfache Bildergalerie
  Erstelle eine Bildergalerie mit drei Bildern. Verwende Column und SizedBox, um zwischen den Bildern Abstände zu schaffen.
	•	Erstelle ein StatelessWidget, das eine Column enthält.
	•	Füge drei Image.network Widgets hinzu.
	•	Verwende SizedBox, um zwischen den Bildern einen Abstand von 10 Pixeln zu schaffen.

2. Geteilte Liste mit Dividern
  Erstelle eine Liste mit drei Text-Widgets, die durch Divider getrennt sind.

	•	Erstelle ein StatelessWidget, das eine Column enthält.
	•	Füge drei Text Widgets hinzu.
	•	Füge zwischen jedem Text-Widget einen Divider hinzu.

3. Icon mit Beschriftung
  Erstelle eine Row, die ein Icon und einen daneben stehenden Text enthält.

	•	Erstelle ein StatelessWidget, das eine Row enthält.
	•	Füge ein Icon und ein Text Widget hinzu.
	•	Verwende SizedBox, um zwischen dem Icon und dem Text einen Abstand von 8 Pixeln zu schaffen.

4. Layout mit Row und Column
  Erstelle ein Layout, das eine Row mit zwei Columns enthält. Jede Column enthält zwei Text Widgets.

	•	Erstelle ein StatelessWidget, das eine Row enthält.
	•	Füge zwei Expanded Widgets hinzu, die jeweils eine Column enthalten.
	•	Jede Column enthält zwei Text Widgets.
*/

import 'package:flutter/material.dart';

class Task444WichtigeWidgets2 extends StatelessWidget {
  const Task444WichtigeWidgets2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "4.4.3 Wichtige Widgets II",
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.photo),
                SizedBox(
                  width: 8,
                ),
                Text("Fotogalerie")
              ],
            ),
            const Divider(
              height: 40,
              indent: 30,
              endIndent: 30,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Image.network(
                  "https://www.civitatis.com/blog/wp-content/uploads/2024/03/shutterstock_2111302769-2048x1373.jpg",
                  height: 180,
                ),
                const Text(
                  "Istan-bool",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )
              ],
            ),
            const Divider(
              height: 40,
              indent: 30,
              endIndent: 30,
            ),
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Image.network(
                  "https://www.civitatis.com/blog/wp-content/uploads/2024/03/shutterstock_1676324083-2048x1365.jpg",
                  height: 180,
                ),
                const SizedBox(
                  width: 180,
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text("Hallo"),
                            Text("Hallo"),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text("Hallo"),
                            Text("Hallo"),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            const Divider(
              height: 40,
              indent: 30,
              endIndent: 30,
            ),
            Image.network(
              "https://www.civitatis.com/blog/wp-content/uploads/2024/03/shutterstock_2243405371-2048x1365.jpg",
              height: 180,
            ),
          ],
        ),
      ),
    );
  }
}
