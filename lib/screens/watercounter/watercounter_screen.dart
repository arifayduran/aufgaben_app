// Erweitere die WaterCounter-App aus der vorherigen Aufgabe um die Funktion, täglich einen neuen Zähler zu starten.
// 	•	Speichere das Datum des letzten Zählers in den Shared Preferences.
// 	•	Wenn die App geöffnet wird, überprüfe das gespeicherte Datum.
// Falls das aktuelle Datum nicht mit dem gespeicherten Datum übereinstimmt,
// setze den Zähler auf 0 zurück und aktualisiere das Datum in den Shared Preferences.
// 	•	Implementiere eine Option, um den täglichen Fortschritt manuell zurückzusetzen.

import 'package:flutter/material.dart';

class WatercounterScreen extends StatefulWidget {
  const WatercounterScreen({super.key});

  @override
  State<WatercounterScreen> createState() => _WatercounterScreenState();
}

class _WatercounterScreenState extends State<WatercounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [],
      ),
    );
  }
}
