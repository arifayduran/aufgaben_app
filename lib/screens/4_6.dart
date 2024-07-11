import 'package:aufgaben_app/screens/4_6/4_6_1_navigation.dart';
import 'package:aufgaben_app/screens/4_6/4_6_2_navigation_bar_with_like.dart';
import 'package:aufgaben_app/screens/4_6/4_6_3_projektstruktur.dart';
import 'package:aufgaben_app/screens/4_6/4_6_4_gallery_sushiyana.dart';
import 'package:flutter/material.dart';

const Map<String, Widget> tasks46 = {
  "FAB Navigation": FabNavigation(),
  "Navigation Bar mit Favoriten": NavigationBarWithLike(),
  "Projektstrukturen": ProjectStructure(),
  "Gallerie Sushi Yana": GallerySushiyana()
};

class Tasks46 extends StatelessWidget {
  const Tasks46({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Aufgaben von 4.6."),
          centerTitle: true,
          backgroundColor: Colors.yellow,
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
                itemCount: tasks46.keys.length,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 80,
                    crossAxisSpacing: 30,
                    mainAxisSpacing: 20),
                itemBuilder: (BuildContext context, int index) {
                  String title = tasks46.keys.elementAt(index);
                  Widget pageWidget = tasks46.values.elementAt(index);
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
                          WidgetStateProperty.all<Color>(Colors.yellow),
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
