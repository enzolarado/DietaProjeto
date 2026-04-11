import 'package:flutter/material.dart';
import 'package:mydiet/app/widgets/form_field_wiget.dart';
class AdicionarAlimento extends StatefulWidget {
  const AdicionarAlimento({super.key});

  @override
  State<AdicionarAlimento> createState() => _AdicionarAlimentoState();
}

class _AdicionarAlimentoState extends State<AdicionarAlimento> {
  final _form = GlobalKey<FormState>();
  final _nomeAlimento = TextEditingController();
  final _qntdCalorias = TextEditingController();
  final _qntdProteina = TextEditingController();
  final _qntdCarboidrato = TextEditingController();
  final _qntdGordura = TextEditingController();
  String? valorSelecionado;

  

void criarAlimento(){
  if (_form.currentState!.validate()) {
      // Salvar a compra
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Alimento criado com sucesso!')),
      );
    }
}
  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('Adicionar Alimento'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Form(
                key: _form,
                  child: Column(
                  children: [
                    CampoTexto(
                                controller: _nomeAlimento,
                                label: 'Nome do alimento',
                                icone: Icons.fastfood,
                                apenasNumeros: false,
                                erroVazio: "Digite o nome do alimento",
                              ),
                    CampoTexto(
                      controller: _qntdCalorias, 
                      label: "Qntd de caloria",
                      textoSufixo: "Kcal", 
                      apenasNumeros: true,
                      erroVazio: "Digite a qntd de calorias!",
                    ),
                    CampoTexto(
                      controller:  _qntdCarboidrato, 
                      label:"Qntd de carboidratos",
                      textoSufixo: "g",
                      apenasNumeros: true,
                      erroVazio: "Digite a qntd de carboidratos!",
                      ),
                    CampoTexto(controller: _qntdGordura, label: "Qntd de gordura",textoSufixo: "g",apenasNumeros: true,erroVazio: "Digite a qntd de gordura",),
                    CampoTexto(controller: _qntdProteina, label: "Qntd de proteina",textoSufixo: "g",apenasNumeros: true, erroVazio: "Digite a qntd de proteina",),      
                  ].expand((widget) => [ widget ,const SizedBox(height: 16,)]).toList(),
                ),
              ), 
              Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.only(top: 24),
              child: ElevatedButton(
                onPressed: criarAlimento,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        'Criar',
                        style: TextStyle(fontSize: 20),
                       ),
                     ),
                     Icon(Icons.add),
                   ]),
                  ),
               ), 
           ], ),
        ), 
      );
  }

  @override
  void dispose() {
  _nomeAlimento.dispose();
  _qntdCalorias.dispose();
  _qntdCarboidrato.dispose();
  _qntdGordura.dispose();
  _qntdProteina.dispose();
  super.dispose();
}
}
