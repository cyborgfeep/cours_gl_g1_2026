import 'package:flutter/material.dart';

class Options {
  String title;
  IconData icon;
  Color color;

  Options({required this.title, required this.icon, required this.color});

  static List<Options> optionList = [
    Options(title: 'Transfert', icon: Icons.person, color: Colors.deepPurple),
    Options(
      title: 'Paiement',
      icon: Icons.shopping_cart,
      color: Colors.orangeAccent,
    ),
    Options(
      title: 'Crédit',
      icon: Icons.phone_android_outlined,
      color: Colors.blue,
    ),
    Options(
      title: 'Banque',
      icon: Icons.account_balance_outlined,
      color: Colors.red,
    ),
    Options(
      title: 'Carte',
      icon: Icons.credit_card,
      color: Colors.purpleAccent,
    ),
    Options(title: 'Cadeaux', icon: Icons.card_giftcard, color: Colors.green),
    Options(title: 'Coffre', icon: Icons.punch_clock, color: Colors.pink),
    Options(
      title: 'Transport',
      icon: Icons.bus_alert,
      color: Colors.deepOrangeAccent,
    ),
  ];
}
