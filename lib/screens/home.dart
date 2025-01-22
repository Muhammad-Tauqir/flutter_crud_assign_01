import 'package:crud/screens/create.dart';
import 'package:crud/screens/show.dart';
import 'package:flutter/material.dart';
import 'package:crud/helpers/helper.dart';

class Shome extends StatefulWidget {
  const Shome({super.key});

  @override
  State<Shome> createState() => _ShomeState();
}

class _ShomeState extends State<Shome> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            title: Center(
                child: Text(
              "Todo",
              style:
                  TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
            )),
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: bgColor(),
              ),
            )),
        body: Container(
          decoration: BoxDecoration(
            gradient: bgColor(),
          ),
          child:
            GridView.count(
              crossAxisCount: 2,
              children: [
                Flexible(
                    child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Screate()));
                  },
                  child: customCard('Create'),
                )),
                Flexible(
                    child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Sshow()));
                    },
                  child: customCard('All'),
                )),
                customCard('Pending'),
                customCard('Complete'),
              ],
            ),
        ),
      ),
    );
  }
}

Widget customCard(String inp) {
  return Flexible(
      child: Card(
    color: Colors.transparent,
    child: Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 30),
        child: Text(
          inp,
          style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
        ),
      ),
    ),
  ));
}
