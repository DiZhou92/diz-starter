import 'dart:math';

import 'card.dart';

class Deck {
  List<Card> cards;

  void shuffle() {
    Random rand = Random();
    int random1 = rand.nextInt(cards.length);
    int random2 = rand.nextInt(cards.length);
    //TODO:
  }

  Card draw() {}

  int get numberOfCards => cards.length;
}
