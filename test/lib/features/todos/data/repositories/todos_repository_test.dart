import 'package:dartz/dartz.dart';
import 'package:dartz_test/dartz_test.dart';
import 'package:flutter_2024/core/types/errors.dart';
import 'package:flutter_2024/core/types/local.dart';
import 'package:flutter_2024/core/types/remote.dart';
import 'package:flutter_2024/features/todos/data/datasources/i_todos_datasource.dart';
import 'package:flutter_2024/features/todos/domain/entities/todo_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class TodosDatasourceRMock extends Mock implements ITodosDatasource<Remote> {}

class TodosDatasourceLMock extends Mock implements ITodosDatasource<Local> {}

void main() {
  late ITodosDatasource<Remote> todosRemoteDatasource;
  late ITodosDatasource<Local> todosLocalDatasource;

  setUp(() {
    todosRemoteDatasource = TodosDatasourceRMock();
    todosLocalDatasource = TodosDatasourceLMock();
  });

  test(
    'Should return List<TodoEntity> on success',
    () async {
      when(todosRemoteDatasource.getTodos).thenAnswer(
        (_) async => right(
          List<TodoEntity>.from(
            [],
          ),
        ),
      );

      final remoteResult = await todosRemoteDatasource.getTodos();

      expect(remoteResult.isRight(), true);
      expect(remoteResult.getRightOrFailTest(), isA<List<TodoEntity>>());

      when(todosLocalDatasource.getTodos).thenAnswer(
        (_) async => right(
          List<TodoEntity>.from(
            [],
          ),
        ),
      );

      final localResult = await todosLocalDatasource.getTodos();

      expect(localResult.isRight(), true);
      expect(localResult.getRightOrFailTest(), isA<List<TodoEntity>>());
    },
  );

  test(
    'Should return BaseError on error',
    () async {
      when(todosRemoteDatasource.getTodos).thenAnswer(
        (_) async => left(
          APIError(message: ""),
        ),
      );

      final remoteResult = await todosRemoteDatasource.getTodos();

      expect(remoteResult.isLeft(), true);
      expect(remoteResult.getLeftOrFailTest(), isA<BaseError>());

      when(todosLocalDatasource.getTodos).thenAnswer(
        (_) async => left(
          AppError(message: ""),
        ),
      );

      final localResult = await todosLocalDatasource.getTodos();

      expect(localResult.isLeft(), true);
      expect(localResult.getLeftOrFailTest(), isA<BaseError>());
    },
  );
}
