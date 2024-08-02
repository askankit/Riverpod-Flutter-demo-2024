import 'dart:developer';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'all_getter.dart';
import 'app_text.dart';


part 'app_colors.dart';





part 'custom_button.dart';


void exit() {
  SystemNavigator.pop();
}

double screenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double screenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double safeAreaHeight(BuildContext context) {
  return (MediaQuery.of(context)
          .padding
          .top) /*+
          MediaQuery.of(context).padding.bottom)*/
      +
      15;
}

Widget dividerVirtical({
  double height = 25,
  double width = 1,
  Color color = const Color(0xff100301),
}) {
  return Container(
    height: height,
    width: width,
    color: color,
  );
}

void unFocus(BuildContext context) {
  FocusScope.of(context).unfocus();
}

SizedBox yHeight(double height) {
  return SizedBox(
    height: height,
  );
}

SizedBox xWidth(double width) {
  return SizedBox(
    width: width,
  );
}

void pushTo(BuildContext context, Widget widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}

void offAndToNamed(BuildContext context, String routesName) {
  Navigator.pushReplacementNamed(context, routesName);
}

void pushRemoveUtil(BuildContext context, Widget widget) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => widget),
    (route) {
      return false;
    },
  );
}

void offAllNamed(BuildContext context, String routesName, {Object? args}) {
  Navigator.pushNamedAndRemoveUntil(
      context, routesName, (Route<dynamic> route) => false,
      arguments: args);
}

void toNamed(BuildContext context, String routesName, {Object? args}) {
  Navigator.pushNamed(context, routesName, arguments: args);
}

void back(BuildContext context, {Object? result}) {
  Navigator.pop(context, result);
}

void printLog(dynamic msg, {String fun = "",String name=""}) {
/*  if(kDebugMode){
    print('$fun=> ${msg.toString()}');
  }*/
  print('$fun=> ${msg.toString()}');
  log('$fun=> ${msg.toString()}',name: name,time: DateTime.now());
}

void provideLog(dynamic msg, {String fun = "",String name="RIVERPOD"}) {
  log(msg.toString(),name: name,time: DateTime.now());
}

void routesLog(String message) {
  log(message, name: "SCREEN", time: DateTime.now());
}

void functionLog({required dynamic msg, required dynamic fun}) {
  _printLog("{${fun.toString()} ::==> ${msg.toString()}", "FUNCTION LOG");
}

void _printLog(dynamic msg, String name) {
  log(msg.toString(), name: name);
}

void blocLog({required String msg, required String bloc, String? exp}) {
  _printLog(
    "${bloc.toString()} ::==> ${msg.toString()} $exp",
    "BLOC LOG",
  );
}

bool emailValidation(String email) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = RegExp(pattern.toString());
  return regex.hasMatch(email);
}

Widget customLoader({
  double height = 55,
  double width = 100,
  Color color = Colors.black,
  double? value,
}) {
  return SizedBox(
    height: height,
    width: width,
    child: const CircularProgressIndicator(color: AppColor.primary,),
  );
}

bool isHtml(String input) {
  final RegExp htmlRegex = RegExp(r"<[^>]*>");
  return htmlRegex.hasMatch(input);
}
