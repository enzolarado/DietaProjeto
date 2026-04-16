import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CampoTexto extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData? icone;
  final String? textoSufixo;
  final bool apenasNumeros;
  final String? erroVazio;

  const CampoTexto({
    super.key,
    required this.controller,
    required this.label,
    this.icone,
    this.textoSufixo,
    required this.apenasNumeros,
    this.erroVazio,

  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: SizedBox(
        height: 60,
        child: TextFormField(
          controller: controller,
          style: const TextStyle(fontSize: 18),
          decoration: InputDecoration(
            labelText: label,
            prefixIcon: icone != null ? Icon(icone) : null,

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(width: 2),
            ),

            contentPadding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 12,
            ),

            suffixText: textoSufixo,
          ),
          keyboardType: apenasNumeros
              ? TextInputType.number
              : TextInputType.text,
          inputFormatters: apenasNumeros
              ? [FilteringTextInputFormatter.allow(RegExp(r'^\d+\,?\d{0,2}'))]
              : null,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return erroVazio;
            }
            return null;
          },
        ),
      ),
    );
  }
}
