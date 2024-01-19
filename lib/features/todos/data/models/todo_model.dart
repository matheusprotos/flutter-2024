import 'package:flutter_2024/features/todos/domain/entities/todo_entity.dart';

class TodoModel extends TodoEntity {
  const TodoModel({
    required int id,
    required String name,
  }) : super(id: id, name: name);

  factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
