import 'package:equatable/equatable.dart';

class TodoEntity extends Equatable {
  final int id;
  final String name;

  const TodoEntity({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];
}
