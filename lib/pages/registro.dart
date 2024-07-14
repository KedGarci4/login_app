import 'package:flutter/material.dart';
import 'package:login_app/pages/principal.dart';

class RegistroScreen extends StatefulWidget {
  @override
  _RegistroScreenState createState() => _RegistroScreenState();
}

class _RegistroScreenState extends State<RegistroScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _correoController = TextEditingController();
  final _telefonoController = TextEditingController();
  final _contrasenaController = TextEditingController();
  final _confirmarContrasenaController = TextEditingController();

  void _registrarUsuario() {
    if (_formKey.currentState!.validate()) {
      final nombre = _nombreController.text;
      final correo = _correoController.text;
      final telefono = _telefonoController.text;
      final contrasena = _contrasenaController.text;
      final confirmarContrasena = _confirmarContrasenaController.text;    
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(
            correoUsuario: correo, 
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: const Text('Registro'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Nombre',
                  ),
                  controller: _nombreController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'El nombre es obligatorio';
                    }
                    if (value.length < 3) {
                      return 'El nombre debe tener al menos 3 caracteres';
                    }
                    if (value.length > 10) {
                      return 'El nombre debe tener máximo 10 caracteres';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Correo electrónico'),
                  controller: _correoController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'El correo electrónico es obligatorio';
                    }
                    if (!RegExp(r"[a-zA-Z0-9.+_-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}").hasMatch(value)) {
                      return 'Correo electrónico no válido';
                    }
                    if (!RegExp(r"[a-zA-Z0-9.+_-]+@.+\.edu\.hn").hasMatch(value)) {
                      return 'El correo electrónico debe terminar en ".edu.hn"';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Teléfono'),
                  controller: _telefonoController,
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'El teléfono es obligatorio';
                    }
                    if (value.length > 8) {
                      return 'El teléfono no puede tener más de 8 dígitos';
                    }
                    if (!value.startsWith('3') && !value.startsWith('9')) {
                      return 'El teléfono debe comenzar con 3 o 9';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Contraseña'),
                  controller: _contrasenaController,
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'La contraseña es obligatoria';
                    }
                    if (value.length < 8) {
                      return 'La contraseña debe tener al menos 8 caracteres';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Confirmar contraseña'),
                  controller: _confirmarContrasenaController,
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Confirmar tu contraseña es obligatorio';
                    }
                    if (value != _contrasenaController.text) {
                      return 'Las contraseñas no coinciden';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 32.0),
                Center(
                  child: ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.lightBlueAccent), textStyle: MaterialStatePropertyAll(TextStyle(color: Colors.white))),
                    onPressed: _registrarUsuario,
                    child: Text('Registrarse'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
