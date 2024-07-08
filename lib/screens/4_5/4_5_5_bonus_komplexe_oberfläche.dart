/*
Bonus Komplexe Oberfläche
Aufgabe:
Erstelle eine komplexe Benutzeroberfläche, die mehrere Widgets kombiniert. Die Oberfläche sollte eine AppBar,
eine Column mit mehreren Card-Widgets, einen FloatingActionButton, ein Drawer und ein modales Bottom Sheet enthalten.
Jede Card sollte eine Row mit einem Icon, Text und einem Expanded-Widget enthalten.
Der FloatingActionButton sollte ein modales Bottom Sheet anzeigen, wenn er gedrückt wird.

Anforderungen:
	•	Eine AppBar mit einem Titel.
	•	Eine Column mit mehreren Card-Widgets, die Row, Icon, Text und Expanded enthalten.
	•	Ein FloatingActionButton, der ein modales Bottom Sheet anzeigt.
	•	Ein Drawer mit mehreren Listeneinträgen.
	•	Das modale Bottom Sheet sollte Text, einen ElevatedButton und ein Image enthalten.
*/

import 'package:flutter/material.dart';

class BonusKomplexeOberflaeche extends StatelessWidget {
  const BonusKomplexeOberflaeche({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bonus Komplexe Oberfläche"),
        centerTitle: true,
        backgroundColor: Colors.amber,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      endDrawer: Drawer(
        backgroundColor: Colors.amber,
        child: SizedBox(
          height: 900,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              15,
              (index) {
                return Card(
                  child: Row(
                    children: [
                      const Icon(Icons.abc),
                      const Expanded(child: SizedBox()),
                      Text("text ${index + 1}")
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return SizedBox(
                  width: double.infinity,
                  height: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Text"),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Icon(Icons.exit_to_app),
                      ),
                      Image.asset(
                        "assets/images/steel.png",
                        height: 100,
                      )
                    ],
                  ),
                );
              });
        },
        backgroundColor: Colors.amber,
        child: const Icon(Icons.kayaking),
      ),
      body: SizedBox(
        height: 400,
        child: SingleChildScrollView(
          child: Column(
            children: List.generate(
              40,
              (index) {
                return Card(
                  child: Row(
                    children: [
                      const Icon(Icons.abc),
                      const Expanded(child: SizedBox()),
                      Text("text ${index + 1}")
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
