


import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:todoapps/main.dart';

@immutable
abstract class TodoState extends Equatable {
  TodoState([List props = const <dynamic>[]]) : super(props);
}

class Uninitialized extends TodoState{
  @override
  String toString() => 'Uninitialized';
}

class taskAdded extends TodoState{
  @override
  String toString() => 'taskAdded';
}


class taskUpdated extends TodoState{
  final Todo item;
  taskUpdated(this.item);
  @override
  String toString() => 'taskUpdated';
}

class taskDeleted extends TodoState{
  final Todo item;
  taskDeleted(this.item);
  @override
  String toString() => 'taskDeleted';
}