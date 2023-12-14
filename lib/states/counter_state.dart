import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Providers are declared globally and specify how to create a state
/// Uzun zholu:
final counterState = StateProvider<int>((ref) {
  return 1;
});
