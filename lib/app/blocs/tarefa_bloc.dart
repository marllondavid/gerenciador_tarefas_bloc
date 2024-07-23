import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gerenciador_tarefas_bloc/app/blocs/tarefa.event.dart';
import 'package:gerenciador_tarefas_bloc/app/blocs/tarefa_state.dart';
import 'package:gerenciador_tarefas_bloc/app/models/tarefa_model.dart';
import 'package:gerenciador_tarefas_bloc/app/repositories/user_repository.dart';

class TarefaBloc extends Bloc<TarefaEvent, TarefaState> {
  final _repository = TarefaRepository();

  TarefaBloc() : super(TarefaInitialState()) {
    on(_mapEventToState);
  }

  void _mapEventToState(TarefaEvent event, Emitter emit) async {
    List<TarefaModel> tarefas = [];

    emit(TarefaLoadingState());

    if (event is GetTarefas) {
      tarefas = await _repository.getTarefas();
    } else if (event is PostTarefas) {
      tarefas = await _repository.postTarefa(tarefa: event.tarefa);
    } else if (event is DeleteTarefa) {
      tarefas = await _repository.deleteTarefa(tarefa: event.tarefa);
    }

    emit(TarefaLoadedState(tarefas: tarefas));
  }
}
