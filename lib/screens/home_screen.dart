import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'dart:async';
import 'roll_dice.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _nowColumnNum = 1;
  int _nowRowNum = 1;
  int _nowMinNum = 1;
  int _nowDiceSidedNum = 6;

  NumberPicker _columnNum;
  NumberPicker _rowNum;
  NumberPicker _minNum;
  NumberPicker _diceSidedNum;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                border: TableBorder.all(color: Colors.white12, width: 3.0),
                children: [
                  TableRow(
                    children: [
                      Center(child: Text("ヨコのサイコロ数は？\n$_nowRowNum個")),
                      _rowNum = new NumberPicker.integer(
                        initialValue: _nowRowNum,
                        minValue: 1,
                        maxValue: 10,
                        onChanged: (value) =>
                            setState(() => _nowRowNum = value),
                      ),
                    ],
                  ),
                  TableRow(
                    children: <Widget>[
                      Center(child: Text("タテのサイコロ数は？\n$_nowColumnNum個")),
                      _columnNum = new NumberPicker.integer(
                        initialValue: _nowColumnNum,
                        minValue: 1,
                        maxValue: 10,
                        onChanged: (value) =>
                            setState(() => _nowColumnNum = value),
                      ),
                    ],
                  ),
                  TableRow(
                    children: <Widget>[
                      Center(child: Text("出る目の最小値は？\n最小: $_nowMinNum")),
                      _minNum = new NumberPicker.integer(
                          initialValue: _nowMinNum,
                          minValue: 1,
                          maxValue: 100,
                          onChanged: (value) =>
                              setState(() => _nowMinNum = value)),
                    ],
                  ),
                  TableRow(
                    children: <Widget>[
                      Center(child: Text('何面のサイコロ？\n面$_nowDiceSidedNum')),
                      _diceSidedNum = new NumberPicker.integer(
                          initialValue: _nowDiceSidedNum,
                          minValue: 1,
                          maxValue: 10,
                          onChanged: (value) =>
                              setState(() => _nowDiceSidedNum = value)),
                    ],
                  )
                ],
              ),
              RaisedButton(
                child: Text("サイコロを降る"),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RollDice(
                        nowColumnNum: this._nowColumnNum,
                        nowRowNum: this._nowRowNum,
                        nowMinNum :this._nowMinNum,
                        nowDiceSidedNum: this._nowDiceSidedNum,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
