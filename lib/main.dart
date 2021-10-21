import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool allowResize = true;
  bool allowChangeColor = true;
  int redN = 0;
  int blueN = 0;
  int greenN = 0;
  int iconSize = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Icon"),
        actions: <Widget>[
          Visibility(
            visible: allowResize,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              alignment: Alignment.center,
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.white),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                  icon: Text('-',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  onPressed: () {
                    setState(
                      () {
                        iconSize = iconSize == 400 ? iconSize : iconSize - 50;
                      },
                    );
                  }),
            ),
          ),
          Visibility(
            visible: allowResize,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              alignment: Alignment.center,
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.white),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: Text('S',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                onPressed: () {
                  setState(() {
                    iconSize = 100;
                  });
                },
              ),
            ),
          ),
          Visibility(
            visible: allowResize,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              alignment: Alignment.center,
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.white),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: Text('M',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                onPressed: () {
                  setState(() {
                    iconSize = 300;
                  });
                },
              ),
            ),
          ),
          Visibility(
            visible: allowResize,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              alignment: Alignment.center,
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.white),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: Text('L',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                onPressed: () {
                  setState(() {
                    iconSize = 500;
                  });
                },
              ),
            ),
          ),
          Visibility(
            visible: allowResize,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              alignment: Alignment.center,
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.white),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                  icon: Text('+',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  onPressed: () {
                    setState(() {
                      iconSize = iconSize >= 400 ? iconSize : iconSize + 50;
                    });
                  }),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            Card(
              child: CheckboxListTile(
                  title: Text('Allow resize?'),
                  value: allowResize,
                  onChanged: (value) => {
                        setState(() {
                          allowResize = value;
                        })
                      }),
            ),
            Card(
              child: CheckboxListTile(
                  title: Text('Allow change primer color?'),
                  value: allowChangeColor,
                  onChanged: (value) => {
                        setState(() {
                          allowChangeColor = value;
                        })
                      }),
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: Icon(
                Icons.accessibility,
                size: iconSize.toDouble(),
                color: Color.fromRGBO(redN, greenN, blueN, 1),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Slider(
                        value: redN.toDouble(),
                        min: 0,
                        max: 255,
                        onChanged: (double value) {
                          setState(() {
                            redN = value.toInt();
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: allowChangeColor
                            ? FloatingActionButton(
                                backgroundColor: Colors.red,
                                child: Text(redN.toString()),
                                onPressed: () {
                                  setState(() {
                                    redN = 255;
                                    greenN = 0;
                                    blueN = 0;
                                  });
                                },
                              )
                            : Text('Error'),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Slider(
                        value: greenN.toDouble(),
                        min: 0,
                        max: 255,
                        onChanged: (double value) {
                          setState(() {
                            greenN = value.toInt();
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: allowChangeColor
                            ? FloatingActionButton(
                                backgroundColor: Colors.green,
                                child: Text(greenN.toString()),
                                onPressed: () {
                                  setState(() {
                                    redN = 0;
                                    greenN = 255;
                                    blueN = 0;
                                  });
                                },
                              )
                            : Text('Error'),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Slider(
                        value: blueN.toDouble(),
                        min: 0,
                        max: 255,
                        onChanged: (double value) {
                          setState(() {
                            blueN = value.toInt();
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: allowChangeColor
                            ? FloatingActionButton(
                                backgroundColor: Colors.blue,
                                child: Text(blueN.toString()),
                                onPressed: () {
                                  setState(() {
                                    redN = 0;
                                    greenN = 0;
                                    blueN = 255;
                                  });
                                })
                            : Text('Error'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
