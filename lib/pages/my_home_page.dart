import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kurs_2_riverpod/pages/second_page.dart';
import 'package:kurs_2_riverpod/states/counter_notifier.dart';
import 'package:kurs_2_riverpod/states/counter_state.dart';
import 'package:kurs_2_riverpod/states/is_changed_state.dart';
import 'package:kurs_2_riverpod/states/new_counter_notifier.dart';
import 'package:kurs_2_riverpod/widgets/custom_text.dart';

// ignore: must_be_immutable
class MyHomePage extends ConsumerWidget {
  final String title;

  const MyHomePage({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isChanged = ref.watch(isChangedState);

    final counter = ref.watch(counterProvider);

    final newCounter = ref.watch(newCounterNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomText(number: 'CounterState: ${ref.watch(counterState)}'),
            // ignore: unnecessary_brace_in_string_interps
            CustomText(number: 'CounterProvider: ${counter}'),
            CustomText(number: 'NewCounter: $newCounter'),
            CustomText(isChanged: isChanged),

            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const SecondPage();
                    },
                  ),
                );
              },
              child: const Text('Second page'),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterState.notifier).state++;
          //ref.read(counterState.notifier).update((state) => state + 1);

          ref.read(isChangedState.notifier).state = !isChanged;

          ref.read(counterProvider.notifier).koboyt();
          ref.read(newCounterNotifierProvider.notifier).koboyt();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
