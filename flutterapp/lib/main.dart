import 'package:flutter/material.dart';
import 'rest-api.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: MaterialApp(
          title: 'Test App',
          theme: ThemeData(
            primarySwatch: Colors.red,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: MyHomePage(),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String text = "";
  String url = "51.15.137.206:8000";

  void changeText(String text) {
    this.setState(() {
      this.text = text;
    });
    /*ApiService.postApi(url, text);*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Hello world!")),
        body: Column(
          children: <Widget>[TextInputWidget(this.changeText), Text(this.text)],
        ));
  }
}

class TextInputWidget extends StatefulWidget {
  final Function(String) callback;

  TextInputWidget(this.callback);

  @override
  _TextInputWidgetState createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  final controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void click() {
    widget.callback(controller.text);
    controller.clear();
    FocusScope.of(context).requestFocus(new FocusNode());
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: this.controller,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.message),
            labelText: "Type a message:",
            suffixIcon: IconButton(
              icon: Icon(Icons.send),
              splashColor: Colors.blue,
              tooltip: "Send Message",
              onPressed: this.click,
            )),
        onSubmitted: (value) {
          widget.callback(controller.text);
          controller.clear();
        });
  }
}
