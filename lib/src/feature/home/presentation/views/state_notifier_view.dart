import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod_demo/src/core/utils/app_text.dart';
import 'package:river_pod_demo/src/core/utils/helpers.dart';
import 'package:river_pod_demo/src/feature/home/data/model/home_model.dart';
import 'package:river_pod_demo/src/feature/home/presentation/providers/home_states.dart';
import '../providers/home_notifier.dart';
import '../providers/home_stream_provider.dart';

final addItemProvider = StateProvider<int>((ref) => 0);

class StateNotifierView extends ConsumerStatefulWidget {
  const StateNotifierView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _StateNotifierViewState();
}

class _StateNotifierViewState extends ConsumerState<StateNotifierView> {


  @override
  void initState(){
     WidgetsBinding.instance.addPostFrameCallback((callback) async {
     final  fetchHomeDataNotifier = ref.read(homeDataNotifierProvider.notifier);
       fetchHomeDataNotifier.fetchHomeData();
     });
     super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(homeDataNotifierProvider);
    print("dsfasdfdsfsdfdsfsdfasdfadfasfsa $state");
    return Scaffold(
        appBar: AppBar(
          title: const AppText(
            text: "Hello Home",
          ),
          centerTitle: true,
        ),
        floatingActionButton: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(Colors.green)
                    ),
                    onPressed: () {
                      ref
                          .read(addItemProvider.notifier)
                          .state++;
                    }, child: Icon(Icons.add)),
                xWidth(20),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(Colors.red)
                    ),
                    onPressed: () {
                      ref
                          .read(addItemProvider.notifier)
                          .state--;
                    }, child: Icon(Icons.remove))
              ],
            );
          },
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 50,),
            Expanded(
              child: Builder(
                builder: (BuildContext context) {
                  if(state is HomeInitialState || state is HomeStatesLoading){
                    return const Center(child: CircularProgressIndicator(),);
                  }else if(state is HomeStatesLoaded){
                    final todosList = state.data as List<HomeModel>;
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: todosList.length,
                      itemBuilder: (BuildContext context, int index) {
                      var data = todosList[index];
                      return Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: AppText(text: "${data.title}"),
                      );
                    },);
                  }else{
                    return AppText(text: "$state");
                  }
                },
              ),
            ),
            SizedBox(height: 10,),
            Center(
              child: Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
                  printLog("msg=====>>");
                  final addIncrement = ref.watch(addItemProvider);
                  return AppText(text: addIncrement.toString(),);
                },
              ),
            ),

         /*   Center(
              child: Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
                  AsyncValue<int> value = ref.watch(streamExampleProvider);
                  return AppText(text: value.value.toString(),);
                },
              ),
            ),*/
            SizedBox(height:100,),
          ],
        )


    );
  }
}
