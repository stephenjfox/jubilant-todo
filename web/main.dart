import 'dart:html';

import 'package:jubilant_todo/todo.dart';

InputElement _todoInput;
UListElement _todoList;

void main() {
  // This is the entrypoint, so I can do most of the primative coding
  // for the app right in this file
  _todoInput = querySelector("#todo-input");
  _todoList = querySelector("#todo-list");

  _todoInput.onChange.listen((e) {
    final inputText = e.currentTarget.value; // not IntelliSense'd

    // make Todo and clear input
    var newTodo = new Todo(inputText);
    _todoInput.value = '';

    // make representative li
    LIElement nextTodoItem = visualize(todo: newTodo);

    // append ul with representation
    _todoList.append(nextTodoItem);
  });
}

LIElement visualize({Todo todo}) {
  return new LIElement()..text = todo.text;
}
