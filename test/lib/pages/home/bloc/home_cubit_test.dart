import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_2024/core/types/errors.dart';
import 'package:flutter_2024/features/todos/domain/entities/todo_entity.dart';
import 'package:flutter_2024/features/todos/domain/usecases/todos_usecase.dart';
import 'package:flutter_2024/pages/home/bloc/home_cubit.dart';
import 'package:flutter_2024/pages/home/bloc/home_states.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class TodosUsecaseMock extends Mock implements ITodosUsecase {}

void main() {
  late ITodosUsecase usecase;
  late IHomeCubit cubit;

  setUp(() {
    usecase = TodosUsecaseMock();
    cubit = HomeCubit(usecase);
  });

  group('HomeCubit - Test', () {
    blocTest<IHomeCubit, IHomeState>(
      '[Bloc] - Should return is states [HomeLoadingState and HomeSuccessState]',
      build: () => cubit,
      setUp: () {
        when(usecase.loadTodos).thenAnswer(
          (_) async => right(List<TodoEntity>.from([])),
        );
      },
      act: (_) {
        cubit.loadTodos();
      },
      expect: () => [
        isA<HomeLoadingState>(),
        isA<HomeLoadedState>(),
      ],
    );

    blocTest<IHomeCubit, IHomeState>(
      '[Bloc] - Should return is states [HomeLoadingState and HomeErrorState]',
      build: () => cubit,
      setUp: () {
        when(usecase.loadTodos).thenAnswer(
          (_) async => left(
              BaseError(message: "Ocorreu um erro ao retornar as tarefas")),
        );
      },
      act: (_) {
        cubit.loadTodos();
      },
      expect: () => [
        isA<HomeLoadingState>(),
        isA<HomeErrorState>(),
      ],
    );
  });
}
