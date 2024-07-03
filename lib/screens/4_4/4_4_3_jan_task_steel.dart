import 'package:flutter/material.dart';

// Task: Try to clone the same page as "assets/images/janaufgabe.png"

const Color mainColor = Color.fromARGB(255, 102, 124, 137);

class JanTaskSteel extends StatelessWidget {
  const JanTaskSteel({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: mainColor,
          title: const Text("Steel"),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: mainColor,
          child: const Icon(
            Icons.shuffle,
            size: 25,
          ),
        ),
        body: Container(
          margin: const EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                color: Colors.black,
                height: 230,
                width: 230,
                child: Image.asset(
                  "assets/images/steel.png",
                  fit: BoxFit.fitHeight,
                  alignment: Alignment.centerLeft,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                color: mainColor,
                padding: const EdgeInsets.all(10),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Name: Steel",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600)),
                    Text("Health: 500",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600)),
                    Text("Power: 80",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600)),
                    Text("Difficulty: easy",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600))
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                alignment: Alignment.center,
                child: const Text(
                  '"You may proceed. This is not a deception." - Steel',
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 14.5,
                      fontWeight: FontWeight.w600,
                      color: mainColor),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                  alignment: Alignment.center,
                  child: const Text(
                    "Steel is a melee tank who uses his shield to protect his allies. Steel can use his shield defensively to block incoming damage or offensively as a means of crowd control. Late game your ability to lock enemies down is crucial. When initiating a fight, target the enemy damage dealers and don't forget Bulwarks block enemy projectiles.",
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 14.5),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
