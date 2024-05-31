import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practise/bloc/counter/counter_bloc.dart';
import 'package:flutter_bloc_practise/bloc/switch/switch_bloc.dart';
import 'package:flutter_bloc_practise/ui/image_picker_screen.dart';
// import 'package:flutter_bloc_practise/ui/counter_screen.dart';
import 'package:flutter_bloc_practise/ui/switch_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CounterBloc()),
        BlocProvider(create: (_) => SwitchBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        // home: const SwitchScreen(),
        home: const ImagePickerScreen(),
      ),
    );
  }
}
