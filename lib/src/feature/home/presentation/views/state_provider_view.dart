import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod_demo/src/core/utils/helpers.dart';

import '../providers/user_state_provider.dart';

class StateProviderView extends StatelessWidget {
  const StateProviderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("State Provider View"),),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 20,),
          Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              final getData = ref.watch(addRemoveProvider);
              return Column(
                children: [
                  Text(getData.toString(),style: TextStyle(fontSize: 25),),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0,vertical: 50),
                    child: Row(
                      children: [
                        Flexible(
                          child: Btn(
                            onTap: (){
                              ref.read(addRemoveProvider.notifier).state++;
                            },
                            title: "+ ADD",
                          ),
                        ),
                        SizedBox(width: 20,),
                        Flexible(
                          child: Btn(
                            title: "- Remove",
                            onTap: (){
                              ref.read(addRemoveProvider.notifier).state--;
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              );
            },),


        ],
      ),

    );
  }
}
