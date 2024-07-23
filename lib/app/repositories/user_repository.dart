import 'package:gerenciador_tarefas_bloc/app/models/tarefa_model.dart';

class TarefaRepository {
  final List<TarefaModel> _tarefas = [];

  Future<List<TarefaModel>> getTarefas() async {
    _tarefas.addAll([
      TarefaModel(nome: 'Devocional'),
      TarefaModel(nome: 'Fazer exercícios'),
      TarefaModel(nome: 'Compras no Mercado'),
      TarefaModel(nome: 'Buscar filhos na escola'),
    ]);

    return Future.delayed(
      const Duration(seconds: 2),
      () => _tarefas,
    );
  }

  Future<List<TarefaModel>> postTarefa({required TarefaModel tarefa}) async {
    _tarefas.add(tarefa);

    return Future.delayed(
      const Duration(seconds: 2),
      () => _tarefas,
    );
  }

  Future<List<TarefaModel>> deleteTarefa({required TarefaModel tarefa}) async {
    _tarefas.remove(tarefa);

    return Future.delayed(
      const Duration(seconds: 2),
      () => _tarefas,
    );
  }
}
