import 'package:opinions_chart/models/price_data.dart';

abstract class PriceState {}

class PriceLoading extends PriceState {}

class PriceInitial extends PriceState {}

class PriceLoaded extends PriceState {
  final List<PriceData> priceHistory;

  PriceLoaded(this.priceHistory);
}

class PriceSuccess extends PriceState {
  final String message;

  PriceSuccess(this.message);
}

class PriceError extends PriceState {
  final String errorMessage;

  PriceError(this.errorMessage);
}
