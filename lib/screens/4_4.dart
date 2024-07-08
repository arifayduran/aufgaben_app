import 'package:aufgaben_app/screens/4_4/4_4_3_free_bonus.dart';
import 'package:aufgaben_app/screens/4_4/4_4_3_jan_task_steel.dart';
import 'package:aufgaben_app/screens/4_4/4_4_3_abcde.dart';
import 'package:aufgaben_app/screens/4_4/4_4_3_sizedbox_exercise.dart';
import 'package:aufgaben_app/screens/4_4/4_4_5_listview_map.dart';
import 'package:aufgaben_app/screens/4_4/4_4_5_listview_class.dart';
import 'package:aufgaben_app/screens/4_4/4_4_5_listview_warenkorb.dart';
import 'package:flutter/material.dart';

const Map<String, Widget> tasks44 = {
  'Jan Task Steel': JanTaskSteel(),
  "Free Bonus": Task443Calculator(),
  "ABCDE": Task443Wiederholung1(),
  "SizedBox Exercise": Task443Wiederholung2(),
  "ListView von Map": Task443Wiederholung3(),
  "ListView von Klasse": BonnusRepoClassList(),
  "ListView Warenkorb": BonnusRepoClassListWarenkorb(),
};

class Tasks44 extends StatefulWidget {
  const Tasks44({super.key});

  @override
  State<Tasks44> createState() => _Tasks44State();
}

class _Tasks44State extends State<Tasks44> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Aufgaben von 4.4."),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 73, 148, 236),
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
                itemCount: tasks44.keys.length,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 80,
                    crossAxisSpacing: 30,
                    mainAxisSpacing: 20),
                itemBuilder: (BuildContext context, int index) {
                  String title = tasks44.keys.elementAt(index);
                  Widget pageWidget = tasks44.values.elementAt(index);
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
                      backgroundColor: WidgetStateProperty.all<Color>(
                          const Color.fromARGB(255, 73, 148, 236)),
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
