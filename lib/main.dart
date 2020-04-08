import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
    title: 'Ainda não sei', debugShowCheckedModeBanner: false, home: Home()));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _percentController = TextEditingController();
  TextEditingController _valueController = TextEditingController();
  String _result = '';

  void _resetFields() {
    _percentController.text = '';
    _valueController.text = '';

    setState(() {
      _result = '';
    });
  }

  void _ratata() {
    double percent = double.parse(_percentController.text.replaceAll(',', '.'));
    double value = double.parse(_valueController.text.replaceAll(',', '.'));
    double res = (percent / 100) * value;

    setState(() {
      _result =
          '$percent% of ${value.toStringAsFixed(0)} is = ${res.toStringAsPrecision(4)}';
    });
  }

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Porcent Calculator',
          style: TextStyle(
              color: Colors.deepPurple,
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.yellowAccent,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _resetFields,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(
                Icons.dashboard,
                size: 120,
                color: Colors.deepPurpleAccent,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'Porcent',
                    labelStyle: TextStyle(
                        color: Colors.deepPurpleAccent,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: Colors.deepPurple),
                controller: _percentController,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Insert Porcent';
                  }
                },
              ),
              TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Value',
                      labelStyle: TextStyle(
                          color: Colors.deepPurpleAccent,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.deepPurple),
                  controller: _valueController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Insert Value';
                    }
                  }),
              Container(
                padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
                child: RaisedButton(
                  child: Text(
                    'Submit',
                    style: TextStyle(fontSize: 25),
                  ),
                  color: Colors.tealAccent,
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _ratata();
                    }
                  },
                ),
              ),
              Text(
                _result,
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
