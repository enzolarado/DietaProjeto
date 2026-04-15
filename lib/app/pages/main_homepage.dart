import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'adicionarAlimento_page.dart';
import 'adicionarRefeicao_page.dart';
import 'configuracoes_page.dart';

import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  int _paginaAtual = 0;

  final List<Widget> _paginas = [
    ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const SizedBox(height: 30),
        Container(
          padding: const EdgeInsets.all(16),
          height: 150,
          color: Colors.red[100],
          child: const Center(child: Text('Dia atual...')),
        ),
        const SizedBox(height: 60),
        Container(
          height: 150,
          color: Colors.red[200],
          child: const Center(child: Text('Dia anterior...')),
        ),
      ],
    ),
    const Center(),
    const ConfiguracoesPage(),
    const Center(),
  ];

  void adicionarAlimento() {
      Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => AdicionarAlimento(),
      ),
    );
}

void adicionarRefeicao() {
  Navigator.push(
    context, 
    MaterialPageRoute(
      builder: (_) => AdicionarRefeicao()
      )
    );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyDiet'),
      ),
      body: _paginas[_paginaAtual],
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: Container(
          height: 50,
          color: Colors.red,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              
              IconButton(onPressed: () { setState(() { _paginaAtual = 0; }); }, icon: const Icon(Icons.home)),
              IconButton(onPressed: () { setState(() { _paginaAtual = 1; }); }, icon: const Icon(Icons.food_bank_outlined)),
              const SizedBox(width: 48),
              IconButton(onPressed: () { setState(() { _paginaAtual = 2; }); }, icon: const Icon(Icons.settings)),
              IconButton(onPressed: () { setState(() { _paginaAtual = 3; }); }, icon: const Icon(Icons.person)),
            ],
          ),
        ),
      ),
      floatingActionButton:SpeedDial(
        icon: Icons.add,
        activeIcon: Icons.close,

        children: [
          SpeedDialChild(
            child: Icon(FontAwesomeIcons.appleWhole),
            label: "Adicionar Alimento",
            onTap: () {
              adicionarAlimento();
            },
          ),
          SpeedDialChild(
            child: Icon(Icons.flatware_outlined),
            label: "Criar Refeição",
            onTap: () {
              adicionarRefeicao();
            },
          ),
        ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

    );
  }
  
  
}