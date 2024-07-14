
import 'package:flutter/material.dart';
import 'package:login_app/components/meu_boton.dart';
import 'package:login_app/components/meu_registro.dart';
import 'package:login_app/components/meu_textfield.dart';
import 'package:login_app/pages/principal.dart';
import 'package:login_app/pages/registro.dart'; // Assuming this is HomeScreen

class InicioSesion extends StatefulWidget {
  const InicioSesion({super.key});

  @override
  State<InicioSesion> createState() => _InicioSesionState();
}

class _InicioSesionState extends State<InicioSesion> {
  final _formKey = GlobalKey<FormState>();
  final _userController = TextEditingController();
  final _passwordController = TextEditingController();

  void iniciarSesion() {
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.indigo[600],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 50),
                const Icon(
                  Icons.lock,
                  size: 100,
                  color: Colors.white,
                ),
                const SizedBox(height: 50),
                const Text(
                  "¡Bienvenido/a, te hemos echado de menos!",
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),

                // Username TextField
                const SizedBox(height: 25),
                MeuTextField(
                  controller: _userController,
                  hintText: "Ingresa tu correo electrónico",
                  obscureText: false,
                ),

                // Password TextField
                const SizedBox(height: 15),
                MeuTextField(
                  controller: _passwordController,
                  hintText: "Ingresa tu contraseña",
                  obscureText: true,
                ),

                // "Forgot Password?" Text
                const SizedBox(height: 20),
                const Padding(
                  padding:EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "¿Olvidaste tu contraseña?",
                        style:TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),

                // Login Button
                const SizedBox(height: 25),
                MeuBoton(onTap: (){
                  final user = _userController.text;
                  final password = _passwordController.text;
                  if (_formKey.currentState!.validate()) {
                    if (user =="kedwin.guillen@unah.hn" && password == "20202000370") {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen(correoUsuario: user))
                          );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Inicio de sesión incorrecto'),
                                      ),
                                    );
                                  }
                                }
                }),
                // Register Button
                const SizedBox(height: 10),
                MeuRegistro(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => RegistroScreen()));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
