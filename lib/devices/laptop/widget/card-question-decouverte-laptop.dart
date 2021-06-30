import 'package:flutter/material.dart';

class CardQuestionDecouverteLaptop extends StatefulWidget {
  final IconData iconData;
  final String titre;
  final bool select;

  const CardQuestionDecouverteLaptop(
      {Key? key,
      required this.iconData,
      required this.titre,
      this.select = false})
      : super(key: key);
  @override
  _CardQuestionDecouverteLaptopState createState() =>
      _CardQuestionDecouverteLaptopState();
}

class _CardQuestionDecouverteLaptopState
    extends State<CardQuestionDecouverteLaptop> {
  late Size size;
  bool isSelected = false;

  @override
  void initState() {
    setState(() {
      isSelected = widget.select;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .2,
      width: size.width * .2,
      child: Column(
        children: [
          SizedBox(
            height: size.height * .05,
          ),
          Container(
            height: size.height * .05,
            width: size.width * .05,
            // color: colorPrimaire,
            child: Icon(
              widget.iconData,
              size: 50,
              color: Color.fromRGBO(88, 139, 139, 1),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            height: size.height * .05,
            width: size.width * .15,
            // color: colorPrimaire,
            child: Center(
              child: Text(
                widget.titre,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: isSelected
                        ? Colors.white
                        : Color.fromRGBO(20, 33, 61, 1)),
              ),
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: isSelected ? Color.fromRGBO(20, 33, 61, 1) : Colors.transparent,
      ),
    );
  }
}
