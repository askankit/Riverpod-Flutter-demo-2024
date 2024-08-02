import 'package:flutter/material.dart';

@immutable
abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class HomeStatesLoading extends HomeStates {}

class HomeStatesLoaded<T> extends HomeStates {
  final T data;
  HomeStatesLoaded(this.data);
}

class HomeErrorState extends HomeStates {
  final String error;
  HomeErrorState({required this.error});
}
