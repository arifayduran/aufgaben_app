
import 'package:aufgaben_app/screens/Kapitel3_dart_wiederholung_bonusse/checklist_screen.dart';
import 'package:aufgaben_app/screens/Kapitel3_dart_wiederholung_bonusse/reg_screen.dart';
import 'package:flutter/material.dart';

class BonusHomeScreen extends StatelessWidget {
  const BonusHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: SizedBox(
          height: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                style: const ButtonStyle(
                  elevation: WidgetStatePropertyAll(4),
                  backgroundColor: WidgetStatePropertyAll(Colors.amber),
                  foregroundColor: WidgetStatePropertyAll(Colors.black),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const RegScreen();
                      },
                    ),
                  );
                },
                child: const Text("Registration Screen"),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: const ButtonStyle(
                  elevation: WidgetStatePropertyAll(4),
                  backgroundColor: WidgetStatePropertyAll(Colors.amber),
                  foregroundColor: WidgetStatePropertyAll(Colors.black),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const ChecklistScreen();
                      },
                    ),
                  );
                },
                child: const Text("Checklist Screen"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
