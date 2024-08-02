import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/home_stream_provider.dart';

class StreamProviderView extends StatelessWidget {
  const StreamProviderView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Stream Provider"),),
      body: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          final data = ref.watch(streamExampleProvider);
          return  Center(
            child: Text(data.value.toString(),
              style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
          );
        },
      ),
    );
  }
}
