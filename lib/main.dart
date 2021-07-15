import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

main() => runApp(new PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      'texto': 'Qual o físico mais famoso?',
      'respostas': [
        {'texto': 'Einsten', 'pontuacao': 10},
        {'texto': 'Copérnico', 'pontuacao': 1},
        {'texto': 'Newton', 'pontuacao': 6},
        {'texto': 'Galileo', 'pontuacao': 3},
      ],
    },
    {
      'texto': 'Qual o físico mais importante?',
      'respostas': [
        {'texto': 'Einsten', 'pontuacao': 8},
        {'texto': 'Copérnico', 'pontuacao': 4},
        {'texto': 'Newton', 'pontuacao': 10},
        {'texto': 'Galileo', 'pontuacao': 5},
      ],
    },
    {
      'texto': 'Qual o dev mais famoso?',
      'respostas': [
        {'texto': 'Léo', 'pontuacao': 10},
        {'texto': 'Carlos', 'pontuacao': 9},
        {'texto': 'Paula', 'pontuacao': 8},
        {'texto': 'Ana', 'pontuacao': 7},
      ],
    }
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
        print(pontuacao);
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
