import 'package:aufgaben_app/screens/4_6.dart';
import 'package:aufgaben_app/screens/Kapitel3_dart_wiederholung_bonusse/home.dart';
import 'package:aufgaben_app/screens/timer/timer_screen.dart';
import 'package:flutter/material.dart';
import 'package:aufgaben_app/screens/4_4.dart';
import 'package:aufgaben_app/screens/4_5.dart';

/* ADD BACK BUTTON + IMPORT PACKAGE + ADD TO LIST
        appBar: AppBar(
          title: const Text("..."),
          centerTitle: true,
          backgroundColor: Colors.amber,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
*/

const Map<String, Widget> tasks = {
  '4.4.': Tasks44(),
  "4.5.": Tasks45(),
  "4.6.": Tasks46(),
  "Kapitel 3 Dart Wied. Bonusse": BonusHomeScreen(),
  "Timer": TimerScreen(),
};

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Aufgaben'),
          backgroundColor: Colors.redAccent,
        ),
        body: Center(
          child: SizedBox(
            width: 340,
            height: 650,
            child: GridView.builder(
                itemCount: tasks.keys.length,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 80,
                    crossAxisSpacing: 30,
                    mainAxisSpacing: 20),
                itemBuilder: (BuildContext context, int index) {
                  String title = tasks.keys.elementAt(index);
                  Widget pageWidget = tasks.values.elementAt(index);
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
                          WidgetStateProperty.all<Color>(Colors.redAccent),
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
