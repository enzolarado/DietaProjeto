import 'package:flutter/material.dart';
 
class MainHome extends StatelessWidget {
  const MainHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyDiet'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        
        children: [
          Container(
            height: 150,
            color: Colors.red[100],
            child: const Center(
              child: Text('Banner de Promoção'),
            ),
          ),

          const SizedBox(height: 16),
          Container(
            height: 150,
            color: Colors.red[200],
            child: const Center(child: Text('Recomendações de Dieta')),
          ),
          
          const SizedBox(height: 16),
          Container(
            height: 150,
            color: Colors.red[300],
            child: const Center(child: Text('Dicas de Exercícios')),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50,
          color: Colors.red,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Icon(Icons.home, color: Colors.white),
              Icon(Icons.search, color: Colors.white),
              Icon(Icons.person, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}