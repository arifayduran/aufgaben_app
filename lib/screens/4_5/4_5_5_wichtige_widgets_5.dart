/*
1. GestureDetector (Container)
Aufgabe:
Erstelle einen roten Container, der auf einen Tap reagiert. Wenn der Container getippt wird, soll eine Snackbar angezeigt werden.

Anforderungen:
	•	Verwende einen GestureDetector, um Taps zu erkennen.
	•	Zeige eine Snackbar an, wenn der Container getippt wird.

2. ShowModalBottomSheet mit Widgets
Aufgabe:
Erstelle einen Button, der ein modales Bottom Sheet anzeigt, wenn er gedrückt wird. Das Bottom Sheet sollte Text,
einen ElevatedButton, ein Image und einen Divider enthalten, der den Text vom Button trennt.

Anforderungen:
	•	Verwende showModalBottomSheet, um das Bottom Sheet anzuzeigen.
	•	Füge Text, einen ElevatedButton, ein Image und einen Divider zum Bottom Sheet hinzu.

3. ShowBottomSheet mit Widgets
Aufgabe:
Erstelle einen Button, der ein persistentes Bottom Sheet anzeigt, wenn er gedrückt wird.
Das Bottom Sheet sollte Text, einen TextButton, ein Icon und einen Divider enthalten, der den Text vom Button trennt.

Anforderungen:
	•	Verwende showBottomSheet, um das Bottom Sheet anzuzeigen.
	•	Füge Text, einen TextButton, ein Icon und einen Divider zum Bottom Sheet hinzu.

4. SingleChildScrollView
Aufgabe:
Erstelle eine Liste von 20 Text-Widgets innerhalb eines SingleChildScrollView. Jedes Text-Widget sollte einen Index anzeigen.
Anforderungen:
	•	Verwende SingleChildScrollView, um die Liste scrollbar zu machen.
	•	Erstelle 20 Text-Widgets mit einem Index.

5. Kombination I
Aufgabe:
Erstelle eine Benutzeroberfläche mit einer Column, die zwei Card-Widgets enthält. Jede Card sollte eine Row enthalten,
die ein Icon und Text anzeigt.
Anforderungen:
	•	Verwende eine Column, um die Card-Widgets vertikal anzuordnen.
	•	Jede Card sollte eine Row enthalten, die ein Icon und Text anzeigt.

6. Kombination II
Aufgabe:
Erstelle eine Row mit drei Container-Widgets. Die beiden äußeren Container sollten eine feste Breite haben,
und der mittlere Container sollte den restlichen Platz einnehmen.
Anforderungen:
	•	Verwende Expanded, um den mittleren Container zu erweitern.
	•	Die äußeren Container sollten eine feste Breite haben.

*/

import 'package:flutter/material.dart';

class WichtigeWidgets5 extends StatelessWidget {
  const WichtigeWidgets5({super.key});

  PersistentBottomSheetController _showPersistentBottomSheet(
      BuildContext context) {
    return showBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Text"),
              const Divider(),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Close"),
              ),
              Image.asset(
                "assets/images/steel.png",
                width: 100,
                height: 100,
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wichtige Widgets V"),
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
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Tapped!"),
                    ),
                  );
                },
                child: Container(
                  color: Colors.red,
                  width: 100,
                  height: 100,
                  child: const Center(
                    child: Text("Tap me!"),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Text"),
                              const Divider(),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text("Close"),
                              ),
                              Image.asset(
                                "assets/images/steel.png",
                                width: 100,
                                height: 100,
                              ),
                            ],
                          );
                        });
                  },
                  child: const Text("Show Modal Bottom Sheet")),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    _showPersistentBottomSheet(context);
                  },
                  child: const Text("Show Persistent Bottom Sheet")),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 100,
                width: 100,
                color: Colors.blue,
                child: SingleChildScrollView(
                  child: Column(
                    children: List.generate(20, (index) {
                      return Column(
                        children: [
                          Text((index + 1).toString()),
                          const Divider(),
                        ],
                      );
                    }),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Column(
                children: [
                  Card(
                    child: Row(
                      children: [
                        Icon(Icons.abc),
                        Expanded(child: SizedBox()),
                        Text("text")
                      ],
                    ),
                  ),
                  Card(
                    child: Row(
                      children: [
                        Icon(Icons.abc),
                        Expanded(child: SizedBox()),
                        Text("text")
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    color: Colors.red,
                  ),
                  Expanded(
                      child: Container(
                    height: 50,
                    color: Colors.yellow,
                  )),
                  Container(
                    height: 50,
                    width: 50,
                    color: Colors.blue,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
