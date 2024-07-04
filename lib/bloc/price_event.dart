import 'package:opinions_chart/models/price_data.dart';

abstract class PriceEvent {}

class StartGeneratingPrices extends PriceEvent {}

class AddPrice extends PriceEvent {
  final PriceData priceData;

  AddPrice(this.priceData);
}
class UpdatePrices extends PriceEvent {
  final List<PriceData> priceHistory;

  UpdatePrices(this.priceHistory);
}

