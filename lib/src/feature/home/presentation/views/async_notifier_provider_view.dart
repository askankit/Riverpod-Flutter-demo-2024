import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/async_notifier_provider_home.dart';
import '../providers/home_states.dart';

class AsyncNotifierProviderView extends ConsumerStatefulWidget {
  const AsyncNotifierProviderView({super.key});

  @override
  ConsumerState<AsyncNotifierProviderView> createState() => _AsyncNotifierProviderViewState();
}

class _AsyncNotifierProviderViewState extends ConsumerState<AsyncNotifierProviderView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((f){
      final homeDataController = ref.read(homeUserDataNotifierProvider.notifier);
     homeDataController.fetchHomeData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final homeData = ref.watch(homeUserDataNotifierProvider);
    final homeDataController = ref.read(homeUserDataNotifierProvider.notifier);
    return Scaffold(
      appBar: AppBar(title: const Text("Async Notifier Provider"),centerTitle: true,),
      body: Visibility(
        visible: homeData is! HomeStatesLoading,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          itemCount: homeDataController.trip.length,
          itemBuilder: (BuildContext context, int index) {
            var data = homeDataController.trip[index];
          return Card(
            margin: const EdgeInsets.all(5),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(data.title??"",style:const TextStyle(fontWeight: FontWeight.w600,fontSize: 18),),
              ));
        },),
      ),

    );
  }
}
