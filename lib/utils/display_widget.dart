import 'package:calcit/constants/AppTheme.dart';
import 'package:calcit/models/displayText.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DisplayWidget extends StatefulWidget {
  const DisplayWidget({super.key});

  @override
  State<DisplayWidget> createState() => _DisplayWidgetState();
}

class _DisplayWidgetState extends State<DisplayWidget> {
  @override
  void initState() {
    super.initState();
    appTheme.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      height: MediaQuery.of(context).size.height * 0.9,
      width: MediaQuery.of(context).size.width,
      color: Colors.transparent,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.1),
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(context.watch<DisplayText>().answerText,
                      style: TextStyle(
                          color: appTheme.theme.primaryColor,
                          fontSize: 50,
                          fontWeight: FontWeight.w600)),
                  Text(
                    context.watch<DisplayText>().queryText,
                    style: TextStyle(
                      color: appTheme.isLightTheme
                          ? appTheme.theme.primaryColorDark
                          : appTheme.theme.primaryColorLight,
                      fontSize: 25,
                    ),
                  ),
                ]),
          )
        ],
      ),
    );
  }
}
