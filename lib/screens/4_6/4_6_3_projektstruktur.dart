/*
In den kommenden Aufgaben wollen wir folgende Screens entwickeln: 

assets/images/463Projektstruktur.png

Aufgabe 1:
  Erstelle dafür ein neues Flutter Projekt. Darin erstellst du zunächst eine Ordnerstruktur nach dem Feature-First Muster aus der Vorlesung, inklusive eines src, core und feature Ordners. 
  Innerhalb des feature Ordners kannst du dann Ordner für die jeweiligen Features anlegen: 
  Feature 1: “todos”
  Feature 2: “profile”
  Erinnere dich daran, welche “Layer” innerhalb der Feature Ordner verwendet werden und erstelle auch sie.  

Aufgabe 2:
  Entwickle nun das Todo-Feature nach dem Abbild oben. Verwende dabei mindestens 2 dart Dateien und lagare deine Bauteile in unterschiedliche Widgets aus. Beispiele hierfür sind: 

  todo_screen.dart
  todo_item.dart

  Mache dir klar, wo du diese Dateien platzieren solltest, damit dein Projekt übersichtlich bleibt.

Aufgabe 3:

  Entwickle nun das Profil-Feature nach dem Abbild oben. Verwende dabei mindestens 2 dart Dateien und lagare deine Bauteile in unterschiedliche Widgets aus. Beispiele hierfür sind: 

  profile_screen.dart
  user_info.dart (Der Steckbrief)

  Mache dir klar, wo du diese Dateien platzieren solltest, damit dein Projekt übersichtlich bleibt.

Aufgabe 4:
  Erstelle nun ein StatefulWidget namens “AppHome”. Das Widget soll zunächst nur ein Scaffold mit AppBar und Titel beinhalten. Wo sollte die Datei dieses Widgets liegen?

  Erstelle zur Vorbereitung für eine NavigationBar eine variable currentIndex und eine Liste “screens”, bestehend aus den beiden Screen Widgets aus den letzten Aufgaben in deinem StatefulWidget-State.

  (Im Folgenden sollst du damit über die onDestinationSelected Funktion auf den richtigen Screen verweisen.)

Aufgabe 5:

  Füge eine NavigationBar zu deinem AppHome Widget hinzu. 

  Die “Destinations” der NavigationBar sollen dabei auf die beiden unterschiedlichen Screens führen. 
*/

// Ich habe die Projektstruktur in mein eigenen Projekt angewendet, da diese Aufgabenapp nicht geeignet dafür ist.

import 'package:flutter/material.dart';

Map<String, Widget> screens = {
  "Todos": const TodoScreen(),
  "Profile": const ProfileScreen()
};

Map<String, String> todos = {
  "Einkauf erledigen": "Milch, Brot, Gemüse und Obst im Supermartk kaufen.",
  "Projekt abschließen": "Finalen Bericht schreiben und Presentation erstelen.",
  "Haus putzen": "Staub wischen, Boden saugen und Bad putzen,"
};

int _currentIndex = 0;

class ProjectStructure extends StatefulWidget {
  const ProjectStructure({super.key});

  @override
  State<ProjectStructure> createState() => _ProjectStructureState();
}

class _ProjectStructureState extends State<ProjectStructure> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            "MyApp",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: screens.values.elementAt(_currentIndex),
        ),
        bottomNavigationBar: NavigationBar(
          destinations: const [
            NavigationDestination(
              icon: Icon(
                Icons.task,
              ),
              label: "Todos",
            ),
            NavigationDestination(
              icon: Icon(
                Icons.person,
              ),
              label: "Profil",
            ),
          ],
          selectedIndex: _currentIndex,
          onDestinationSelected: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          elevation: 3,
          indicatorColor: Colors.blue,
        ));
  }
}

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 100,
          child: Align(
            alignment: Alignment.center,
            child: Text(
              screens.keys.elementAt(_currentIndex),
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 35),
            ),
          ),
        ),
        SizedBox(
          height: 400,
          width: 320,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ListView.builder(
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      onTap: () {},
                      title: Text(todos.keys.elementAt(index)),
                      subtitle: Text(todos.values.elementAt(index)),
                    ),
                  );
                }),
          ),
        ),
      ],
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100,
          child: Align(
            alignment: Alignment.center,
            child: Text(
              screens.keys.elementAt(_currentIndex),
              style: const TextStyle(fontSize: 35),
            ),
          ),
        ),
        const Icon(
          Icons.person,
          size: 60,
        ),
        const SizedBox(
          height: 50,
        ),
        const SizedBox(
          height: 30,
          child: Text(
            "Steckbrief",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 170,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Erika Mustermann",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "32 Jahre",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "Adalbertstraße 5",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "Berlin",
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
        )
      ],
    );
  }
}
