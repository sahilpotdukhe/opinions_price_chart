import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:opinions_chart/bloc/price_bloc.dart';
import 'package:opinions_chart/bloc/price_event.dart';
import 'package:opinions_chart/bloc/price_state.dart';
import 'package:opinions_chart/helpers/chart_helpers.dart';
import 'package:opinions_chart/helpers/update_price_helper.dart';
import 'package:opinions_chart/models/price_data.dart';

class ChartScreen extends StatefulWidget {
  const ChartScreen({super.key});

  @override
  State<ChartScreen> createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  List<PriceData> _priceHistory = [];

  Timer? timer;
  bool _isTimerRunning = false;

  @override
  void initState() {
    super.initState();
    context.read<PriceBloc>().add(StartGeneratingPrices());
    if (!_isTimerRunning) {
      _startTimer();
    }
  }

  void _startTimer() {
    timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      PriceHelper.updatePriceInFirestore();
    });
    setState(() {
      _isTimerRunning = true;
    });
  }

  void _stopTimer() {
    timer?.cancel();
    setState(() {
      _isTimerRunning = false;
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Opinions Price Chart',style: TextStyle(color: Colors.white),),
        backgroundColor: const Color(0XFF3957ED),
      ),
      body: BlocBuilder<PriceBloc, PriceState>(
        builder: (context, state) {
          if (state is PriceInitial || state is PriceLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PriceLoaded) {
            _priceHistory = state.priceHistory;
            return ChartHelper.buildChart(context, _priceHistory);
          } else if (state is PriceError) {
            return const Center(child: Text('Error fetching data.'));
          } else {
            return const Center(child: Text('Unknown state.'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _isTimerRunning ? _stopTimer : _startTimer,
        tooltip: _isTimerRunning ? 'Stop Timer' : 'Start Timer',
        backgroundColor: const Color(0XFF3957ED),
        child: Icon(_isTimerRunning ? Icons.pause : Icons.play_arrow, color: Colors.white),
      ),
    );
  }
}
