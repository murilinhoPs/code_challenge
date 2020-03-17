import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAnimatedWidget extends StatefulWidget {
  final Alignment startAlignment;
  final Alignment endAlignment;
  final String title;
  final String custo;
  final String internet;
  final String sms;
  final Widget appsIlimitados;

  const MyAnimatedWidget(
      {Key key,
      @required this.startAlignment,
      @required this.endAlignment,
      @required this.title,
      this.appsIlimitados,
      @required this.custo,
      @required this.internet,
      @required this.sms})
      : super(key: key);

  @override
  _MyAnimatedWidgetState createState() => _MyAnimatedWidgetState(startAlignment,
      endAlignment, title, custo, internet, sms, appsIlimitados);
}

class _MyAnimatedWidgetState extends State<MyAnimatedWidget> {
  _MyAnimatedWidgetState(this._startAlignment, this._endAlignment, this._title,
      this._custo, this._internet, this._sms, this._appsIlimitados);

  final _duration = Duration(milliseconds: 400);
  final _startAlignment;
  final _endAlignment;
  final _title;
  final _custo;
  final _internet;
  final _sms;
  final Widget _appsIlimitados;

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

        myHeight = _title == 'Fale Mais 120' ? 260.0 : 200.0;
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

  _textContent(content) {
    return Text(
      content,
      style: GoogleFonts.baloo(fontSize: 18, color: Colors.white),
    );
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
            child: _content(context),
          ),
        ),
      ),
    );
  }

  Widget _content(context) {
    return ListTile(
      title: Text(
        '$_title',
        textAlign: TextAlign.center,
        style: GoogleFonts.baloo(fontSize: 24, color: Colors.white),
      ),
      subtitle: animate
          ? Flex(
              mainAxisSize: MainAxisSize.max,
              direction: Axis.vertical,
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 5.0),
                          padding: EdgeInsets.all(8.0),
                          child: _textContent('$_custo'),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5.0),
                          padding: EdgeInsets.all(8.0),
                          child: _textContent('$_internet de internet'),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5.0),
                          padding: EdgeInsets.all(8.0),
                          child: _textContent('sms: $_sms'),
                        ),
                        _appsIlimitados,
                      ],
                    )),
              ],
            )
          : Container(),
    );
  }
}
