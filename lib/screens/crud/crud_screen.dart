import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CrudScreen extends StatefulWidget {
  const CrudScreen({super.key});

  @override
  State<CrudScreen> createState() => _CrudScreenState();
}

class _CrudScreenState extends State<CrudScreen> {
  TextEditingController text = TextEditingController();
  String? userName;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    String? storedName = await readData();
    setState(() {
      userName = storedName;
    });
  }

  void saveData(String username) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', username);
  }

  Future<String?> readData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('username');
  }

  void updateData(String newUsername) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', newUsername);
  }

  void deleteData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('username');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CRUD Username"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Username:",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(userName ?? "Empty"),
          const SizedBox(
            height: 100,
          ),
          SizedBox(
            width: 300,
            child: TextField(
              controller: text,
              decoration: const InputDecoration(labelText: "Input"),
            ),
          ),
          SizedBox(
            height: 400,
            child: GridView(
              padding: const EdgeInsets.all(15),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              children: [
                ElevatedButton(
                  onPressed: () {
                    saveData(text.text);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                            "Username '${text.text}'' saved successfully.")));
                    text.text = '';
                  },
                  child: const Text("Save"),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      loadData();
                    });
                  },
                  child: const Text("Read"),
                ),
                ElevatedButton(
                  onPressed: () {
                    updateData(text.text);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                            "Username '${text.text}'' updated successfully.")));
                    text.text = '';
                  },
                  child: const Text("Update"),
                ),
                ElevatedButton(
                  onPressed: () {
                    deleteData();
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Username deleted successfully.")));
                  },
                  child: const Text("Delete"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
