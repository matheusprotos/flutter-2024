import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_2024/core/types/errors.dart';
import 'package:flutter_2024/core/types/remote.dart';
import 'package:flutter_2024/core/types/local.dart';
import 'package:flutter_2024/features/todos/data/datasources/i_todos_datasource.dart';
import 'package:flutter_2024/features/todos/domain/entities/todo_entity.dart';
import 'package:flutter_2024/features/todos/domain/repositories/i_todos_repository.dart';

class TodosRepository implements ITodosRepository {
  final ITodosDatasource<Remote> remoteDatasource;
  final ITodosDatasource<Local> localDatasource;

  TodosRepository({
    required this.remoteDatasource,
    required this.localDatasource,
  });

  @override
  Future<Either<BaseError, List<TodoEntity>>> getTodos() async {
    Connectivity connectivity = Connectivity();
    ConnectivityResult connectivityResult =
        await connectivity.checkConnectivity();

    if (connectivityResult == ConnectivityResult.none) {
      return localDatasource.getTodos();
    }

    return remoteDatasource.getTodos();
  }
}
