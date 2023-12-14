import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kurs_2_riverpod/states/counter_state.dart';
import 'package:kurs_2_riverpod/states/is_changed_state.dart';
import 'package:kurs_2_riverpod/widgets/custom_text.dart';

class SecondPage extends ConsumerWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            CustomText(
              number: ref.watch(counterState).toString(),
            ),
            CustomText(isChanged: ref.watch(isChangedState)),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () {
                ref.read(counterState.notifier).state++;
              },
              child: const Text('Increment counter'),
            )
          ],
        ),
      ),
    );
  }
}
