import 'package:login_app/pages/registro.dart';
import 'package:flutter/material.dart';

class MeuRegistro extends StatelessWidget {
  final Function()? onTap;
  const MeuRegistro({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const  EdgeInsets.symmetric(horizontal:25),
        decoration: BoxDecoration(color: Colors.green,
            borderRadius: BorderRadius.circular(10)),
        child:const Center(
            child: Text("Registrarse",
                style:TextStyle(
                    color: Colors.white,
                    fontWeight:FontWeight.bold,
                    fontSize: 20)
            )
        ),
      ),
      onTap:(){
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => RegistroScreen()));
      },
    );
  }
}
