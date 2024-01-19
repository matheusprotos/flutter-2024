import 'package:dartz/dartz.dart';
import 'package:flutter_2024/core/types/errors.dart';
import 'package:flutter_2024/features/todos/domain/entities/todo_entity.dart';

abstract class ITodosRepository {
  Future<Either<BaseError, List<TodoEntity>>> getTodos();
}
