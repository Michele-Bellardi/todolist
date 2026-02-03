import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/todo_provider.dart';
import 'screens/list_screen.dart';
import 'screens/stats_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => TodoProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int pageIndex = 0;

  final pages = const [
    ListScreen(),
    StatsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: pages[pageIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: pageIndex,
          onTap: (i) => setState(() => pageIndex = i),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.list), label: "Lista"),
            BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: "Stats"),
          ],
        ),
      ),
    );
  }
}
