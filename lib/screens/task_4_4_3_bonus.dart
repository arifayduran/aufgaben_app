import 'package:flutter/material.dart';

class Task443Calculator extends StatefulWidget {
  const Task443Calculator({super.key});

  @override
  State<Task443Calculator> createState() => _Task443Calculator();
}

class _Task443Calculator extends State<Task443Calculator> {
  @override
  Widget build(BuildContext context) {
    int output = 0;
    // int input = 0;
    int n1 = 1;
    int n2 = 2;
    int n3 = 3;
    int n4 = 4;
    int n5 = 5;
    int n6 = 6;
    int n7 = 7;
    int n8 = 8;
    int n9 = 9;
    int n0 = 0;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Tasksheet 4.4.3 Bonus"),
          foregroundColor: Colors.white,
          backgroundColor: Colors.green,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.white,
          backgroundColor: Colors.green,
          unselectedItemColor: Colors.white,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
        endDrawer: Drawer(
          child: Container(
            color: Colors.green,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 100,
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text("Home"),
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text("Profile"),
                ),
              ],
            ),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 136, 213, 139),
        body: Center(
          child: SizedBox(
            height: 580,
            width: 350,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 60,
                  margin: const EdgeInsetsDirectional.symmetric(horizontal: 30),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.centerRight,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "$output",
                    style: const TextStyle(
                      fontSize: 35,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  height: 450,
                  padding: const EdgeInsets.all(30),
                  child: GridView.count(
                    crossAxisCount: 3,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            foregroundColor: const WidgetStatePropertyAll(
                              Colors.green,
                            ),
                            backgroundColor:
                                WidgetStateProperty.all(Colors.white),
                            elevation: const WidgetStatePropertyAll(3)),
                        child: Text(
                          "$n1",
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            foregroundColor: const WidgetStatePropertyAll(
                              Colors.green,
                            ),
                            backgroundColor:
                                WidgetStateProperty.all(Colors.white),
                            elevation: const WidgetStatePropertyAll(3)),
                        child: Text(
                          "$n2",
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            foregroundColor: const WidgetStatePropertyAll(
                              Colors.green,
                            ),
                            backgroundColor:
                                WidgetStateProperty.all(Colors.white),
                            elevation: const WidgetStatePropertyAll(3)),
                        child: Text(
                          "$n3",
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            foregroundColor: const WidgetStatePropertyAll(
                              Colors.green,
                            ),
                            backgroundColor:
                                WidgetStateProperty.all(Colors.white),
                            elevation: const WidgetStatePropertyAll(3)),
                        child: Text(
                          "$n4",
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            foregroundColor: const WidgetStatePropertyAll(
                              Colors.green,
                            ),
                            backgroundColor:
                                WidgetStateProperty.all(Colors.white),
                            elevation: const WidgetStatePropertyAll(3)),
                        child: Text(
                          "$n5",
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            foregroundColor: const WidgetStatePropertyAll(
                              Colors.green,
                            ),
                            backgroundColor:
                                WidgetStateProperty.all(Colors.white),
                            elevation: const WidgetStatePropertyAll(3)),
                        child: Text(
                          "$n6",
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            foregroundColor: const WidgetStatePropertyAll(
                              Colors.green,
                            ),
                            backgroundColor:
                                WidgetStateProperty.all(Colors.white),
                            elevation: const WidgetStatePropertyAll(3)),
                        child: Text(
                          "$n7",
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            foregroundColor: const WidgetStatePropertyAll(
                              Colors.green,
                            ),
                            backgroundColor:
                                WidgetStateProperty.all(Colors.white),
                            elevation: const WidgetStatePropertyAll(3)),
                        child: Text(
                          "$n8",
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            foregroundColor: const WidgetStatePropertyAll(
                              Colors.green,
                            ),
                            backgroundColor:
                                WidgetStateProperty.all(Colors.white),
                            elevation: const WidgetStatePropertyAll(3)),
                        child: Text(
                          "$n9",
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            foregroundColor: const WidgetStatePropertyAll(
                              Colors.green,
                            ),
                            backgroundColor:
                                WidgetStateProperty.all(Colors.white),
                            elevation: const WidgetStatePropertyAll(3)),
                        child: const Text(
                          "+",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            foregroundColor: const WidgetStatePropertyAll(
                              Colors.green,
                            ),
                            backgroundColor:
                                WidgetStateProperty.all(Colors.white),
                            elevation: const WidgetStatePropertyAll(3)),
                        child: Text(
                          "$n0",
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            foregroundColor: const WidgetStatePropertyAll(
                              Colors.green,
                            ),
                            backgroundColor:
                                WidgetStateProperty.all(Colors.white),
                            elevation: const WidgetStatePropertyAll(3)),
                        child: const Text(
                          "-",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 60,
                  width: 290,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        foregroundColor: const WidgetStatePropertyAll(
                          Colors.white,
                        ),
                        backgroundColor: WidgetStateProperty.all(Colors.green),
                        elevation: const WidgetStatePropertyAll(3)),
                    child: const Text(
                      "=",
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
