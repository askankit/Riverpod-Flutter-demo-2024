import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:river_pod_demo/src/core/routing/routes.dart';
import 'package:river_pod_demo/src/core/utils/helpers.dart';

class MainHomeView extends StatelessWidget {
  const MainHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("RIVERPOD"),centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal:20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Spacer(),
            Btn(
              title: "Provider",
              onTap: (){
                context.push(Routes.provider,);
              },
            ),
            const Spacer(),
            Btn(
              title: "Future Provider",
              onTap:(){
                context.push(Routes.futureProvider,);
              },

            ),
            const Spacer(),
            Btn(
              title: "Stream Provider",
              onTap:(){
                context.push(Routes.streamProvider,);
              },
            ),
            const Spacer(),
            Btn(
              title: "StateProvider",
              onTap:(){
                context.push(Routes.stateProvider,);
              },
            ),
            const Spacer(),
            Btn(
              title: "State Notifier Provider",
              onTap:(){
                context.push(Routes.stateNotifierProvider,);
              },
            ),
            const Spacer(),

            Btn(
              title: "(Asyc)Notifier Provider",
              onTap:(){
                context.push(Routes.asyncProvider,);
              },
            ),
            const Spacer(),
            Btn(
              title: "Change Notifier Provider",
              onTap:(){
                context.push(Routes.changeProvider,);
              },
            ),
            const Spacer(),


          ],
        ),
      ),

    );
  }
}
