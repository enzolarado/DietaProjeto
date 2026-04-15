import 'package:flutter/material.dart';
import 'package:mydiet/app/app.dart';
import 'package:mydiet/app/repositories/alimento_repository.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AlimentoRepository(),
      child: App(),
    ),
  );
}
