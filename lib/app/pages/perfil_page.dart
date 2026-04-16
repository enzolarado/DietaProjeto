import 'package:flutter/material.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({super.key});

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  String nome = 'Deyde Lado';
  String email = 'exemplo@example.com';
  String phone = '(99) 9 9999-9999';
  String peso = '90 Kg';
  String altura = '176 Cm';

  void abrirEdicao() async {
    final resultado = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => _EditarPerfilPage(
          nome: nome,
          email: email,
          phone: phone,
          peso: peso,
          altura: altura,
        ),
      ),
    );

    if (resultado != null) {
      setState(() {
        nome = resultado['nome'];
        email = resultado['email'];
        phone = resultado['phone'];
        peso = resultado['peso'];
        altura = resultado['altura'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Perfil'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 16),

            const CircleAvatar(
              radius: 50,
              backgroundColor: Color(0xFFB0C4DE),
              child: Icon(Icons.person, size: 60, color: Colors.white),
            ),

            const SizedBox(height: 32),

            _Campo(label: 'Name:', valor: nome),
            _Campo(label: 'Email:', valor: email),
            _Campo(label: 'Phone:', valor: phone),
            _Campo(label: 'Peso:', valor: peso),
            _Campo(label: 'Altura:', valor: altura),

            const SizedBox(height: 40),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: abrirEdicao,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF90A4AE),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text('Editar', style: TextStyle(fontSize: 16)),
              ),
            ),

            const SizedBox(height: 16),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // TODO: tem que fazer logout pra entrega 2
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFBBDEFB),
                  foregroundColor: Colors.grey[700],
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text('Sair da conta', style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EditarPerfilPage extends StatefulWidget {
  final String nome, email, phone, peso, altura;

  const _EditarPerfilPage({
    required this.nome,
    required this.email,
    required this.phone,
    required this.peso,
    required this.altura,
  });

  @override
  State<_EditarPerfilPage> createState() => _EditarPerfilPageState();
}

class _EditarPerfilPageState extends State<_EditarPerfilPage> {
  late TextEditingController _nome;
  late TextEditingController _email;
  late TextEditingController _phone;
  late TextEditingController _peso;
  late TextEditingController _altura;

  @override
  void initState() {
    super.initState();
    _nome = TextEditingController(text: widget.nome);
    _email = TextEditingController(text: widget.email);
    _phone = TextEditingController(text: widget.phone);
    _peso = TextEditingController(text: widget.peso);
    _altura = TextEditingController(text: widget.altura);
  }

  @override
  void dispose() {
    _nome.dispose();
    _email.dispose();
    _phone.dispose();
    _peso.dispose();
    _altura.dispose();
    super.dispose();
  }

  void salvar() {
    Navigator.pop(context, {
      'nome': _nome.text,
      'email': _email.text,
      'phone': _phone.text,
      'peso': _peso.text,
      'altura': _altura.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Editar Perfil')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            _CampoEdicao(controller: _nome, label: 'Nome'),
            _CampoEdicao(controller: _email, label: 'Email'),
            _CampoEdicao(controller: _phone, label: 'Phone'),
            _CampoEdicao(controller: _peso, label: 'Peso'),
            _CampoEdicao(controller: _altura, label: 'Altura'),

            const SizedBox(height: 32),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: salvar,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF90A4AE),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text('Salvar', style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CampoEdicao extends StatelessWidget {
  final TextEditingController controller;
  final String label;

  const _CampoEdicao({required this.controller, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}

class _Campo extends StatelessWidget {
  final String label;
  final String valor;

  const _Campo({required this.label, required this.valor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          SizedBox(
            width: 80,
            child: Text(label, style: const TextStyle(color: Colors.black54, fontSize: 15)),
          ),
          Text(valor, style: const TextStyle(color: Colors.black87, fontSize: 15)),
        ],
      ),
    );
  }
}