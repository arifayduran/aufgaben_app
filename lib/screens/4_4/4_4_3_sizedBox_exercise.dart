// Implementiere die UI von dem Screenshot. Hierbei kann dir das SizedBox-Widget helfen.
// assets/images/443wiederholung_2.png

import 'package:flutter/material.dart';

class Task443Wiederholung2 extends StatelessWidget {
  const Task443Wiederholung2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "SizedBox Exercise",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: false,
        backgroundColor: const Color.fromARGB(255, 73, 148, 236),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150,
              height: 150,
              color: const Color.fromARGB(255, 73, 148, 236),
              alignment: Alignment.center,
              child: const Text(
                "Box 1",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: 230,
              height: 100,
              color: Colors.green,
              alignment: Alignment.center,
              child: const Text(
                "Box 2",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: 100,
              height: 200,
              color: Colors.red,
              alignment: Alignment.center,
              child: const Text(
                "Box 3",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
