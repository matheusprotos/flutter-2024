import 'package:flutter_2024/features/todos/domain/entities/todo_entity.dart';

abstract class IHomeState {}

class HomeInitialState extends IHomeState {}

class HomeLoadingState extends IHomeState {}

class HomeLoadedState extends IHomeState {
  final List<TodoEntity> todos;

  HomeLoadedState({required this.todos});
}

class HomeErrorState extends IHomeState {
  final String message;

  HomeErrorState({required this.message});
}
