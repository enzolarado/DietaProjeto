import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CampoTexto extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData? icone;
  final String? textoSufixo;
  final bool apenasNumeros;
  final String erroVazio; 

  const CampoTexto({
    super.key,
    required this.controller,
    required this.label,
    this.icone,
    this.textoSufixo,
    required this.apenasNumeros,
    required this.erroVazio
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(fontSize: 22),
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: label,
        prefixIcon: icone != null ? Icon(icone) : null,
        suffix: textoSufixo != null ?
         Text(textoSufixo.toString()) : null, 
      ),
      keyboardType: apenasNumeros ? TextInputType.number : TextInputType.text,
      inputFormatters: apenasNumeros ? [FilteringTextInputFormatter.digitsOnly] : null,

      validator: (value) {
                  if (value!.isEmpty) {
                    return erroVazio;
                  }
                  return null;
                },
    );
   
  }
 
}
