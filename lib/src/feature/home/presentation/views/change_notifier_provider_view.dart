import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod_demo/src/core/utils/app_text.dart';
import 'package:river_pod_demo/src/core/utils/helpers.dart';

import '../providers/user_change_notifier_provider.dart';

class ChangeNotifierProviderView extends ConsumerWidget {
  const ChangeNotifierProviderView({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final ageData = ref.watch(getAgeProvider);
    return Scaffold(
      appBar: AppBar(title: Text("Change Notifier Provider"),centerTitle: true,),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

            Center(
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ageData.checkEligibility()?Colors.green:Colors.red
                ),
                child: Center(
                  child: Text( ageData.checkEligibility()?"Yes Eligible":"Not Eligible",style: const TextStyle(
                    fontSize: 15,
                    color: AppColor.whiteFFFFFF,
                    fontWeight: FontWeight.w600

                  ),),
                ),
              ),
            ),

          SizedBox(height: 50,),
          Text("Check are you eligible for Driving Licence!",
            style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),textAlign: TextAlign.center,),
          SizedBox(height: 50,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton.filled(
                style: ButtonStyle(
                  backgroundColor:  WidgetStateProperty.all(AppColor.primary)
                ),
                color: AppColor.primary,
                  icon:Icon(Icons.remove,color: AppColor.whiteFFFFFF,),
                  onPressed: (){
                    ageData.decreaseAge();

              }),
              SizedBox(width: 20,),
              AppText(text: "${ageData.age}"),
              SizedBox(width: 20,),
              IconButton.filled(
                  style: ButtonStyle(
                      backgroundColor:  WidgetStateProperty.all(AppColor.primary)
                  ),
                  color: AppColor.primary,
                  icon:Icon(Icons.add,color: AppColor.whiteFFFFFF,),
                  onPressed: (){
                    ageData.increaseAge();

                  })
            ],
          ),


          
        ],
      ),
    );
  }
}
