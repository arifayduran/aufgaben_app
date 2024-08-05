import 'package:aufgaben_app/screens/Kapitel3_dart_wiederholung_bonusse/domain/checklist_database.dart';
import 'package:flutter/material.dart';

class AddItemScreen extends StatefulWidget {
  const AddItemScreen({super.key});

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Neue Checklist hinzufügen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration:
                  const InputDecoration(labelText: 'Neues Checklisteneintrag'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: const ButtonStyle(
                elevation: WidgetStatePropertyAll(4),
                backgroundColor: WidgetStatePropertyAll(Colors.amber),
                foregroundColor: WidgetStatePropertyAll(Colors.black),
              ),
              onPressed: () {
                String newItem = _controller.text.trim();
                if (newItem.isNotEmpty) {
                  setState(() {
                    ChecklistDatabase.addItem(newItem);
                  });
                  Navigator.pop(context);
                }
              },
              child: const Text('Hinzufügen'),
            ),
          ],
        ),
      ),
    );
  }
}
