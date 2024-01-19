import 'package:dartz/dartz.dart';
import 'package:dartz_test/dartz_test.dart';
import 'package:flutter_2024/core/types/errors.dart';
import 'package:flutter_2024/features/todos/domain/entities/todo_entity.dart';
import 'package:flutter_2024/features/todos/domain/repositories/i_todos_repository.dart';
import 'package:flutter_2024/features/todos/domain/usecases/todos_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class TodosRepositoryMock extends Mock implements ITodosRepository {}

void main() {
  late ITodosRepository repository;
  late ITodosUsecase usecase;

  setUp(() {
    repository = TodosRepositoryMock();
    usecase = TodosUsecase(repository: repository);
  });

  test('When call loadTodos() then return success', () async {
    when(repository.getTodos).thenAnswer((_) async {
      return right(List<TodoEntity>.from(
        [],
      ));
    });

    final result = await usecase.loadTodos();

    expect(result, isRight);
    expect(result.getRightOrFailTest(), isA<List<TodoEntity>>());
  });

  test('When call loadTodos() then return error', () async {
    when(repository.getTodos).thenAnswer((_) async {
      return left(APIError(message: ''));
    });

    final result = await usecase.loadTodos();

    expect(result.isLeft(), true);
    expect(result.getLeftOrFailTest(), isA<BaseError>());
  });
}
