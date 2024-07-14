import 'package:flutter/material.dart';

class MeuTextField extends StatefulWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  const MeuTextField({
    super.key,
    this.controller,
    required this.hintText,
    required this.obscureText,
    
  });

  @override
  State<MeuTextField> createState() => _MeuTextFieldState();
}

class _MeuTextFieldState extends State<MeuTextField> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingresa texto';
              }
              return null;
            },
            controller:widget.controller,
            obscureText: widget.obscureText,
            decoration:(InputDecoration(
            enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white)
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)
              ),
              fillColor: Colors.white,
              filled:true,
              hintText: widget.hintText,
              hintStyle:TextStyle(color:Colors.grey[500])
            )
            )
        ),
      ),
    );
  }
}
