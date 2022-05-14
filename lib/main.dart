import 'package:cosy_toxicity/api/post_toxic_request.dart';
import 'package:cosy_toxicity/business/state/average_toxic.dart';
import 'package:cosy_toxicity/business/state/average_toxic_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cosy Toxicity',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Уровень токсичности CosySoft'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AverageToxicCubit(),
      child: BlocBuilder<AverageToxicCubit, AverageToxicState>(
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Center(
            child: Column(
              children: [
                Expanded(
                  flex: 6,
                  child: _displayToxicLevel(state.averageLevel),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    _displayToxicText(state.averageLevel),
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                onPressed: () => context.read<AverageToxicCubit>().reloadData(),
                child: const Icon(Icons.replay_outlined),
              ),
              const SizedBox(width: 10),
              FloatingActionButton(
                onPressed: () => postToxicResponse(),
                child: const Icon(Icons.warning),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _displayToxicLevel(int? averageLevel) {
    switch (averageLevel) {
      case 0:
        return Image.asset('assets/images/1.png');
      case 1:
        return Image.asset('assets/images/2.png');
      case 2:
        return Image.asset('assets/images/3.png');
      case 3:
        return Image.asset('assets/images/4.png');
      case 4:
        return Image.asset('assets/images/5.png');
      default:
        return const Center(
          child: CircularProgressIndicator(),
        );
    }
  }

  String _displayToxicText(int? averageLevel) {
    switch (averageLevel) {
      case 0:
        return 'Умеренный уровень токсичности';
      case 1:
        return 'Уровень токсичности #НЕСТАСЯ';
      case 2:
        return 'Уровень токсичности #ПОКАЕЩЁНЕСТАСЯ';
      case 3:
        return 'Уровень токсичности #ПОЧТИСТАСЯ';
      case 4:
        return 'Теперь наш офис - СТАСЯ';
      default:
        return '';
    }
  }
}
