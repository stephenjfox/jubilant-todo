/// An alternative "main" for working through small problems

import 'package:jubilant_todo/todo.dart';

import 'dart:convert';

main(List<String> args) {
  var todo = new Todo("test");
  print(todo);

  var decoded = JSON.decode(todo.toString());
  print("Decoded JSON: type - ${decoded.runtimeType}, toString() - ${decoded.toString()}");

  var otherTodo = new Todo.fromMap(decoded);
  print(otherTodo);
}