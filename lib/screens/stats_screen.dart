import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/todo_provider.dart';

class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodoProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Statistiche")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Lista: ${provider.currentList.name}",
                style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            Text("Totale task: ${provider.totalTasks}"),
            Text("Completati: ${provider.doneTasks}"),
            Text("Da fare: ${provider.todoTasks}"),
            Text("Efficienza: ${provider.efficiency.toStringAsFixed(1)}%"),
          ],
        ),
      ),
    );
  }
}
