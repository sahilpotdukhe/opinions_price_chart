import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:opinions_chart/Services/FirestoreServices.dart';
import 'package:opinions_chart/bloc/price_bloc.dart';
import 'package:opinions_chart/screens/chart_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PriceBloc(FirestoreServices()),
      child: const MaterialApp(
        title: 'Opinion Price Chart',
        debugShowCheckedModeBanner: false,
        home: ChartScreen(),
      ),
    );
  }
}
