import 'package:flutter/material.dart';

class SampleList extends StatelessWidget {
  const SampleList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
        children: [
          Expanded(child: ListView.builder(
            itemCount: 20,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text('data'),
                tileColor: (index+1)%4==0?Colors.red.shade400:Colors.white,
              );
            },
          ),)
        ],
        ),
      ),
    );
  }
}