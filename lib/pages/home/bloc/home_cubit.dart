import 'package:flutter_2024/features/todos/domain/usecases/todos_usecase.dart';
import 'package:flutter_2024/pages/home/bloc/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class IHomeCubit extends Cubit<IHomeState> {
  IHomeCubit() : super(HomeInitialState());

  Future<void> loadTodos();
}

class HomeCubit extends IHomeCubit {
  final ITodosUsecase todosUsecase;

  HomeCubit(this.todosUsecase);

  @override
  Future<void> loadTodos() async {
    emit(HomeLoadingState());

    final todosResult = await todosUsecase.loadTodos();

    todosResult.fold(
      (error) => emit(
        HomeErrorState(
          message: error.message,
        ),
      ),
      (todos) => emit(
        HomeLoadedState(
          todos: todos,
        ),
      ),
    );
  }
}
