import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practise/bloc/image_picker/image_picker_bloc.dart';
import 'package:flutter_bloc_practise/bloc/image_picker/image_picker_state.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image picker'),
      ),
      body: BlocBuilder<ImagePickerBloc, ImagePickerState>(
        builder: (context, state) {
          if (state.file == null) {
            return InkWell(
                onTap: () {}, child: const Center(child: Icon(Icons.camera)));
          } else {
            return Image.file(File(state.file!.path.toString()));
          }
        },
      ),
    );
  }
}
