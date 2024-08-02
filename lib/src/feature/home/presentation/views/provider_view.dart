import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/helpers.dart';
import '../providers/user_data_provider.dart';

class ProviderView extends StatelessWidget {
  const ProviderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider View"),
        centerTitle: true,
        leading: BackButton(
          color: AppColor.black000000,
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
                final userData = ref.watch(userDataProvider);
                return Column(
                  children: userData.entries.map((entry) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(entry.key,style: const TextStyle(fontSize: 18),),
                        ),
                        Text(entry.value,style: TextStyle(fontSize: 18),),
                      ],
                    );
                  }).toList(),
                );
              },
            ),
            yHeight(20),
          ],
        ),
      ),
    );
  }
}
