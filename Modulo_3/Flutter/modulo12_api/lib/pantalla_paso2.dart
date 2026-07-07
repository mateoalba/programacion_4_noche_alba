import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

import 'todo_dto.dart';

class PantallaPaso2 extends StatelessWidget {
  const PantallaPaso2({super.key});

  Future<List<TodoDto>> _fetchTodos() async {
    final res = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/todos?_limit=15'),
    );
    final lista = jsonDecode(res.body) as List<dynamic>;
    return lista
        .map((e) => TodoDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paso 2 · DTO simple'),
        leading: BackButton(onPressed: () => context.go('/')),
      ),
      body: FutureBuilder<List<TodoDto>>(
        future: _fetchTodos(),
        builder: (context, snap) {
          if (snap.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snap.hasError) {
            return Center(child: Text('Error: ${snap.error}'));
          }

          final todos = snap.data!;
          final completadas = todos.where((t) => t.completed).length;
          final pendientesTodo = todos.where((t) => t.pendiente).toList();
          final largos = todos.where((t) => t.title.length > 30).length;

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Chip(
                      label: Text('$completadas completadas'),
                      backgroundColor: Colors.green[100],
                    ),
                    const SizedBox(width: 8),
                    Chip(
                      label: Text('${pendientesTodo.length} pendientes'),
                      backgroundColor: Colors.orange[100],
                    ),
                    const SizedBox(width: 8),
                    Chip(
                      label: Text('$largos +30 chars'),
                      backgroundColor: Colors.blue[100],
                    ),
                  ],
                ),
              ),
              Text(
                'Tareas pendientes:',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: pendientesTodo.length,
                  itemBuilder: (context, i) {
                    final t = pendientesTodo[i];
                    return CheckboxListTile(
                      title: Text(t.title),
                      subtitle: Text('ID: ${t.id}'),
                      value: t.completed,
                      onChanged: null,
                      activeColor: Colors.green,
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
