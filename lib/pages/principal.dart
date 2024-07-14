import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String correoUsuario;

  const HomeScreen({Key? key, required this.correoUsuario}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pantalla de inicio'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Text('¡Bienvenido!', style: TextStyle(fontSize: 24.0)),
            SizedBox(height: 16.0),
            Text(
              'Correo electrónico: ${correoUsuario}',
              style: TextStyle(fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }
}
