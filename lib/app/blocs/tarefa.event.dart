import 'package:gerenciador_tarefas_bloc/app/models/tarefa_model.dart';

abstract class TarefaEvent {}

class GetTarefas extends TarefaEvent {}

class PostTarefas extends TarefaEvent {
  final TarefaModel tarefa;

  PostTarefas({required this.tarefa});
}

class DeleteTarefa extends TarefaEvent {
  final TarefaModel tarefa;

  DeleteTarefa({required this.tarefa});
}
