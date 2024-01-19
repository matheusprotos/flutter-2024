import 'package:flutter_2024/core/types/errors.dart';
import 'package:flutter_2024/features/todos/domain/entities/todo_entity.dart';
import 'package:flutter_2024/features/todos/domain/repositories/i_todos_repository.dart';
import 'package:dartz/dartz.dart';

abstract class ITodosUsecase {
  Future<Either<BaseError, List<TodoEntity>>> loadTodos();
}

class TodosUsecase implements ITodosUsecase {
  final ITodosRepository repository;

  TodosUsecase({
    required this.repository,
  });

  @override
  Future<Either<BaseError, List<TodoEntity>>> loadTodos() {
    return repository.getTodos();
  }
}
