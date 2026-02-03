import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/todo_provider.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodoProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(provider.currentList.name),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _addTaskDialog(context),
          ),
          IconButton(
            icon: const Icon(Icons.playlist_add),
            onPressed: () => _addListDialog(context),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: provider.currentList.tasks.length,
        itemBuilder: (context, index) {
          final task = provider.currentList.tasks[index];
          return CheckboxListTile(
            title: Text(task.title),
            value: task.done,
            onChanged: (_) => provider.toggleTask(index),
          );
        },
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(child: Text("Le tue liste")),
            ...List.generate(provider.lists.length, (i) {
              return ListTile(
                title: Text(provider.lists[i].name),
                selected: i == provider.selectedList,
                onTap: () {
                  provider.changeList(i);
                  Navigator.pop(context);
                },
              );
            })
          ],
        ),
      ),
    );
  }

  void _addTaskDialog(BuildContext context) {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Nuovo task"),
        content: TextField(controller: controller),
        actions: [
          TextButton(
            onPressed: () {
              Provider.of<TodoProvider>(context, listen: false)
                  .addTask(controller.text);
              Navigator.pop(context);
            },
            child: const Text("Aggiungi"),
          )
        ],
      ),
    );
  }

  void _addListDialog(BuildContext context) {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Nuova lista"),
        content: TextField(controller: controller),
        actions: [
          TextButton(
            onPressed: () {
              Provider.of<TodoProvider>(context, listen: false)
                  .addList(controller.text);
              Navigator.pop(context);
            },
            child: const Text("Crea"),
          )
        ],
      ),
    );
  }
}
