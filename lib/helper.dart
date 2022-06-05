// ignore_for_file: prefer_final_fields

import 'perguntas.dart';

class Helper {
  int _numerdoDaPergunta = 0;
  // ignore: prefer_final_fields
  List<Perguntas> _bancoDePerguntas = [
    Perguntas(q: 'A gente já estudou junto em alguma escola?', r: false),
    Perguntas(q: 'Nunca fomos ao cinema antes dos 6 meses de namoro?', r: true),
    Perguntas(q: 'Demoramos 3 dias para dar o primeiro beijo?', r: false),
    Perguntas(q: 'Gostamos de cozinhar juntos?', r: true),
    Perguntas(q: 'Nascemos no mesmo hospital?', r: false),
    Perguntas(q: 'A Thayná falou eu te amo primeiro?', r: false),
    Perguntas(q: 'Já ficamos um mês sem nos vermos?', r: true),
    Perguntas(
        q: 'O primeiro filme que vimos juntos foi "até o ultimo Homem"',
        r: false),
    Perguntas(
        q: 'Já brigamos e ficamos um dia inteiro sem se falar por causa disso?',
        r: false),
    Perguntas(
        q: 'A primeira coisa que a gente comeu junto foi doritos?', r: false),
  ];

  void proximaPergunta() {
    if (_numerdoDaPergunta < _bancoDePerguntas.length - 1) {
      _numerdoDaPergunta++;
    }
    print(_numerdoDaPergunta);
    print(_bancoDePerguntas);
  }

  String obterQuestao() {
    return _bancoDePerguntas[_numerdoDaPergunta].questao;
  }

  bool? obterResposta() {
    return _bancoDePerguntas[_numerdoDaPergunta].respostaDaQuestao;
  }

  confereFimDaExecucao() {
    if (_numerdoDaPergunta >= _bancoDePerguntas.length - 1) {
      print('Chegou na última pergunta do quiz');
      return true;
    } else {
      return false;
    }
  }

  resetarQuiz() {
    _numerdoDaPergunta = 0;
  }
}
