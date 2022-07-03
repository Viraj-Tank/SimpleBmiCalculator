import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_bmi_calculator/constants/app_constants.dart';
import 'package:simple_bmi_calculator/widgets/side_bar.dart';

class Home extends StatefulWidget {
  String title;

  Home({Key? key, required this.title}) : super(key: key);

  @override
  State<Home> createState() => _HomeState(title);
}

class _HomeState extends State<Home> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  String _heightWidthEmpty = "";
  double _bmi = 0;
  String _result = "";
  String title;

  _HomeState(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainHexColor,
      appBar: AppBar(
        backgroundColor: mainHexColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          title,
          style: TextStyle(color: accentHexColor, fontWeight: FontWeight.w300,fontSize: 28),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: EdgeInsets.only(left: 10, top: 0, right: 10, bottom: 0),
                width: MediaQuery.of(context).size.width / 2,
                child: TextField(
                  controller: _heightController,
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.w300,
                    color: accentHexColor,
                  ),
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: "Height",
                      hintStyle: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w300,
                        color: Colors.white.withOpacity(0.5),
                      )),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10, top: 0, right: 10, bottom: 0),
                width: MediaQuery.of(context).size.width / 2,
                child: TextField(
                  controller: _weightController,
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.w300,
                    color: accentHexColor,
                  ),
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: "Weight",
                      hintStyle: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w300,
                        color: Colors.white.withOpacity(0.5),
                      )),
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              if (_heightController.text.isEmpty && _weightController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(mySnackBar("Please Enter Height & Weight"));
                return;
              } else if (_heightController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(mySnackBar("Please Enter Height"));
                return;
              } else if (_weightController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(mySnackBar("Please Enter Weight"));
                return;
              }
              double _h = double.parse(_heightController.text);
              double _w = double.parse(_weightController.text);
              setState(() {
                _bmi = _w / (_h * _h);
                if (_bmi > 25) {
                  _result = "Start Fasting Brother.";
                } else if (_bmi >= 18.5 && _bmi <= 25) {
                  _result = "Mah man!";
                } else {
                  _result = "Eat Somethin Kid!";
                }
              });
            },
            child: Container(
              child: Text(
                "Calculate",
                style: TextStyle(
                  color: mainHexColor,
                  fontSize: 20,
                ),
              ),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(color: accentHexColor, borderRadius: BorderRadius.all(Radius.circular(8))),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            _bmi.toStringAsFixed(2),
            style: TextStyle(color: accentHexColor, fontSize: 42),
          ),
          SizedBox(
            height: 10,
          ),
          Visibility(
            visible: _result.isNotEmpty,
            child: Text(
              _result,
              style: TextStyle(color: accentHexColor, fontSize: 32),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          SideBar(
            barHeight: 25,
            barWidth: 20,
            align: MainAxisAlignment.end,
            topLeft: 25,
            topRight: 0,
            bottomLeft: 25,
            bottomRight: 0,
          ),
          SizedBox(
            height: 30,
          ),
          SideBar(
            barHeight: 25,
            barWidth: 60,
            align: MainAxisAlignment.end,
            topLeft: 25,
            topRight: 0,
            bottomLeft: 25,
            bottomRight: 0,
          ),
          SizedBox(
            height: 30,
          ),
          SideBar(
            barHeight: 25,
            barWidth: 40,
            align: MainAxisAlignment.end,
            topLeft: 25,
            topRight: 0,
            bottomLeft: 25,
            bottomRight: 0,
          ),
          SizedBox(
            height: 30,
          ),
          SideBar(
            barHeight: 25,
            barWidth: 50,
            align: MainAxisAlignment.start,
            topLeft: 0,
            topRight: 25,
            bottomLeft: 0,
            bottomRight: 25,
          ),
          SizedBox(
            height: 60,
          ),
          SideBar(
            barHeight: 25,
            barWidth: 30,
            align: MainAxisAlignment.start,
            topLeft: 0,
            topRight: 25,
            bottomLeft: 0,
            bottomRight: 25,
          )
        ]),
      ),
    );
  }

  SnackBar mySnackBar(String error) {
    return SnackBar(
      content: Text(
        error,
        style: TextStyle(color: mainHexColor),
      ),
      dismissDirection: DismissDirection.up,
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: 2),
      backgroundColor: accentHexColor,
      clipBehavior: Clip.antiAlias,
    );
  }
}
