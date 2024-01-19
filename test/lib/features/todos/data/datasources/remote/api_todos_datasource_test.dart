import 'package:dartz/dartz.dart';
import 'package:dartz_test/dartz_test.dart';
import 'package:flutter_2024/core/types/errors.dart';
import 'package:flutter_2024/features/todos/data/datasources/i_todos_datasource.dart';
import 'package:flutter_2024/features/todos/data/datasources/remote/api_todos_datasource.dart';
import 'package:flutter_2024/features/todos/domain/entities/todo_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class TodosDatasourceMock extends Mock implements ITodosDatasource {}

void main() {
  late ITodosDatasource realDatasource;
  late ITodosDatasource mockDatasource;

  setUp(() {
    realDatasource = APITodosDatasource();
    mockDatasource = TodosDatasourceMock();
  });

  test(
    'Should return List<TodoEntity> on success',
    () async {
      final result = await realDatasource.getTodos();

      expect(result.isRight(), true);
      expect(result.getRightOrFailTest(), isA<List<TodoEntity>>());
    },
  );

  test('Should return a BaseError when the API call throws an error', () async {
    when(mockDatasource.getTodos).thenAnswer((_) async {
      return left(APIError(message: ''));
    });

    final result = await mockDatasource.getTodos();

    expect(result.isLeft(), true);
    expect(result.getLeftOrFailTest(), isA<APIError>());
  });
}
