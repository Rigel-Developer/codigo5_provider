import 'package:codigo5_provider/providers/api_provider.dart';
import 'package:codigo5_provider/providers/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    CounterProvider counterProvider =
        Provider.of<CounterProvider>(context, listen: false);

    ApiProvider apiProvider = Provider.of<ApiProvider>(context, listen: true);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Detail Page'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Hola Mundo ${counterProvider.counter}'),
              ElevatedButton(
                onPressed: () {
                  // counterProvider.increment();
                  // counterProvider.addToList('Hola');
                  apiProvider.getCharacter();
                },
                child: const Text('Incrementar'),
              ),
            ],
          ),
        ));
  }
}
