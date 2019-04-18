import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {

  final Widget childView;

  CustomCard({@required this.childView});

  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        child: Container(padding: const EdgeInsets.all(25.0), child: widget.childView),
      ),
    );
  }
}
