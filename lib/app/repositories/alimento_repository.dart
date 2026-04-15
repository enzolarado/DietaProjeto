import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:mydiet/app/model/alimento.dart';

class AlimentoRepository extends ChangeNotifier {
  final List<Alimento> _listaAlimentos = [];

  UnmodifiableListView<Alimento> get listaAlimentos =>
      UnmodifiableListView(_listaAlimentos);

  AlimentoRepository() {
    _listaAlimentos.addAll([
      Alimento(
        nome: "Arroz",
        caloria: "12",
        carboidratos: "23",
        gordura: "43",
        proteina: "11",
      ),
      Alimento(
        nome: "Feijão",
        caloria: "15",
        carboidratos: "22",
        gordura: "76",
        proteina: "7",
      ),
      Alimento(
        nome: "Farinha",
        caloria: "75",
        carboidratos: "99",
        gordura: "11",
        proteina: "76",
      ),
    ]);
    notifyListeners();
  }

  void saveAll(List<Alimento> alimentos) {
    for (var alimento in alimentos) {
      if (!_listaAlimentos.contains(alimento)) _listaAlimentos.add(alimento);
    }
    notifyListeners();
  }

  void saveAlimento(Alimento alimento){
    _listaAlimentos.add(alimento);
    notifyListeners();
  }

  void remove(Alimento alimento) {
    _listaAlimentos.remove(alimento);
    notifyListeners();
  }
}
