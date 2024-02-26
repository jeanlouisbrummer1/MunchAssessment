import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:munch_flutter_assessment/bloc/index.dart';
import 'package:munch_flutter_assessment/screens/index.dart';
import 'package:munch_flutter_assessment/styles/index.dart';

void main() {
  runApp(const Munch());
}

class Munch extends StatelessWidget {
  const Munch({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(
          create: (BuildContext context) => UserBloc(),
        ),
        BlocProvider<PinBloc>(
          create: (BuildContext context) => PinBloc(),
        ),
      ],
      child: MaterialApp(
        theme: munchTheme,
        home: const LoginScreen(),
        routes: {
          '/login': (context) => const LoginScreen(),
          '/userList': (context) => const UserListScreen(),
        },
      ),
    );
  }
}

