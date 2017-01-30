import 'dart:html';

import 'package:jubilant_todo/todo.dart';

InputElement todoInput;
UListElement todoList;

void main() {
  // This is the entrypoint, so I can do most of the primative coding
  // for the app right in this file
  todoInput = querySelector("#todo-input");
  todoList = querySelector("#todo-list");

  todoInput.onChange.listen((e) {
    final inputText = e.currentTarget.value; // not IntelliSense'd

    // make Todo and clear input
    var newTodo = new Todo(inputText)..isDone = true;
    todoInput.value = '';

    // make representative li
    LIElement nextTodoItem = visualize(todo: newTodo);

    // append ul with representation
    todoList.append(nextTodoItem);
  });
}

LIElement visualize({Todo todo}) {
  // TODO: read the and modify the existing LIElement. Don't make a new one
  return new LIElement()
    ..text = todo.text
    ..onClick.listen((e) {
      (e.currentTarget as LIElement).classes.toggle('completed-todo');
    });
}
