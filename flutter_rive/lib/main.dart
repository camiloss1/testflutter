import 'package:flutter/material.dart';

import 'modules/home/home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Mi App",
      home: Inicio(
        tittle: 'My App',
      ),
    );
  }
}

class Inicio extends StatefulWidget {
  const Inicio({super.key, required this.tittle});
  final String tittle;
  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.tittle)),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Bienvenido a la app"),
            ElevatedButton(
                child: const Text("Ir a la otra pagina"),
                onPressed: () => {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const Home()))
                    })
          ],
        )));
  }
}
