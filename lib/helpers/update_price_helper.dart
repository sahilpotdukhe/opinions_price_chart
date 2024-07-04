import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';

class PriceHelper {
  static void updatePriceInFirestore() async {
    try {
      double newPrice = 50 + Random().nextDouble() * 50;
      await FirebaseFirestore.instance.collection('prices').add({
        'price': newPrice,
        'timestamp': DateTime.now(),
      });
    } catch (e) {
      print('Error updating price: $e');
    }
  }
}
