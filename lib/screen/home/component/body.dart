import 'package:covid19/const.dart';
import 'package:covid19/model/case_model.dart';
import 'package:covid19/repository/repository.dart';
import 'package:covid19/screen/home/component/dropdown.dart';
import 'package:covid19/screen/home/widget/count_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
   CaseModel cm;

  void getCase() async {
    var data = await Repository().getCase();
    if (data != null) {
      setState(() {
        cm = data;
      });
    }
  }

  @override
  void initState() {
    getCase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ClipPath(
          clipper: MyClipper(),
          child: Container(
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xff3383cd),
                  Color(0xff11249f),
                ],
              ),
              image: DecorationImage(
                image: AssetImage("assets/images/virus.png"),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 40,
                ),
                Expanded(
                  child: Stack(
                    children: <Widget>[
                      SvgPicture.asset(
                        "assets/icons/Drcorona.svg",
                        width: 230,
                        fit: BoxFit.fitWidth,
                        alignment: Alignment.topCenter,
                      ),
                      Positioned(
                        top: 20,
                        left: 140,
                        child: Text(
                          "Stay\nAt Home",
                          style:
                              kHeadingTextStyle.copyWith(color: Colors.white),
                        ),
                      ),
                      Container()
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        MyDropDown(),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(text: "Case Update\n", style: kTitleTextstyle),
                        TextSpan(
                          text: "Newest Update",
                          style: TextStyle(
                            color: kTextLightColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Text(
                    "See detail",
                    style: TextStyle(
                        color: kPrimaryColor, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 4),
                      blurRadius: 30,
                      color: kShadowColor,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    count(
                      cm.positif,
                      kInfectedColor,
                      "Positif",
                    ),
                    count(
                      cm.sembuh,
                      kRecovercolor,
                      "Sembuh",
                    ),
                    count(
                      cm.meninggal,
                      kDeathColor,
                      "Meninggal",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
