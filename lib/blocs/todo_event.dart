import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:todoapps/main.dart';

@immutable

abstract class TodoEvent extends Equatable{
  TodoEvent([List props = const<dynamic>[]]) : super(props);
}

class AppLaunched extends TodoEvent{
  String toString() => 'AppLaunched';
}

class longPressTask extends TodoEvent{
  String toString() => 'longPressTask';
}


class pressTask extends TodoEvent {
  final Todo item;
  pressTask(this.item): super([item]);
  @override
  String toString() => 'pressTask';
}


class clickFloatingAcrionButton extends TodoEvent{
  String toString() => 'clickFloatingAcrionButton';
}

class clickDelete extends TodoEvent {
  Todo item;
  clickDelete(this.item): super([item]);
  @override
  String toString() => 'clickDelete';
}

