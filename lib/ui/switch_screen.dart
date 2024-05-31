import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practise/bloc/switch/switch_bloc.dart';
import 'package:flutter_bloc_practise/bloc/switch/switch_event.dart';
import 'package:flutter_bloc_practise/bloc/switch/switch_state.dart';

class SwitchScreen extends StatefulWidget {
  const SwitchScreen({super.key});

  @override
  _SwitchScreenState createState() => _SwitchScreenState();
}

class _SwitchScreenState extends State<SwitchScreen> {
  final bool _isSwitched = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Switch Example"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Notifications'),
                    BlocBuilder<SwitchBloc, SwitchState>(
                        buildWhen: (previous, current) =>
                            previous.isSwitch != current.isSwitch,
                        builder: (context, state) {
                        
                          return Switch(
                            value: state.isSwitch,
                            onChanged: (bool value) {
                              context
                                  .read<SwitchBloc>()
                                  .add(EnableAndDisableNotification());

                              if (kDebugMode) {
                                print(value);
                              }
                              // setState(() {
                              //   _isSwitched = value;
                              // });
                            },
                          );
                        }),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                BlocBuilder<SwitchBloc, SwitchState>(
                    buildWhen: (previous, current) =>
                        previous.isSlide != current.isSlide,
                    builder: (context, state) {
                     
                      return Container(
                        height: 200,
                        color: Colors.red.withOpacity(state.isSlide),
                      );
                    }),
                const SizedBox(
                  height: 50,
                ),
                BlocBuilder<SwitchBloc, SwitchState>(
                   buildWhen: (previous, current) =>
                        previous.isSlide != current.isSlide,
                  builder: (context, state) {
                  
                  return Slider(
                      value: state.isSlide,
                      onChanged: (value) {
                        context
                            .read<SwitchBloc>()
                            .add(SliderEvent(value: value));
                      });
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
