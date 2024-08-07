
import 'package:flutter/material.dart';

class spPage extends StatelessWidget {
  const spPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
           GestureDetector(
             onDoubleTap: () {
               Navigator.of(context).pushNamed('/home');
             },
             child: Padding(
               padding: const EdgeInsets.all(8.0),
               child: Container(
                 height: 860,
                 width: 500,
                 decoration: BoxDecoration(
                   color: Colors.pink,
                   image: DecorationImage(
                     fit: BoxFit.cover,
                     image: AssetImage(
                       'assets/images/sp.jpg'
                     )
                   )
                 ),
               ),
             ),
           )
          ],
        ),
      ),
    );
  }
}
