import 'package:cloud_firestore/cloud_firestore.dart';

class PriceData {
  final DateTime time;
  final double price;

  PriceData({required this.time, required this.price});

  factory PriceData.fromMap(Map<String, dynamic> data) {
    final timestamp = data['timestamp'] as Timestamp;
    return PriceData(
      time: timestamp.toDate(),
      price: data['price']?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'timestamp': time,
      'price': price,
    };
  }
}
