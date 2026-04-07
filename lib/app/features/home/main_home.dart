import 'package:flutter/material.dart';
 
class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}