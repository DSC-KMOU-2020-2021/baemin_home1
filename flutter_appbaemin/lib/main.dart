import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    double contentHeight = 300.0;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("주소"),
      ), //정인'S PART
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              CarouselSlider(
                options: CarouselOptions(
                  height: 150.0,
                  aspectRatio: 16 / 9,
                  viewportFraction: 1.0,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                ),
                items: [1, 2, 3, 4, 5].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 0.0),
                          decoration: BoxDecoration(color: Colors.amber),
                          child: Text(
                            '임시화면 $i',
                            style: TextStyle(fontSize: 16.0),
                            textAlign: TextAlign.center,
                          ));
                    },
                  );
                }).toList(),
              ),
              Column(
                children: [
                  Container(
                    height: 50.0,
                    color: Colors.teal,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: contentHeight,
                    margin: EdgeInsets.symmetric(horizontal: 2.0),
                    decoration: BoxDecoration(color: Colors.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ContentRow(contentHeight: contentHeight),
                        ContentRow(contentHeight: contentHeight),
                        ContentRow(contentHeight: contentHeight),
                        ContentRow(contentHeight: contentHeight),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 200.0,
                margin: EdgeInsets.symmetric(horizontal: 2.0),
                decoration: BoxDecoration(color: Colors.grey),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        "오늘의 할인",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 150.0,
                        // aspectRatio: 15 / 6,
                        enableInfiniteScroll: false,
                      ),
                      items: [1, 2, 3, 4, 5].map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.symmetric(horizontal: 5.0),
                                color: Colors.pinkAccent,
                                child: Text(
                                  '이거슨 할인쿠폰 $i',
                                  style: TextStyle(fontSize: 16.0),
                                ));
                          },
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              Text(
                '(주)우아한형제들',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ContentRow extends StatelessWidget {
  const ContentRow({
    Key key,
    @required this.contentHeight,
  }) : super(key: key);

  final double contentHeight;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ContentMenu(contentHeight: contentHeight),
        ContentMenu(contentHeight: contentHeight),
        ContentMenu(contentHeight: contentHeight),
        ContentMenu(contentHeight: contentHeight),
        ContentMenu(contentHeight: contentHeight),
      ],
    );
  }
}

class ContentMenu extends StatelessWidget {
  const ContentMenu({
    Key key,
    @required this.contentHeight,
  }) : super(key: key);

  final double contentHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      color: Colors.greenAccent,
      width: MediaQuery.of(context).size.width / 6,
      height: (contentHeight / 5),
    );
  }
}
