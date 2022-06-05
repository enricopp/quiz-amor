class Perguntas {
  var questao;
  bool? respostaDaQuestao;

  Perguntas({var q, bool? r}) {
    questao = q;
    respostaDaQuestao = r;
  }
}

Perguntas novaPergunta = Perguntas(q: 'asda', r: true);
