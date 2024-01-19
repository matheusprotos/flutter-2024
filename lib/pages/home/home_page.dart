import 'package:flutter/material.dart';
import 'package:flutter_2024/pages/home/bloc/home_cubit.dart';
import 'package:flutter_2024/pages/home/bloc/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late IHomeCubit homeCubit;

  @override
  void initState() {
    super.initState();

    homeCubit = Modular.get<IHomeCubit>();

    homeCubit.loadTodos();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(
            "Flutter 2014",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: BlocBuilder(
            bloc: homeCubit,
            builder: (context, state) {
              if (state is HomeLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is HomeLoadedState) {
                return ListView.builder(
                  itemCount: state.todos.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(
                      state.todos[index].name,
                    ),
                  ),
                );
              }

              return const SizedBox();
            }),
      );
}
