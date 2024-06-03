import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practise/bloc/counter/counter_bloc.dart';
import 'package:flutter_bloc_practise/bloc/favourite_app/favourite_bloc.dart';
import 'package:flutter_bloc_practise/bloc/image_picker/image_picker_bloc.dart';
import 'package:flutter_bloc_practise/bloc/switch/switch_bloc.dart';
import 'package:flutter_bloc_practise/bloc/todo/todo_bloc.dart';
import 'package:flutter_bloc_practise/ui/Image_picker/image_picker_screen.dart';
import 'package:flutter_bloc_practise/ui/favorite_app/favourite_app_screen.dart';
// import 'package:flutter_bloc_practise/ui/counter_screen.dart';
import 'package:flutter_bloc_practise/ui/switch_example/switch_screen.dart';
import 'package:flutter_bloc_practise/ui/todo/todo_screen.dart';
import 'package:flutter_bloc_practise/utils/image_picker_utils.dart';
import 'repository/favourite_repository.dart';

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
        BlocProvider(
            create: (_) =>
                ImagePickerBloc(imagePickerUtils: ImagePickerUtils())),
        BlocProvider(create: (_) => TodoBloc()),
        BlocProvider(create: (_) => FavouriteBloc(FavouriteRepository()))
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        // home: const SwitchScreen(),
        // home: const ImagePickerScreen(),
        // home: const TodoScreen(),
        home: const FavouriteAppScreen(),
      ),
    );
  }
}
