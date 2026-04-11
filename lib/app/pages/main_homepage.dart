import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'adicionarAlimento_page.dart';
import 'adicionarRefeicao_page.dart';

import 'package:flutter_speed_dial/flutter_speed_dial.dart';
 
class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {

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
      body: ListView(
        padding: const EdgeInsets.all(16),
        
        children: [
          const SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.all(16),
            height: 150,
            color: Colors.red[100],
            child: const Center(
              child: Text('Dia atual...'),
            ),
          ),

          const SizedBox(height: 60),
          Container(
            height: 150,
            color: Colors.red[200],
            child: const Center(
              child: Text('Dia anterior...'),
              ),
          ),
          
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: Container(
          height: 50,
          color: Colors.red,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              
              IconButton(onPressed: () {}, icon: const Icon(Icons.home)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.food_bank_outlined)),
              const SizedBox(width: 48),
              IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.person)),
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
            label: "Alimento",
            onTap: () {
              adicionarAlimento();
            },
          ),
          SpeedDialChild(
            child: Icon(Icons.flatware_outlined),
            label: "Refeição",
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

