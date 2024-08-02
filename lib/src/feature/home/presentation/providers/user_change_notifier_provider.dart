

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getAgeProvider = ChangeNotifierProvider.autoDispose<AgeProvider>((ref)=>AgeProvider());
class AgeProvider extends ChangeNotifier{
  int age =10;

  increaseAge(){
    age++;
    notifyListeners();
  }


  decreaseAge(){
    age--;
    notifyListeners();
  }

  bool checkEligibility(){
    if (age>=18){
      return true;
    }else{
      return false;
    }
  }

}