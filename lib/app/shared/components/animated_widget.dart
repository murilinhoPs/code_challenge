import 'package:flutter/material.dart';

class MyAnimatedWidget extends StatefulWidget {
  final Alignment startAlignment;
  final Alignment endAlignment;
  final String title;
  final String subtitle;

  const MyAnimatedWidget(
      {Key key,
      this.startAlignment,
      this.endAlignment,
      this.title,
      this.subtitle})
      : super(key: key);

  @override
  _MyAnimatedWidgetState createState() =>
      _MyAnimatedWidgetState(startAlignment, endAlignment, title, subtitle);
}

class _MyAnimatedWidgetState extends State<MyAnimatedWidget> {
  _MyAnimatedWidgetState(
      this._startAlignment, this._endAlignment, this._title, this._subtitle);

  final _duration = Duration(milliseconds: 400);
  final _startAlignment;
  final _endAlignment;
  final _title;
  final _subtitle;

  Alignment _currentAlignment;

  var myWidth = 200.0;

  var myHeight = 50.0;

  bool animate = false;

  @override
  void initState() {
    super.initState();
    _currentAlignment = _startAlignment;
  }

  _animarWidget() {
    animate = !animate;

    if (animate) {
      setState(() {
        _currentAlignment = _endAlignment;

        myHeight = 200.0;
        myWidth = 250.0;
      });
    } else {
      setState(() {
        _currentAlignment = _startAlignment;

        myHeight = 50.0;
        myWidth = 200.0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedAlign(
      duration: Duration(milliseconds: 250),
      alignment: _currentAlignment,
      child: AnimatedContainer(
        width: myWidth,
        height: myHeight,
        duration: _duration,
        curve: Curves.easeInOutBack,
        child: Card(
          color: Colors.cyan,
          child: InkWell(
            splashColor: Colors.white.withAlpha(80),
            onTap: () {
              _animarWidget();
            },
            child: ListTile(
              title: Text(
                '$_title',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 26, color: Colors.white),
              ),
              subtitle: animate
                  ? Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        '$_subtitle',
                        style: TextStyle(color: Colors.white70, fontSize: 16),
                      ),
                    )
                  : Container(),
            ),
          ),
        ),
      ),
    );
  }
}
