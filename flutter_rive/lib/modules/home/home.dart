// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 20),
        primary: Colors.red,
        padding: const EdgeInsets.all(15));
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              const Text(
                "Terminos y condiciones",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                "Para usar esa aplicacione s necesario que aceptes los terminos y condiciones Para usar esa aplicacione s necesario que aceptes los terminos y condiciones Para usar esa aplicacione es necesario que aceptes los terminos y condiciones Para usar esa aplicacione s necesario que aceptes los terminos y condiciones",
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Para usar esa aplicacione s necesario que aceptes los terminos y condiciones Para usar esa aplicacione s necesario que aceptes los terminos y condiciones Para usar esa aplicacione es necesario que aceptes los terminos y condiciones Para usar esa aplicacione s necesario que aceptes los terminos y condiciones",
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Para usar esa aplicacione s necesario que aceptes los terminos y condiciones Para usar esa aplicacione s necesario que aceptes los terminos y condiciones Para usar esa aplicacione es necesario que aceptes los terminos y condiciones Para usar esa aplicacione s necesario que aceptes los terminos y condiciones",
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Para usar esa aplicacione s necesario que aceptes los terminos y condiciones Para usar esa aplicacione s necesario que aceptes los terminos y condiciones Para usar esa aplicacione es necesario que aceptes los terminos y condiciones Para usar esa aplicacione s necesario que aceptes los terminos y condiciones",
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                style: style,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("Aceptar todo"),
                      Icon(Icons.arrow_forward_ios)
                    ]),
              ),
            ],
          ),
        ));
  }
}
