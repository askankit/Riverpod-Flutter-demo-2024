import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/future_provider.dart';

class FutureProviderView extends ConsumerWidget {
  const FutureProviderView({super.key});
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final homeModelAsyncValue = ref.watch(getNotedProvider(123));
    return Scaffold(
      appBar: AppBar(title: Text("Future Provider"),centerTitle: true,),
      body: homeModelAsyncValue.when(
        data: (data) =>  Center(child: Text(data.title??"")) ,
        error: (err, stack) => Text("$err") ,
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
