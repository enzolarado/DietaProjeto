
import 'package:flutter/material.dart';
import 'package:mydiet/app/model/refeicao.dart';

class RefeicaoCard extends StatelessWidget {
  final Refeicao refeicao;
  const RefeicaoCard({super.key, required this.refeicao});
  @override
  Widget build(BuildContext context) {
    final totalCalorias = refeicao.alimentoListaRefeicao.fold<double>(
      0,
      (total, alimento) {
        final cal = double.tryParse(alimento.caloria) ?? 0;
        return total + cal;
      },
    );
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ExpansionTile(
        title: Text(refeicao.nomeRefeicao),
        subtitle: Text(
          "Total de calorias: ${totalCalorias.toStringAsFixed(0)} kcal",
        ),

        children: refeicao.alimentoListaRefeicao.map((alimento) {
          return ListTile(
            title: Text(alimento.nome),
            subtitle: Text(
              "Unidade de medida: ${alimento.unidadeMedida}\n"
              "Valor da Cota:${alimento.valorCota}\n"
              "Calorias: ${alimento.caloria} kcal\n ",
            ),
          );
        }).toList(),
      ),
    );
  }
}
