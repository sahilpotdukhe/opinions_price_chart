import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:opinions_chart/Services/FirestoreServices.dart';
import 'package:opinions_chart/bloc/price_event.dart';
import 'package:opinions_chart/bloc/price_state.dart';
import 'package:opinions_chart/models/price_data.dart';

class PriceBloc extends Bloc<PriceEvent, PriceState> {
  final FirestoreServices _firestoreServices;
  StreamSubscription<List<PriceData>>? _priceSubscription;

  PriceBloc(this._firestoreServices) : super(PriceInitial()) {
    on<StartGeneratingPrices>((event, emit) {
      _priceSubscription?.cancel();
      _priceSubscription = _firestoreServices.getPriceDataStream().listen(
        (prices) {
          add(UpdatePrices(prices));
        },
        onError: (error) {
          emit(PriceError('Failed to load prices'));
        },
      );
    });

    on<UpdatePrices>((event, emit) {
      emit(PriceLoaded(event.priceHistory));
    });

    on<AddPrice>((event, emit) async {
      try {
        emit(PriceLoading());
        await _firestoreServices.addPrices(event.priceData);
        emit(PriceSuccess('Price added successfully'));
      } catch (e) {
        emit(PriceError('Failed to add Price data'));
      }
    });
  }

  @override
  Future<void> close() {
    _priceSubscription?.cancel();
    return super.close();
  }
}
