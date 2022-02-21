import 'package:flutter/material.dart';
import 'modal_class.dart';

// void main() => runApp(const MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Center(child: Text('Sample'))),
        // backgroundColor: Colors.yellow,
        body: (MediaQuery.of(context).size.width < 600)
            ? (Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    height: 200,
                    // child:Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) =>
                          topSection(item: items[index]),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 8,
                      itemBuilder: (BuildContext context, int index) =>
                          classsection(context),
                    ),
                  ),
                ],
              ))
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  
                    SizedBox(
                      width: 300,
                    
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 5,
                      controller: ScrollController(),
                      itemBuilder: (BuildContext context, int index) =>
                          topSection(item: items[index]),
                    ),
                  ),

                  // const SizedBox(width: 25),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 8,
                      itemBuilder: (BuildContext context, int index) =>
                          classsection(context),
                    ),
                  ),
                ],
              )));
  }

  Widget classsection(BuildContext context) {
    return SingleChildScrollView(
      // scrollDirection: Axis.horizontal,
      child: Row(children: [
        Container(
          height: 150,
          width: cardwidth(context),

          // width: cardwidth(context),
          margin: const EdgeInsets.only(left: 30, top: 41),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue,width: 1.5),
            borderRadius: const BorderRadius.all(Radius.circular(15)),
          ),

          child: Row(
            children: [
              Container(
                height: 150,
                width: 100,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(5),
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }

  Widget topSection({required CardItem item}) =>
      Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        // (const Padding(
        //   padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
        // )),
        Container(
          height: 150,
          width: 220,
          margin: const EdgeInsets.only(left: 30,top: 40,right:20,bottom: 20),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue, width: 3),
            borderRadius: const BorderRadius.all(Radius.circular(25)),
          ),
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Padding(padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child:SizedBox(
              width: 80,
              child: Image(
                image: AssetImage(item.urlImage),
                fit: BoxFit.fitWidth,
              ),
            ),
            ),

            // ignore: prefer_const_constructors
            VerticalDivider(
              color: Colors.blue,
              thickness: 3,
              width: 25,
              endIndent: 3,
              indent: 3,
            ),

            SizedBox(
                width: 90,
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    Text(
                      item.title,
                      style: const TextStyle(fontSize: 20),
                    ),
                    Text(
                      item.subtitle,
                      style: const TextStyle(fontSize: 10),
                    ),
                  ],
                ),
              ),
            
          ]),
        ),
      ]);
}

cardwidth(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  if (width < 380) {
    width = width * 0.88;
    return width;
  } 
  else if(width<600){
    width=width*0.9;
    return width;
    }else {
    width = width / 2.5;
    return width;
  }

  }
