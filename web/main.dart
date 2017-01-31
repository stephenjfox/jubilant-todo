import 'dart:html';

import 'package:jubilant_todo/todo.dart';

InputElement todoInput;
UListElement todoList;

void main() {
  // This is the entrypoint, so I can do most of the primative coding
  // for the app right in this file
  todoInput = querySelector('#todo-input');
  todoList = querySelector('#todo-list');

  todoInput.onChange.listen((e) {
    final userInput = e.currentTarget.value; // not IntelliSense'd

    // make model-view-controller respresentation
    TodoController nextTodoItem = visualize(todoText: userInput);

    todoInput.value = '';

    // append ul with representation
    todoList.append(nextTodoItem.view);
  });
}

/// This method takes a "primitive" Todo instance and converts it into a
/// proper model-view-controller:
/// Model - Todo instance
/// View - LIElement that will be presented
/// Controller - TBD; listens on the event of the
TodoController visualize({String todoText}) {
  final Todo newTodo = new Todo(todoText);

  return new TodoController(newTodo, new LIElement()..text = newTodo.text);
}

class TodoController {
  final Todo todo;
  final LIElement view;

  TodoController(this.todo, this.view) {
    view.onClick.listen(handleClick);
  }

  void handleClick(MouseEvent event) {
    view.classes.toggle('completed-todo'); // toggle the view
    todo.isDone = !todo.isDone; // toggle the backing data
    print('handleClick - $todo');
  }
}
