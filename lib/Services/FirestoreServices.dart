import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:opinions_chart/models/price_data.dart';

class FirestoreServices {
  final CollectionReference _pricesCollection = FirebaseFirestore.instance.collection('prices');

  Stream<List<PriceData>> getPriceDataStream() {
    return _pricesCollection.orderBy('timestamp',descending: false).snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => PriceData.fromMap(doc.data() as Map<String, dynamic>)).toList();
    });
  }

  Future<void> addPrices(PriceData priceData) {
    return _pricesCollection.add(priceData.toMap());
  }
}
