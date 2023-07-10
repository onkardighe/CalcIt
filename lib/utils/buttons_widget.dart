import 'package:calcit/constants/AppTheme.dart';
import 'package:calcit/models/displayText.dart';
import 'package:calcit/utils/color_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ButtonsContainer extends StatefulWidget {
  final double _height;
  ButtonsContainer({super.key, required double height}) : _height = height;

  @override
  State<ButtonsContainer> createState() => _ButtonsContainerState();
}

class _ButtonsContainerState extends State<ButtonsContainer> {
  List<Widget> buttonList = [
    SizedBox(
      height: 15,
    ),
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
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        NumberButton(buttonData: "4"),
        NumberButton(buttonData: "5"),
        NumberButton(buttonData: "6"),
        NumberButton(buttonData: "x"),
        NumberButton(buttonData: "÷"),
      ],
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        NumberButton(buttonData: "1"),
        NumberButton(buttonData: "2"),
        NumberButton(buttonData: "3"),
        NumberButton(buttonData: "+"),
        NumberButton(buttonData: "-"),
      ],
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        NumberButton(buttonData: "0"),
        NumberButton(buttonData: "00"),
        NumberButton(buttonData: "."),
        NumberButton(buttonData: "Ans"),
        NumberButton.withBackground("="),
      ],
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        height: widget._height,
        child: SingleChildScrollView(
          child: Column(
            children: buttonList,
          ),
        ));
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
  double _sizeMultiplier = 50;
  double bevel = 2.0;
  Offset blurOffset = Offset(2.5, 2.5);
  late final Color _themeColor = Theme.of(context).primaryColor;



  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.background;
    return Container(
      height: _sizeMultiplier,
      width: _sizeMultiplier,
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(90),
          color: Theme.of(context).colorScheme.background,
          boxShadow: [
            BoxShadow(
              blurRadius: bevel,
              offset: -blurOffset,
              color: color.mix(Colors.white, .6)!,
            ),
            BoxShadow(
              blurRadius: bevel,
              offset: blurOffset,
              color: color.mix(Colors.black, .3)!,
            )
          ]),
      child: TextButton(
          onPressed: () {
            if (widget._buttonData == null) {
              // BACKSPACE
              if (widget._iconData == Icons.backspace) {
                context.read<DisplayText>().backspaceQuery();
              }
              return;
            }

            // Calculate
            if (widget._buttonData == "=") {
              context.read<DisplayText>().calculateQuery();
              return;
            }

            // ALL CLEAR
            if (widget._buttonData == "AC") {
              context.read<DisplayText>().clearQuery();
              return;
            }

            // deal with ans
            if (widget._buttonData == "Ans") {
              context.read<DisplayText>().copyAnswerToQuery();
              return;
            }

            // Edit Query
            context.read<DisplayText>().appendQuery(widget._buttonData!);
          },
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color?>(Colors.transparent),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(90)))),
          child: widget._buttonData == null
              ? Icon(
                  widget._iconData,
                  size: 25,
                  color: _themeColor,
                )
              : Text(
                  widget._buttonData!,
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: widget._buttonData!.length > 1 ? 20 : 25),
                )),
    );
  }
}
