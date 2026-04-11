import 'package:flutter/material.dart';
import 'package:mydiet/app/model/alimento.dart';
import 'package:mydiet/app/repositories/alimento_repository.dart';

class AdicionarRefeicao extends StatefulWidget {
  const AdicionarRefeicao({super.key});

  @override
  State<AdicionarRefeicao> createState() => _AdicionarRefeicaoState();
}

class _AdicionarRefeicaoState extends State<AdicionarRefeicao> {
  final tabela = AlimentoRepository.tabela;
  List<Alimento> selecionados = [];
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Criar Refeicao'),
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext content, int alimento){
          return ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))
              ),
            leading: selecionados.contains(tabela[alimento])
            ? CircleAvatar(
              child: Icon((Icons.check)),
              ):
              Icon(Icons.square_outlined),
            title: Text(tabela[alimento].nome),
            subtitle: Text(tabela[alimento].gordura),
            trailing: Text(tabela[alimento].caloria),
            selected: selecionados.contains(tabela[alimento]),
            selectedTileColor: Colors.greenAccent,
            onLongPress: (){
              setState(() {
                (selecionados.contains(tabela[alimento]))
                    ? selecionados.remove(tabela[alimento])
                    : selecionados.add(tabela[alimento]);
              });
            },
          );
        },
        padding: EdgeInsets.all(16),
        separatorBuilder: (_, _) => Divider(), 
        itemCount: tabela.length)
    );
  }
}