/*
Nutze dein Wissen aus Aufgabe 4 und Bonus 1, um eine Checklisten-App nach folgenden Anforderungen zu erzeugen. 

Die App Soll zwischen 2 Screens Navigierbar sein
Auf Screen 1 Soll eine Übersicht über die Checklisten-Einträge zu sehen sein
Auf Screen 2  soll ein Input Feld zu sehen sein, das einen neuen Checklisten-Eintrag erstellt
Jeder ausgefüllte Eintrag soll über einen “Hinzufügen” Button zu der Übersicht auf Screen 1 hinzugefügt werden
Optional: Die Einträge auf der Übersicht in Screen 1 sollen über einen Button aus der Liste gelöscht werden können
Tipp: Hier bietet sich eine removeItem() funktion an. 

Der Rest ist dir überlassen! Sei kreativ und weite die App nach deinen Vorstellungen aus. 
*/

import 'package:aufgaben_app/screens/Kapitel3_dart_wiederholung_bonusse/add_item_screen.dart';
import 'package:aufgaben_app/screens/Kapitel3_dart_wiederholung_bonusse/domain/checklist_database.dart';
import 'package:flutter/material.dart';

void main() => runApp(const ChecklistApp());

class ChecklistApp extends StatelessWidget {
  const ChecklistApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Checklist App',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const ChecklistScreen(),
    );
  }
}

class ChecklistScreen extends StatefulWidget {
  const ChecklistScreen({super.key});

  @override
  State<ChecklistScreen> createState() => _ChecklistScreenState();
}

class _ChecklistScreenState extends State<ChecklistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checklist'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: ChecklistDatabase.checklistDatabase.length,
                itemBuilder: (context, index) {
                  String key =
                      ChecklistDatabase.checklistDatabase.keys.elementAt(index);
                  return Column(
                    children: [
                      ListTile(
                        title: Text(key),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  ChecklistDatabase.checklistDatabase[key] =
                                      !ChecklistDatabase
                                          .checklistDatabase[key]!;
                                });
                              },
                              child: Icon(
                                ChecklistDatabase.checklistDatabase[key]!
                                    ? Icons.check_box
                                    : Icons.check_box_outline_blank,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.delete,
                              ),
                              onPressed: () {
                                setState(() {
                                  ChecklistDatabase.removeItem(key);
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      const Divider(),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddItemScreen()),
          ).then((_) {
            setState(() {});
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
