import 'package:connectivity_check/core/cubit/connectivity_check_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ConnectivityCheckCubit, ConnectivityCheckState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Connectivity Check'),
            backgroundColor: Colors.teal,
          ),
          body: state is ConnectivityCheckLoading
              ? const Center(child: CircularProgressIndicator())
              : Center(
                  child: Text(
                    state is ConnectedState ? state.msg : 'Not Connected',
                    style: const TextStyle(fontSize: 24),
                  ),
                ),
        );
      },
    );
  }
}
