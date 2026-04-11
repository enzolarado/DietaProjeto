import 'package:mydiet/app/model/alimento.dart';

class AlimentoRepository {
  static List<Alimento> tabela = [
    Alimento(nome: "Feijão", caloria: "15", carboidratos: "22", gordura: "76", proteina: "7"),
    Alimento(nome: "Farinha", caloria: "75", carboidratos: "99", gordura: "11", proteina: "76")
  ];
}