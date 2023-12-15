import 'dart:developer';

import 'package:flutter/material.dart';

class StateExplanation extends StatefulWidget {
  const StateExplanation({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _StateExplanationState createState() => _StateExplanationState();
}

class _StateExplanationState extends State<StateExplanation> {
  late TextEditingController _controller;
  late String data1;
  String data2 = 'Data 2';

  @override
  void initState() {
    _controller = TextEditingController();
    data1 = 'Data 1';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text(
          'State Management',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(data2),
            Text(
              data1,
              style: const TextStyle(fontSize: 28),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: _controller,
                onChanged: (value) {
                  log('onChanged value: $value');
                  data1 = value;
                  data2 = value;
                  log('data1: $data1');
                  setState(() {});
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
