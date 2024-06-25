import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hidhayah/bloc/tasbihbloc/tasbih_bloc.dart';
import 'package:hidhayah/utils/constants/constants.dart';
import 'package:hidhayah/utils/styles/textstyle.dart';
import 'package:hidhayah/view/tasbihpage/widgets/customtasbihbutton.dart';

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
        child: Column(
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
                    setState(() {
                      initialValue = value;
                    });
                  },
                ),
                const Text('Loop 0'),
                CustomTasbihButton(
                  onPressed: () {},
                  text: 'Reset',
                ),
              ],
            ),
            Constants.height20,
            BlocBuilder<TasbihBloc, TasbihState>(
              buildWhen: (previous, current) {
                return previous != current;
              },
              builder: (context, state) {
                if (state is TapState) {
                  width = state.width;
                  height = state.height;
                }
                return GestureDetector(
                  onTap: () {
                    context.read<TasbihBloc>().add(TapEvent(ctx: context));
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
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
                        '0',
                        style: TextStyles.tasbihCounterStyle,
                      ),
                    ),
                  ),
                );
              },
            ),
            Constants.height20,
          ],
        ),
      ),
    );
  }
}
