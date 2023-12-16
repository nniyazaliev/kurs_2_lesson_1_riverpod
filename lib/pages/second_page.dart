import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:kurs_2_riverpod/states/new_counter_notifier.dart';

import 'package:kurs_2_riverpod/widgets/custom_text.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Second page',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Consumer(
              builder: (context, ref, child) {
                return CustomText(
                  number: ref.watch(newCounterNotifierProvider).toString(),
                );
              },
            ),
            const SizedBox(
              height: 30,
            ),
            Consumer(
              builder: (context, ref, child) {
                return TextButton(
                  onPressed: () {
                    ref.read(newCounterNotifierProvider.notifier).azayt();
                  },
                  child: const Text('Increment counter'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
