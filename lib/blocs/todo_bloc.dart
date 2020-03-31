

import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapps/blocs/bloc.dart';
import 'package:todoapps/main.dart';
import 'package:todoapps/new_item_view.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState>{
  @override
  // TODO: implement initialState
  TodoState get initialState => Uninitialized();

  @override
  Stream<TodoState> mapEventToState(TodoEvent event) async* {
    print(event);
    if (event is longPressTask) {
      //yield* maplongPressTaskToState();
    }
  }

  maplongPressTaskToState(BuildContext context,Todo item) {
    Map data;
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context){
          return NewItemView(title: item.title,subtitle: item.subtitle,);
        }
    )).then((data){
     // if(data != null) editTodo(item,data['title'], data['subtitle']);
    });
  }

}