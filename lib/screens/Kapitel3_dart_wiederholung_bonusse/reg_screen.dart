import 'package:aufgaben_app/screens/Kapitel3_dart_wiederholung_bonusse/domain/user_database.dart';
import 'package:aufgaben_app/screens/Kapitel3_dart_wiederholung_bonusse/models/user.dart';
import 'package:flutter/material.dart';

class RegScreen extends StatefulWidget {
  const RegScreen({super.key});

  @override
  State<RegScreen> createState() => _RegScreenState();
}

class _RegScreenState extends State<RegScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  List<User> _showedUserList = [];
  bool isShowedList = false;
  bool isShowedAdult = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Database'),
        backgroundColor: Colors.amber,
      ),
      body: Container(
        color: Colors.amber[100],
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: TextFormField(
                        controller: _firstNameController,
                        decoration: InputDecoration(
                          labelText: "Vorname",
                          isDense: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Bitte geben Sie einen Vornamen ein';
                          } else if (!RegExp(r"^[a-zA-ZäöüÄÖÜß]{2,}$")
                              .hasMatch(value)) {
                            return 'Bitte Verwenden Sie nur Buchstaben.';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: TextFormField(
                        controller: _lastNameController,
                        decoration: InputDecoration(
                          labelText: "Nachname",
                          isDense: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Bitte geben Sie einen Nachnamen ein';
                          } else if (!RegExp(r"^[a-zA-ZäöüÄÖÜß]{2,}$")
                              .hasMatch(value)) {
                            return 'Bitte verwenden Sie nur Buchstaben.';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: TextFormField(
                        controller: _ageController,
                        decoration: InputDecoration(
                          labelText: "Alter",
                          isDense: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Bitte geben Sie einen Vornamen ein';
                          } else if (!RegExp(
                                  r'^(?:1[01][0-9]|120|[1-9][0-9]?)$')
                              .hasMatch(value)) {
                            return 'Bitte verwenden Sie nur ganze Zahlen.';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: "Email",
                          isDense: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Bitte geben Sie eine E-Mail ein';
                          } else if (!RegExp(
                                  r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                              .hasMatch(value)) {
                            return 'Bitte verwenden Sie eine gültige E-Mail-Adresse.';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              UserDatabase.registerUser(
                                User(
                                  _firstNameController.text,
                                  _lastNameController.text,
                                  int.parse(_ageController.text),
                                  _emailController.text,
                                ),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "Erfolgreich registriert!",
                                  ),
                                ),
                              );
                              setState(() {
                                _formKey.currentState?.reset();
                                _firstNameController.clear();
                                _lastNameController.clear();
                                _ageController.clear();
                                _emailController.clear();
                                if (isShowedAdult) {
                                  _showedUserList = UserDatabase.listAdultUsers(
                                      UserDatabase.userDatabase);
                                } else {
                                  _showedUserList =
                                      UserDatabase.listNotAdultUsers(
                                          UserDatabase.userDatabase);
                                }
                              });
                            }
                          },
                          style: const ButtonStyle(
                            elevation: WidgetStatePropertyAll(4),
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.amber),
                            foregroundColor:
                                WidgetStatePropertyAll(Colors.black),
                          ),
                          child: const Text("Registrieren"),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 170,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                isShowedList = true;
                                isShowedAdult = true;
                                _showedUserList = UserDatabase.listAdultUsers(
                                    UserDatabase.userDatabase);
                              });
                            },
                            style: const ButtonStyle(
                              elevation: WidgetStatePropertyAll(4),
                              backgroundColor:
                                  WidgetStatePropertyAll(Colors.amberAccent),
                              foregroundColor:
                                  WidgetStatePropertyAll(Colors.black),
                            ),
                            child: const Text("Volljährige"),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: 170,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                isShowedList = true;
                                isShowedAdult = false;
                                _showedUserList =
                                    UserDatabase.listNotAdultUsers(
                                        UserDatabase.userDatabase);
                              });
                            },
                            style: const ButtonStyle(
                              elevation: WidgetStatePropertyAll(4),
                              backgroundColor:
                                  WidgetStatePropertyAll(Colors.amberAccent),
                              foregroundColor:
                                  WidgetStatePropertyAll(Colors.black),
                            ),
                            child: const Text("Minderjährige"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            isShowedList
                ? Expanded(
                    child: ListView.builder(
                        clipBehavior: Clip.antiAlias,
                        itemCount: _showedUserList.length,
                        padding: const EdgeInsets.all(8.0),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              ListTile(
                                title: Text(
                                    "${_showedUserList[index].firstName} ${_showedUserList[index].lastName}"),
                                trailing: Text(
                                  "Alter: ${_showedUserList[index].userAge}",
                                  style: const TextStyle(fontSize: 16),
                                ),
                                subtitle: Text(_showedUserList[index].email),
                              ),
                              const Divider()
                            ],
                          );
                        }),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
