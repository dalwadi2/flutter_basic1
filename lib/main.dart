import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _state createState() => new _state();
}

class _state extends State<MyApp> {
  int i = 0;
  String _text = 'Hello World!';

  bool value1 = false;
  bool value2 = false;

  int radioValue1 = 0;
  int radioValue2 = 0;

  Widget makeRadios() {
    List<Widget> list = new List<Widget>();

    for (int i = 0; i < 2; i++) {
      list.add(
          new Radio(value: i, groupValue: radioValue1, onChanged: setValue1));
    }

    Column column = new Column(
      children: list,
    );
    return column;
  }

  Widget makeRadioTiles() {
    List<Widget> list = new List<Widget>();

    for (int i = 0; i < 3; i++) {
      list.add(new RadioListTile(
        value: i,
        groupValue: radioValue2,
        onChanged: setValue2,
        activeColor: Colors.blue,
        controlAffinity: ListTileControlAffinity.trailing,
        title: new Text("Radio ${i}"),
        subtitle: new Text("Radio Subtitle ${i}"),
      ));
    }

    Column column = new Column(
      children: list,
    );
    return column;
  }

  void setValue1(int value) {
    setState(() {
      radioValue1 = value;
    });
  }

  void setValue2(int value) {
    setState(() {
      radioValue2 = value;
    });
  }

  void value1Change(bool value) {
    setState(() {
      value1 = value;
    });
  }

  void value2Change(bool value) {
    setState(() {
      value2 = value;
    });
  }

  void onClick() {
    setState(() {
      _text = 'Clicked ${i++}';
    });
  }

  void onRuntimeParamClick(int i) {
    setState(() {
      _text = 'Clicked ${i}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('My Title'),
      ),
      body: new Container(
        padding: new EdgeInsets.all(10.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text(_text),
              new RaisedButton(onPressed: onClick, child: new Text('Button')),
              new IconButton(
                onPressed: onMinusClick,
                icon: new Icon(Icons.remove),
              ),
              new FlatButton(
                  onPressed: onFlatButtonClick, child: new Text('Flat Button')),
              new RaisedButton(
                  onPressed: () => onRuntimeParamClick(i++),
                  child: new Text('Runtime Param Funtion')),
              new TextField(
                decoration: new InputDecoration(
                    labelText: 'Label',
                    hintText: 'Hint',
                    icon: new Icon(Icons.people)),
                autocorrect: true,
                keyboardType: TextInputType.text,
                onChanged: onChange,
                onSubmitted: onSubmit,
              ),
              new Checkbox(value: value1, onChanged: value1Change),
              new CheckboxListTile(
                value: value2,
                onChanged: value2Change,
                title: new Text('Check Box'),
                controlAffinity: ListTileControlAffinity.leading,
                subtitle: new Text('Subtitle'),
                secondary: new Icon(Icons.archive),
                activeColor: Colors.red,
              ),
              makeRadios(),
              makeRadioTiles(),
            ],
          ),
        ),
      ),
    );
  }

  void onFlatButtonClick() {
    setState(() {
      _text = new DateTime.now().toString();
    });
  }

  void onMinusClick() {
    setState(() {
      _text = 'Clicked ${i--}';
    });
  }

  void onChange(String value) {
    setState(() {
      _text = 'Change: ${value}';
    });
  }

  void onSubmit(String value) {
    setState(() {
      _text = 'Submit: ${value}';
    });
  }
}
