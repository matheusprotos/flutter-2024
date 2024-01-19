import 'package:flutter_2024/core/types/remote.dart';
import 'package:flutter_2024/core/types/local.dart';
import 'package:flutter_2024/features/todos/data/datasources/i_todos_datasource.dart';
import 'package:flutter_2024/features/todos/data/datasources/local/local_todos_datasource.dart';
import 'package:flutter_2024/features/todos/data/datasources/remote/api_todos_datasource.dart';
import 'package:flutter_2024/features/todos/data/repositories/todos_repository.dart';
import 'package:flutter_2024/features/todos/domain/repositories/i_todos_repository.dart';
import 'package:flutter_2024/features/todos/domain/usecases/todos_usecase.dart';
import 'package:flutter_2024/pages/home/bloc/home_cubit.dart';
import 'package:flutter_2024/pages/home/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  void binds(i) {
    i.addSingleton<ITodosDatasource<Local>>(LocalTodosDatasource.new);
    i.addSingleton<ITodosDatasource<Remote>>(APITodosDatasource.new);
    i.addSingleton<ITodosRepository>(TodosRepository.new);
    i.addSingleton<ITodosUsecase>(TodosUsecase.new);
    i.addSingleton<IHomeCubit>(HomeCubit.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const HomePage());
  }
}
