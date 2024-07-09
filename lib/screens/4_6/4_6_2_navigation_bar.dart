/*
Baue zunächst die drei Screens unten nach.
News
Profil
Likes
assets/images/navigationbar.png
--
Erstelle nun ein StatefulWidget names “AppHome”. Das Widget soll zunächst nur ein Scaffold mit AppBar und Titel beinhalten. 
Erstelle zur Vorbereitung für eine NavigationBar eine variable currentIndex und eine Liste “screens” aus den
drei Screen Widgets aus Aufgabe 1 in deinem StatefulWidget-State.
(Im Folgenden sollst du damit über die onDestinationSelected Funktion auf den richtigen Screen verweisen.)
--
Füge eine NavigationBar zu deinem AppHome Widget hinzu. 
Die “Destinations” der NavigationBar sollen dabei auf die drei Screens aus Aufgabe 1 führen. 


*/

import 'package:flutter/material.dart';

class NavigationBarExercise extends StatefulWidget {
  const NavigationBarExercise({super.key});

  @override
  State<NavigationBarExercise> createState() => _NavigationBarExerciseState();
}

class _NavigationBarExerciseState extends State<NavigationBarExercise> {
  Map<String, Widget> screens = {
    "News": const NewsScreen(),
    "Likes": const LikesScreen(),
    "Profile": const ProfileScreen(),
  };
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(screens.keys.toList()[currentIndex]),
          centerTitle: true,
          backgroundColor: Colors.lightGreen,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: screens.values.toList()[currentIndex],
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
            labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
              (Set<WidgetState> states) => states.contains(WidgetState.selected)
                  ? const TextStyle(color: Colors.white)
                  : const TextStyle(color: Color.fromARGB(255, 200, 255, 132)),
            ),
            iconTheme: WidgetStateProperty.resolveWith<IconThemeData>(
              (Set<WidgetState> states) => states.contains(WidgetState.selected)
                  ? const IconThemeData(color: Colors.white)
                  : const IconThemeData(
                      color: Color.fromARGB(255, 200, 255, 132)),
            ),
          ),
          child: NavigationBar(
            destinations: const [
              NavigationDestination(
                icon: Icon(
                  Icons.newspaper,
                ),
                label: "News",
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.favorite,
                ),
                label: "Likes",
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.person,
                ),
                label: "Profile",
              )
            ],
            selectedIndex: currentIndex,
            onDestinationSelected: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            backgroundColor: Colors.lightGreen,
            elevation: 3,
            indicatorColor: const Color.fromARGB(255, 64, 152, 67),
          ),
        ));
  }
}

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "News",
            style: TextStyle(fontSize: 29),
          ),
          Icon(
            Icons.newspaper,
            size: 50,
          )
        ],
      ),
    );
  }
}

class LikesScreen extends StatelessWidget {
  const LikesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(27.0),
        child: Column(
          children: [
            Text(
              "Likes",
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Hier findest du deine geliketen Nachrichten.",
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(27.0),
        child: Column(
          children: [
            Text(
              "Profile",
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(
              height: 20,
            ),
            Icon(
              Icons.person,
              size: 50,
            ),
            Text(
              "Max Mustermann",
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
    ;
  }
}
