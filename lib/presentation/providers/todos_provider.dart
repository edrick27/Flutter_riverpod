import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_app/config/config.dart';
import 'package:river_app/domain/domain.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();


final todosProvider = StateNotifierProvider<TodosNotifier, List<Todo>>((ref) {
  return TodosNotifier();
});


class TodosNotifier extends StateNotifier<List<Todo>> {
 
  TodosNotifier() : super([
    Todo(
      id: _uuid.v4(),
      description: RandomGenerator.getRandonName(),
      completedAt: null,
    ),
    Todo(
      id: _uuid.v4(),
      description: RandomGenerator.getRandonName(),
      completedAt: null,
    ),
    Todo(
      id: _uuid.v4(),
      description: RandomGenerator.getRandonName(),
      completedAt: DateTime.now(),
    )
  ]);

  void addTodo() {

    final todo = Todo(
      id: _uuid.v4(),
      description: RandomGenerator.getRandonName(),
      completedAt: null,
    );

    state = [
      todo,
      ...state,
    ];
  }

  void toggleTodo(String id) {

    state = state.map((todo) {

      if(todo.id != id) return todo;
      
      if(todo.done) return todo.copyWith(completedAt: null);
      
      return todo.copyWith(completedAt:  DateTime.now());

    }).toList();
  }
}