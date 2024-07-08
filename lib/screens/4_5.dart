import 'package:aufgaben_app/screens/4_5/4_5_2_wichtige_widgets_3.dart';
import 'package:aufgaben_app/screens/4_5/4_5_3_kombination.dart';
import 'package:aufgaben_app/screens/4_5/4_5_3_wichtige_widgets_4.dart';
import 'package:aufgaben_app/screens/4_5/4_5_5_bonus_komplexe_oberfl%C3%A4che.dart';
import 'package:aufgaben_app/screens/4_5/4_5_5_wichtige_widgets_5.dart';

import 'package:flutter/material.dart';

const Map<String, Widget> tasks45 = {
  "Wichtige Widgets III": Task443WichtigeWidgets2(),
  "Wichtige Widgets IV": Task453WichtigeWidgets4(),
  "Kombination": Kombination453(),
  "Wichtige Widgets V": WichtigeWidgets5(),
  "Bonus Komplexe Oberfläche": BonusKomplexeOberflaeche(),
};

class Tasks45 extends StatelessWidget {
  const Tasks45({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Aufgaben von 4.5."),
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
          child: SizedBox(
            width: 340,
            height: 650,
            child: GridView.builder(
                itemCount: tasks45.keys.length,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 80,
                    crossAxisSpacing: 30,
                    mainAxisSpacing: 20),
                itemBuilder: (BuildContext context, int index) {
                  String title = tasks45.keys.elementAt(index);
                  Widget pageWidget = tasks45.values.elementAt(index);
                  return ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => pageWidget),
                      );
                    },
                    style: ButtonStyle(
                      elevation: const WidgetStatePropertyAll(7),
                      padding: const WidgetStatePropertyAll(EdgeInsets.all(10)),
                      shape: const WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                      ),
                      backgroundColor:
                          WidgetStateProperty.all<Color>(Colors.amber),
                    ),
                    child: Text(
                      title,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  );
                }),
          ),
        ));
  }
}
