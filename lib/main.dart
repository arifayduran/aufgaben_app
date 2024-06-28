import 'package:aufgaben_app/screens/task_4_4_3_bonus.dart';
import 'package:aufgaben_app/screens/jan_task_steel.dart';
import 'package:flutter/material.dart';

/* ADD BACK BUTTON + IMPORT PACKAGE + ADD TO LIST
        appBar: AppBar(
          title: const Text("..."),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
*/

const Map<String, Widget> tasks = {
  'Jan Task Steel': JanTaskSteel(),
  "Tasksheet 4.4.3": Task443Calculator(),
  "leer1": Placeholder(),
  "leer2": Placeholder(),
  "leer3": Placeholder(),
  "leer4": Placeholder(),
  "leer5": Placeholder(),
  "leer6": Placeholder(),
  "leer7": Placeholder(),
  "leer8": Placeholder(),
  "leer9": Placeholder(),
  "leer10": Placeholder(),
  "leer11": Placeholder(),
};

void main() {
  runApp(const HomeScreen());
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Aufgaben'),
              backgroundColor: Colors.amber,
            ),
            body: Center(
              child: SizedBox(
                width: 340,
                height: 650,
                child: GridView.builder(
                    itemCount: tasks.keys.length,
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
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
                          padding:
                              const WidgetStatePropertyAll(EdgeInsets.all(10)),
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
            )));
  }
}