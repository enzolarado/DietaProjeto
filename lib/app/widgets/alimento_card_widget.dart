import 'package:flutter/material.dart';
import 'package:mydiet/app/model/alimento.dart';


class AlimentosCard extends StatelessWidget {
  final Alimento alimento;
  final bool selecionado;
  final VoidCallback onTap;

  const AlimentosCard({
    super.key,
    required this.alimento,
    required this.selecionado,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      leading: selecionado
          ? const CircleAvatar(child: Icon(Icons.check))
          : const Icon(Icons.square_outlined),
      title: Text(
        alimento.nome,
        style: const TextStyle(fontSize: 25),
      ),
      subtitle: Text(
        "Gordura: ${alimento.gordura}g\n"
        "Caloria: ${alimento.caloria}g\n"
        "Carboidratos: ${alimento.carboidratos}g\n"
        "Proteína: ${alimento.proteina}g",
      ),
      selected: selecionado,
      selectedTileColor: Colors.greenAccent,
      onTap: onTap,
    );
  }
}
