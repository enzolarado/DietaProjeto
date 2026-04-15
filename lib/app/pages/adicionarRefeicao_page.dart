import 'package:flutter/material.dart';
import 'package:mydiet/app/model/alimento.dart';
import 'package:mydiet/app/repositories/alimento_repository.dart';
import 'package:mydiet/app/widgets/alimento_card_widget.dart';
import 'package:mydiet/app/widgets/form_field_wiget.dart';
import 'package:provider/provider.dart';

class AdicionarRefeicao extends StatefulWidget {
  const AdicionarRefeicao({super.key});

  @override
  State<AdicionarRefeicao> createState() => _AdicionarRefeicaoState();
}

class _AdicionarRefeicaoState extends State<AdicionarRefeicao> {
  late AlimentoRepository alimentosTabela;
  final tabela = []; //AlimentoRepository.alimentosTabela;
  String? valorSelecionado;
  final _formRef = GlobalKey<FormState>();
  List<Alimento> selecionados = [];
  final _nomeRefeicao = TextEditingController();

  void criarRefeicao() {
    if (_formRef.currentState!.validate() && selecionados.isNotEmpty) {
      // Salvar o alimento
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Refeicao criada com sucesso!'),backgroundColor: Colors.green,),
      );
      Navigator.pop(context);
    } else {
      if (selecionados.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Selecione pelo menos um alimento",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    _nomeRefeicao.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    alimentosTabela = Provider.of<AlimentoRepository>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Criar Refeicao'),
      ),
      body: Column(
        children: [
          Form(
            key: _formRef,
            child: Padding(
              padding: const EdgeInsets.all(21),
              child: Column(
                children: [
                  CampoTexto(
                    controller: _nomeRefeicao,
                    label: "Digite o nome da refeição",
                    apenasNumeros: false,
                    erroVazio: "Digite um nome para a refeição!",
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  DropdownButtonFormField(
                    initialValue: valorSelecionado,
                    hint: Text("Selecione o período da refeição"),
                    items: [
                      DropdownMenuItem(
                        value: "1",
                        child: Text("Café da Manhã"),
                      ),
                      DropdownMenuItem(
                        value: "2",
                        child: Text("Almoço"),
                      ),
                      DropdownMenuItem(
                        value: "3",
                        child: Text("Lanche da Tarde"),
                      ),
                      DropdownMenuItem(
                        value: "4",
                        child: Text("Janta"),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        valorSelecionado = value;
                      });
                    },
                    validator: (value) {
                      if (value == null) {
                        return "Selecione um período";
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),

          Expanded(
            child: Consumer<AlimentoRepository>(
              builder: (context, alimentosTabela, child) {
                return alimentosTabela.listaAlimentos.isEmpty
                    ? ListTile(
                        title: Text(
                          'Nenhum alimento encontrado, crie-os antes de adicionar uma refeição!',
                        ),
                      )
                    : ListView.builder(
                        itemCount: alimentosTabela.listaAlimentos.length,
                        itemBuilder: (_, index) {
                          final selecionado = selecionados.contains(alimentosTabela.listaAlimentos[index]);
                          final alimento = alimentosTabela.listaAlimentos[index];
                          return AlimentosCard(
                            alimento: alimento,
                            selecionado: selecionado,
                            onTap: () {
                              setState(() {
                                if (selecionado) {
                                  selecionados.remove(alimento);
                                } else {
                                  selecionados.add(alimento);
                                }
                              });
                            },
                          );
                        },
                      );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: criarRefeicao,
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
