import 'package:flutter/material.dart';
import 'package:gerenciador_tarefas_bloc/app/pages/tarefas_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Rubik',
        appBarTheme: AppBarTheme(
          centerTitle: true,
          color: Colors.yellow[200],
          elevation: 4,
          shadowColor: Colors.amber[900],
        ),
      ),
      routes: {
        '/': (_) => const TarefasPage(),
      },
    );
  }
}
