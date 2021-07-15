import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

main() => runApp(new PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  final _perguntas = const [
    {
      'texto': 'Qual o físico mais famoso?',
      'respostas': [
        {'texto': 'Einsten', 'nota': 10},
        {'texto': 'Copérnico', 'nota': 1},
        {'texto': 'Newton', 'nota': 6},
        {'texto': 'Galileo', 'nota': 3},
      ],
    },
    {
      'texto': 'Qual o físico mais importante?',
      'respostas': [
        {'texto': 'Einsten', 'nota': 8},
        {'texto': 'Copérnico', 'nota': 4},
        {'texto': 'Newton', 'nota': 10},
        {'texto': 'Galileo', 'nota': 5},
      ],
    },
    {
      'texto': 'Qual o dev mais famoso?',
      'respostas': [
        {'texto': 'Léo', 'nota': 10},
        {'texto': 'Carlos', 'nota': 9},
        {'texto': 'Paula', 'nota': 8},
        {'texto': 'Ana', 'nota': 7},
      ],
    }
  ];

  void _responder() {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
      });
    }
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder,
              )
            : Resultado(),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
