import 'package:flutter/material.dart';
import 'package:hidhayah/utils/constants/constants.dart';

class DuapageWrapper extends StatelessWidget {
  const DuapageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return const Duapage();
  }
}

class Duapage extends StatelessWidget {
  const Duapage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Constants.greenDark2,
      appBar: AppBar(
        title: Text('Duas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              height: size.height,
              width: size.width,
              child: ListView.separated(
                itemCount: 5,
                separatorBuilder: (BuildContext context, int index) {
                  return Constants.height10;
                },
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: size.width * 0.9,
                    padding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Constants.lightgreengrey,
                    ),
                    child: Text('All Duas'),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
