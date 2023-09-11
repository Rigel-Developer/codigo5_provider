import 'package:codigo5_provider/pages/detail_page.dart';
import 'package:codigo5_provider/providers/api_provider.dart';
import 'package:codigo5_provider/providers/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int counter = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ApiProvider>(context, listen: false).getCharacter();
    });
  }

  @override
  Widget build(BuildContext context) {
    CounterProvider counterProvider =
        Provider.of<CounterProvider>(context, listen: false);
    counter = counterProvider.counter;

    ApiProvider apiProvider = Provider.of<ApiProvider>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const DetailPage();
                  },
                ),
              );
            },
            icon: const Icon(Icons.chevron_right),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // counterProvider.increment();
          apiProvider.getCharacter();
        },
        child: const Icon(Icons.add),
      ),
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Text('Hola Mundo $counter'),
      //       Consumer(
      //         builder: (context, CounterProvider counterProvider, child) {
      //           return Text('Hola Mundo ${counterProvider.counter}');
      //         },
      //       ),
      //       ...counterProvider.list.map((e) => Text(e)).toList(),
      //     ],
      //   ),
      // ),

      body: Consumer<ApiProvider>(
        builder: (context, ApiProvider apiProvider, child) {
          return ListView.builder(
            itemCount: apiProvider.list?.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(apiProvider.list?[index].name ?? ''),
                subtitle: Text(apiProvider.list?[index].status ?? ''),
                leading: Image.network(apiProvider.list?[index].image ?? ''),
              );
            },
          );
        },
      ),
    );
  }
}
