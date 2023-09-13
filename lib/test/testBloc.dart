import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_test/test/bloc/get_data_bloc.dart';

class TestBloc extends StatefulWidget {
  const TestBloc({super.key});

  @override
  State<TestBloc> createState() => _TestBlocState();
}

class _TestBlocState extends State<TestBloc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GetDataBloc, GetDataState>(
        builder: (context, state) {
          print(state);
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: InkWell(
                      onTap: () =>
                          context.read<GetDataBloc>().add(ClickhelloEvent()),
                      child: Text("Hello get bloc"))),
              InkWell(
                  onTap: () => context.read<GetDataBloc>().add(TowEvent()),
                  child: Text("two get bloc"))
            ],
          );
        },
      ),
    );
  }
}
