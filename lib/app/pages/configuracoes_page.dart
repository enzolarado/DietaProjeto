import 'package:flutter/material.dart';
import 'package:mydiet/app/theme/themecontroller.dart';
import 'package:provider/provider.dart';

class ConfiguracoesPage extends StatefulWidget {
  const ConfiguracoesPage({super.key});
  @override
  State<ConfiguracoesPage> createState() => _ConfiguracoesPageState();
}

class _ConfiguracoesPageState extends State<ConfiguracoesPage> {
  @override
  Widget build(BuildContext context) {
    final themeController = context.watch<ThemeController>();
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
                    border: Border.all(
                      color: Theme.of(context).cardColor,
                      width: 3,
                    ),
                  ),
                  child: ClipOval(
                    child: Container(
                      color: Theme.of(context).textTheme.bodyMedium?.color,
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
                    themeController.isDark ? Icons.dark_mode : Icons.light_mode,
                    color: Colors.black87,
                  ),
                  title: const Text('Tema'),
                  trailing: Switch(
                    value: themeController.isDark,
                    onChanged: (valor) {
                      context.read<ThemeController>().toggleTheme(valor);
                    },
                  ),
                ),

                const Divider(height: 1, indent: 16, endIndent: 16),

                ListTile(
                  leading: const Icon(
                    Icons.quiz_outlined,
                    color: Colors.black87,
                  ),
                  title: const Text('FAQ'),
                  onTap: () {
                    // TODO: implementar FAQ
                  },
                ),

                const Divider(height: 1, indent: 16, endIndent: 16),

                ListTile(
                  leading: const Icon(
                    Icons.help_outline,
                    color: Colors.black87,
                  ),
                  title: const Text('Entre em contato conosco'),
                  onTap: () {
                    // TODO: implementar contato
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
