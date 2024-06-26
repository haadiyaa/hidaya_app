import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hidhayah/bloc/tasbihbloc/tasbih_bloc.dart';
import 'package:hidhayah/utils/constants/constants.dart';
import 'package:hidhayah/utils/styles/textstyle.dart';
import 'package:hidhayah/view/tasbihpage.dart/widgets/customtasbihbutton.dart';

class TasbihPageWrapper extends StatelessWidget {
  const TasbihPageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TasbihBloc(),
      child: TasbihPage(),
    );
  }
}

class TasbihPage extends StatefulWidget {
  const TasbihPage({super.key});

  @override
  State<TasbihPage> createState() => _TasbihPageState();
}

class _TasbihPageState extends State<TasbihPage> {
  String initialValue = '33';
  String value = '0';
  String loop = '0';

  final List<DropdownMenuItem<dynamic>> _items = [
    DropdownMenuItem(
      child: Text('33'),
      value: '33',
    ),
    DropdownMenuItem(
      child: Text('66'),
      value: '66',
    ),
    DropdownMenuItem(
      child: Text('99'),
      value: '99',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double height = size.width * 0.85;
    double width = size.width * 0.85;
    return Scaffold(
      backgroundColor: Constants.greenDark,
      appBar: AppBar(
        title: const Text('Tasbih'),
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: BlocBuilder<TasbihBloc, TasbihState>(
          builder: (context, state) {
            if (state is TapState) {
              width = state.width;
              height = state.height;
            }
            if (state is IncrementState) {
              value = state.value.toString();
              loop = state.loop.toString();
            }
            if (state is DropdownChangeState) {
              initialValue=state.value.toString();
            }
            if (state is ResetState) {
              loop=state.loop.toString();
              value=state.value.toString();
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DropdownButton(
                      elevation: 10,
                      borderRadius: BorderRadius.circular(20),
                      dropdownColor: Constants.greenLight,
                      value: initialValue,
                      items: _items,
                      onChanged: (value) {
                        context.read<TasbihBloc>().add(DropdownChangedEvent(value: int.parse(value.toString())));
                        
                      },
                    ),
                    Text('Loop $loop'),
                    CustomTasbihButton(
                      onPressed: () {
                        context.read<TasbihBloc>().add(ResetEvent());
                      },
                      text: 'Reset',
                    ),
                  ],
                ),
                Constants.height20,
                GestureDetector(
                  onTap: () {
                    context.read<TasbihBloc>().add(TapEvent(ctx: context));
                    context.read<TasbihBloc>().add(
                        IncreaseCounterEvent(value: int.parse(initialValue)));
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.ease,
                    width: width,
                    height: height,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Constants.transparent,
                      border: Border.all(color: Constants.greenLight),
                    ),
                    child: Center(
                      child: Text(
                        value,
                        style: TextStyles.tasbihCounterStyle,
                      ),
                    ),
                  ),
                ),
                Constants.height20,
              ],
            );
          },
        ),
      ),
    );
  }
}
