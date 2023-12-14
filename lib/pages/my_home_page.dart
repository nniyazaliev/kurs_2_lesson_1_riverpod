import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kurs_2_riverpod/pages/second_page.dart';
import 'package:kurs_2_riverpod/states/counter_state.dart';
import 'package:kurs_2_riverpod/states/is_changed_state.dart';
import 'package:kurs_2_riverpod/widgets/custom_text.dart';

class MyHomePage extends ConsumerWidget {
  final String title;

  const MyHomePage({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterState);
    final isChanged = ref.watch(isChangedState);

    log('build = ${counter}');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            CustomText(
              number: counter.toString(),
            ),
            CustomText(isChanged: isChanged),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const SecondPage();
                  },
                ));
              },
              child: const Text('Second page'),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterState.notifier).state++;
          ref.read(isChangedState.notifier).state = !isChanged;
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
