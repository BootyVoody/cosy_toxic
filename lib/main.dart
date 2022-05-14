import 'package:cosy_toxicity/business/state/average_toxic.dart';
import 'package:cosy_toxicity/business/state/average_toxic_state.dart';
import 'package:cosy_toxicity/services/toxicity_level_service.dart';
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
        primarySwatch: Colors.blue,
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
  final ToxicityLevelService _toxicityLevelService =
      const ToxicityLevelService();

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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.access_alarm),
                Text(state.averageLevel.toString()),
              ],
            ),
          ),
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                onPressed: () {
                  _toxicityLevelService.getToxicityLevel();
                },
                child: const Icon(Icons.replay_outlined),
              ),
              const SizedBox(width: 10),
              FloatingActionButton(
                onPressed: () => context.read<AverageToxicCubit>(),
                child: const Icon(Icons.add),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
