import 'package:dartz/dartz.dart';
import 'package:flutter_2024/core/types/errors.dart';
import 'package:flutter_2024/core/types/remote.dart';
import 'package:flutter_2024/features/todos/data/datasources/i_todos_datasource.dart';
import 'package:flutter_2024/features/todos/data/models/todo_model.dart';
import 'package:flutter_2024/features/todos/domain/entities/todo_entity.dart';

class APITodosDatasource implements ITodosDatasource<Remote> {
  @override
  Future<Either<BaseError, List<TodoEntity>>> getTodos() async {
    try {
      await Future.delayed(const Duration(seconds: 1));

      return right([
        TodoModel.fromJson(const {
          "id": 1,
          "name": "Fazer as compras",
        }),
        TodoModel.fromJson(const {
          "id": 2,
          "name": "Limpar a casa",
        }),
        TodoModel.fromJson(const {
          "id": 3,
          "name": "Jantar",
        }),
      ]);
    } catch (error) {
      return left(APIError(message: "Ocorreu um erro ao retornar as tarefas"));
    }
  }
}
