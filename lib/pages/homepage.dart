import 'package:calcit/utils/display_widget.dart';
import 'package:flutter/material.dart';

import '../constants/AppTheme.dart';
import '../utils/buttons_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () => appTheme.toggleTheme(),
              child: Icon(
                appTheme.isLightTheme ? Icons.mode_night_sharp : Icons.sunny,
                size: 30,
                color: appTheme.isLightTheme
                    ? Theme.of(context).primaryColorDark
                    : Theme.of(context).primaryColorLight,
              ),
            ),
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: appTheme.isLightTheme
            ? Theme.of(context).primaryColorLight
            : Theme.of(context).primaryColorDark,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            DisplayWidget(),
          ],
        ),
      ),
      bottomSheet: ButtonBottomSheet(
        height: MediaQuery.of(context).size.height * .65,
      ),
    );
  }
}

class ButtonBottomSheet extends StatefulWidget {
  final double _height;

  ButtonBottomSheet({super.key, required double height}) : _height = height;

  @override
  State<ButtonBottomSheet> createState() => _ButtonBottomSheetState();
}

class _ButtonBottomSheetState extends State<ButtonBottomSheet> {
  late double _height;
  final double _minHeight = 50;
  bool _opened = true;
  Widget buttonContainer = SizedBox();

  @override
  void initState() {
    _height = widget._height;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: appTheme.isLightTheme
          ? Theme.of(context).primaryColorLight
          : Theme.of(context).primaryColorDark,
      child: GestureDetector(
        onVerticalDragEnd: (details) {
          double _fraction = 0.1;
          if (mounted) {
            setState(() {
              if (_opened && _height >= widget._height * _fraction) {
                _height = widget._height;
              } else if (!_opened &&
                  _height < widget._height * (1 - _fraction)) {
                _height = _minHeight;
              }

              _opened = _height == widget._height;
            });
          }
        },
        onVerticalDragUpdate: (details) {
          if (mounted) {
            setState(() {
              _height = _height - details.delta.dy;
              if (_height > widget._height || _height < _minHeight) {
                _height = _opened ? widget._height : _minHeight;
              }
              _opened = details.delta.dy < 0;
            });
          }
        },
        child: AnimatedContainer(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 10),
            height: _height,
            width: MediaQuery.of(context).size.width,
            duration: Duration(milliseconds: 200),
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // For Horizontal Line
                  Container(
                    height: 5,
                    width: MediaQuery.of(context).size.width * 0.3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Theme.of(context).primaryColorLight),
                  ),
                  // Buttons

                  _height == _minHeight
                      ? SizedBox()
                      : Container(
                          child: ButtonsContainer(
                            height: _height * 0.9,
                          ),
                        )
                ],
              ),
            )),
      ),
    );
  }
}
