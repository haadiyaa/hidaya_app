import 'package:flutter/material.dart';
import 'package:hidhayah/utils/constants/constants.dart';

class ReadQuranWrapper extends StatelessWidget {
  const ReadQuranWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return ReadQuranPage();
  }
}
class ReadQuranPage extends StatelessWidget {
  const ReadQuranPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.greenDark2,
      appBar: AppBar(title: Text('Quran'),),
    );
  }
}