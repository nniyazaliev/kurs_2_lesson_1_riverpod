import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'new_counter_notifier.g.dart';

@riverpod
class NewCounterNotifier extends _$NewCounterNotifier {
  @override
  int build() {
    return 0;
  }

  void koboyt() {
    state++;
  }

  void azayt() {
    state--;
  }
}
