import 'package:flutter/material.dart';
import 'helper.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Helper helper = Helper();

void main() => runApp(QuizApp());

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 187, 239, 252),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> marcadorDePontos = [];

  void conferirResposta(bool respostaSelecionadaPeloUsuario) {
    bool? respostaCerta = helper.obterResposta();

    setState(() {
      if (helper.confereFimDaExecucao() == true) {
        Alert(
          context: context,
          title: 'Fim do Quiz!',
          desc: 'Você respondeu a todas as perguntas.',
        ).show();

        helper.resetarQuiz();

        marcadorDePontos = [];
      } else {
        if (respostaSelecionadaPeloUsuario == respostaCerta) {
          marcadorDePontos.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          marcadorDePontos.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        helper.proximaPergunta();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                helper.obterQuestao(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 50.0,
                  fontFamily: 'Nunito',
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
              // ignore: prefer_const_constructors
              child: Text(
                'Verdadeiro',
                // ignore: prefer_const_constructors
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                ),
              ),
              onPressed: () {
                conferirResposta(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
              // ignore: prefer_const_constructors
              child: Text(
                'Falso',
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                conferirResposta(false);
              },
            ),
          ),
        ),
        Row(
          children: marcadorDePontos,
        ),
      ],
    );
  }
}
