import 'package:flutter/material.dart';

class ConfiguracoesPage extends StatefulWidget {
  const ConfiguracoesPage({super.key});

  @override
  State<ConfiguracoesPage> createState() => _ConfiguracoesPageState();
}

class _ConfiguracoesPageState extends State<ConfiguracoesPage> {
  bool _temaEscuro = false;  // quando for fazer a implementação do tema, usar isso para controlar o tema claro/escuro Andre :P

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          const SizedBox(height: 60),

          Center(
            child: Column(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.blueGrey.shade200, width: 3),
                  ),
                  child: ClipOval(
                    child: Container(
                      color: Colors.white,
                      child: Center(
                        child: Image.asset(
                          'assets/mydiet.png',
                          fit: BoxFit.cover,
                          ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'MyDiet',
                   style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 32),

          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(
                    _temaEscuro ? Icons.dark_mode : Icons.light_mode,
                     color: Colors.black87,
                  ),
                  title: const Text('Tema'),
                  trailing: Switch(
                    value: _temaEscuro,
                    onChanged: (valor) {
                      setState(() {
                        _temaEscuro = valor;
                      });
                    },
                    activeColor: Colors.red,
                  ),
                ),

                const Divider(height: 1, indent: 16, endIndent: 16),

                ListTile(
                  leading: const Icon(Icons.quiz_outlined, color: Colors.black87),
                  title: const Text('FAQ'),
                  onTap: () { // TODO: implementar FAQ
                  },
                ),

                const Divider(height: 1, indent: 16, endIndent: 16),

                ListTile(
                  leading: const Icon(Icons.help_outline, color: Colors.black87),
                  title: const Text('Entre em contato conosco'),
                  onTap: () { // TODO: implementar contato
                  },
                ),
              ],
            ),
          ),

          Spacer(),
        ],
      ),
    );
  }
}