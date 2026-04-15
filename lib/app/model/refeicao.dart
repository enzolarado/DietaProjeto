import 'package:mydiet/app/model/alimento.dart';

class Refeicao {
  String nomeRefeicao;
  DateTime dataRefeicao;
  List<Alimento> alimentoListaRefeicao;
  String periodoRefeicao;

  Refeicao({required this.nomeRefeicao,required this.dataRefeicao,required this.alimentoListaRefeicao,required this.periodoRefeicao});
}