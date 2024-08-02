import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final streamExampleProvider = StreamProvider.autoDispose<int>((ref) async* {
  for (var i = 0; i < 100; i++) {
    yield i;
    await Future<void>.delayed(const Duration(seconds: 1));
  }
});