import 'package:login_app/pages/inicio_sesion.dart';
import 'package:login_app/pages/principal.dart';
import 'package:login_app/pages/registro.dart';
import 'package:login_app/routes/mis_routes.dart';
import 'package:flutter/material.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  MisRoutes.IniciarSesion.name: (context) => InicioSesion(),
  MisRoutes.Registro.name: (context) => RegistroScreen(),
  MisRoutes.Principal.name: (context) => HomeScreen(correoUsuario: 'kedwin.guillen@unah.hn',),

};