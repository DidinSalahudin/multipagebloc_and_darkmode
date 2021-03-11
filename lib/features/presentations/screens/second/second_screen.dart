import 'package:example_multibloc/features/applications/counter/counter_bloc.dart';
import 'package:example_multibloc/features/presentations/router/router_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CounterBloc, CounterState>(
      listener: (context, state) {
        print(state.value);
      },
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Second Screen'),
                SizedBox(
                  height: 20,
                ),
                Text(
                  state.value.toString(),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<CounterBloc>(context).add(
                          CounterEvent.increament(),
                        );
                      },
                      child: Text('Tambah'),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<CounterBloc>(context).add(
                          CounterEvent.decrement(),
                        );
                      },
                      child: Text('Kurang'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      RouteGenerator.routeThird,
                    );
                  },
                  child: Text('Pindah halaman'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
