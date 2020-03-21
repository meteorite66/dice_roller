import 'dart:math';
import 'package:flutter/material.dart';

class RollDice extends StatefulWidget {
  final int nowColumnNum;
  final int nowRowNum;
  final int nowMinNum;
  final int nowDiceSidedNum;

  //RollDice({this.nowRowNum,this.nowColumnNum,this.nowMinNum,this.nowDiceSidedNum}){
  //};
  RollDice({Key key,
    this.nowRowNum,
    this.nowColumnNum,
    this.nowMinNum,
    this.nowDiceSidedNum})
      : super(key: key);

  @override
  _RollDiceState createState() => _RollDiceState();
}

class _RollDiceState extends State<RollDice> {
  int nowColumnNum;
  int nowRowNum;
  int nowMinNum;
  int nowDiceSidedNum;

  List<Widget> dicesColumn = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    nowColumnNum = widget.nowColumnNum;
    nowRowNum = widget.nowRowNum;
    nowMinNum = widget.nowMinNum;
    nowDiceSidedNum = widget.nowDiceSidedNum;

    for (int i = 0; i < nowColumnNum; i++) {
      dicesColumn.add(diceRow());
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    for (var row in dicesColumn) row,
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom:20.0),
                child: RaisedButton(
                  child: Text("もどる"),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    setState(() {});
  }

  Widget diceRow() {
    List<Widget> diceRowList = [];

    for (int i = 0; i < nowRowNum; i++) {
      diceRowList.add(dice());
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: diceRowList,
    );
  }

  Widget dice() {
    int diceValue = 0;
    diceValue = Random().nextInt(nowDiceSidedNum) + nowMinNum;

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        width: 25,
        height: 25,
        color: Colors.white,
        child: Center(
            child: Text(
              "$diceValue",
              style: TextStyle(color: Colors.black, fontSize: 22),
            )),
      ),
    );
  }
}
