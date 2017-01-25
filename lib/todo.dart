/// Model for the todo item
class Todo {
  final String text;
  bool isDone;

  Todo(this.text, [this.isDone = false]);
  Todo.copy(Todo other) : this(other.text, other.isDone);
  Todo.fromMap(Map<String, dynamic> map) : this(map["text"], map["isDone"]);

  @override
  String toString() => '{ "isDone": $isDone, "text": "$text" }';
}
