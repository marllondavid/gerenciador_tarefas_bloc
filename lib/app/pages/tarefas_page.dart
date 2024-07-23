import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gerenciador_tarefas_bloc/app/blocs/tarefa.event.dart';
import 'package:gerenciador_tarefas_bloc/app/blocs/tarefa_bloc.dart';
import 'package:gerenciador_tarefas_bloc/app/blocs/tarefa_state.dart';
import 'package:gerenciador_tarefas_bloc/app/models/tarefa_model.dart';

class TarefasPage extends StatefulWidget {
  const TarefasPage({super.key});

  @override
  State<TarefasPage> createState() => _TarefasPageState();
}

class _TarefasPageState extends State<TarefasPage> {
  late final TarefaBloc _tarefaBloc;

  @override
  void initState() {
    super.initState();
    _tarefaBloc = TarefaBloc();
    _tarefaBloc.add(GetTarefas());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Gerenciador de Tarefas',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: BlocBuilder<TarefaBloc, TarefaState>(
            bloc: _tarefaBloc,
            builder: (context, state) {
              if (state is TarefaLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is TarefaLoadedState) {
                final list = state.tarefas;
                return ListView.separated(
                  separatorBuilder: (_, __) => const Divider(),
                  itemCount: list.length,
                  itemBuilder: (_, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.yellow[200],
                        child: Center(
                          child: Text(
                            list[index].nome[0],
                          ),
                        ),
                      ),
                      title: Text(list[index].nome),
                      trailing: IconButton(
                          onPressed: () {
                            _tarefaBloc.add(
                              DeleteTarefa(
                                tarefa: list[index],
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          )),
                    );
                  },
                );
              } else {
                return const Center(
                  child: Text('Error'),
                );
              }
            }),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow[200],
        onPressed: () {
          _tarefaBloc.add(
            PostTarefas(
              tarefa: TarefaModel(
                nome: 'Ir na farmacia',
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  void dispose() {
    _tarefaBloc.close();
    super.dispose();
  }
}
