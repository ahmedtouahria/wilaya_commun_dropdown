import 'package:flutter/material.dart';
import 'package:tbr3_flutter/views/daira.dart';
import 'package:tbr3_flutter/views/dropdown_wilaya_commun.dart';
import 'package:tbr3_flutter/views/my_custom_input.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   // var scrWidth = MediaQuery.of(context).size.width;
   // var scrHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      drawer: const Drawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(child: WilayaCommun()),
          ],
        ),
      ), 
    );
  }
}
