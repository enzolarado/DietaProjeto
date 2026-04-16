import 'package:flutter/material.dart';
import 'package:mydiet/app/app.dart';
import 'package:mydiet/app/repositories/alimento_repository.dart';
import 'package:mydiet/app/repositories/refeicao_repository.dart';
import 'package:mydiet/app/theme/themecontroller.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AlimentoRepository(),
        ),
        ChangeNotifierProvider(
          create: (_) => RefeicaoRepository(),
        ),
        ChangeNotifierProvider(
          create: (_) => ThemeController()
          ),
      ],
      child: App(),
    ),
  );
}

