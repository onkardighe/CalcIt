import 'package:calcit/constants/AppTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ButtonsContainer extends StatefulWidget {
  final double _height;
  ButtonsContainer({super.key, required double height}) : _height = height;

  @override
  State<ButtonsContainer> createState() => _ButtonsContainerState();
}

class _ButtonsContainerState extends State<ButtonsContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget._height,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NumberButton(buttonData: "7"),
            NumberButton(buttonData: "8"),
            NumberButton(buttonData: "9"),
            NumberButton(buttonData: "AC"),
            NumberButton.withIcon(Icons.backspace),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            NumberButton(buttonData: "4"),
            NumberButton(buttonData: "5"),
            NumberButton(buttonData: "6"),
            NumberButton(buttonData: "x"),
            NumberButton(buttonData: "÷"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            NumberButton(buttonData: "1"),
            NumberButton(buttonData: "2"),
            NumberButton(buttonData: "3"),
            NumberButton(buttonData: "+"),
            NumberButton(buttonData: "-"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NumberButton(buttonData: "0"),
            NumberButton(buttonData: "00"),
            NumberButton(buttonData: "."),
            NumberButton(buttonData: "Ans"),
            NumberButton.withBackground("="),
          ],
        )
      ]),
    );
  }
}


// ignore: must_be_immutable
class NumberButton extends StatefulWidget {
  late final String? _buttonData;
  late final IconData? _iconData;
  late bool roundBackground = false;

  NumberButton.withBackground(String? buttonData, {super.key}) {
    roundBackground = true;
    _buttonData = buttonData;
    _iconData = null;
  }

  NumberButton.withIcon(IconData iconData, {super.key}) {
    _buttonData = null;
    _iconData = iconData;
  }

  NumberButton({super.key, required String? buttonData})
      : _buttonData = buttonData,
        _iconData = null;

  @override
  State<NumberButton> createState() => NumberButtonState();
}

class NumberButtonState extends State<NumberButton> {
  late Color _themeColor =
      appTheme.isDarkTheme ? lightTheme.primaryColor : darkTheme.primaryColor;
  late Color _reverseThemeColor =
      appTheme.isDarkTheme ? darkTheme.primaryColor : lightTheme.primaryColor;

  @override
  void initState() {
    super.initState();
    appTheme.addListener(() {
      if (mounted) {
        setState(() {
          _themeColor = appTheme.isDarkTheme
              ? lightTheme.primaryColor
              : darkTheme.primaryColor;

          _reverseThemeColor = appTheme.isDarkTheme
              ? darkTheme.primaryColor
              : lightTheme.primaryColor;
        });
      }
    });
  }



  


  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(5)),
            backgroundColor: MaterialStateProperty.all<Color?>(
                widget.roundBackground ? _themeColor : null),
            minimumSize: MaterialStateProperty.all<Size>(Size(
                MediaQuery.of(context).size.width * 0.2,
                widget.roundBackground
                    ? MediaQuery.of(context).size.height * 0.1
                    : 130)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(widget.roundBackground ? 90 : 0)))),
        child: widget._buttonData == null
            ? Icon(
                widget._iconData,
                size: 30,
                color: _themeColor,
              )
            : Text(
                widget._buttonData!,
                style: TextStyle(
                    color: widget.roundBackground
                        ? _reverseThemeColor
                        : _themeColor,
                    fontSize: widget._buttonData! == 'Ans' ? 20 : 25),
              ));
  }
}
