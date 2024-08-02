
import 'package:flutter_riverpod/flutter_riverpod.dart';
/// ```dart
///
///
/// ```
final userDataProvider = Provider<Map<String,String>>((ref){
  return {
    "Name": "Ankit",
    "lastName": "Bisht",
    "Mobile": "9876543210",
    "Email": "AnkitBisht@gmail.com",
  };
});