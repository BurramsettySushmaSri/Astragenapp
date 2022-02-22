import 'package:flutter/material.dart';
import 'modal_class.dart';

// void main() => runApp(const MyApp());

/// This Widget is the main application widget.
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


List<ClassItem> classes = List<ClassItem>.empty(growable: true);
List<MySubjects> imageList(String grade) => [
        MySubjects(img: "images/gk.png", imgName: "GK"),
        MySubjects(img: "images/artzone.jpeg", imgName: "ArtZone"),
        MySubjects(img: "images/eng.jpg", imgName: "English"),
        MySubjects(img: "images/maths.jpg", imgName: "Mathematics"),
        MySubjects(img: "images/cs.png", imgName: "Computer Science"),
        MySubjects(img: "images/ai.jpg", imgName: "Artificial Intelligence "),
        MySubjects(img: "images/python.png", imgName: "Python Programming"),
        MySubjects(img: "images/evs.jpg", imgName: "Enviromental science"),
        MySubjects(img: "images/social.jpg", imgName: "Social Studies"),
        MySubjects(img: "images/DS.jpg", imgName: "Data Science"),
      ];
  @override
  void initState() {
    classes = [
      ClassItem(text: "Nursery", subtext: "A",subjects: imageList("Nursery")),
      ClassItem(text: "LKG", subtext: "A",subjects: imageList("LKG")),
      ClassItem(text: "LKG", subtext: "B",subjects: imageList("LKG1")),
      ClassItem(text: "UKG", subtext: "A",subjects: imageList("UKG")),
      ClassItem(text: "UKG", subtext: "B",subjects: imageList("UKG1")),
      ClassItem(text: "Grade - A", subtext: "1",subjects: imageList("Grade-A")),
      ClassItem(text: "Grade - B", subtext: "2",subjects: imageList("Grade-B")),
      ClassItem(text: "Grade - C", subtext: "3",subjects: imageList("Grade-C")),
      ClassItem(text: "Grade - D", subtext: "4", subjects: imageList("Grade-D")),
      ClassItem(text: "Grade - E", subtext: "5",subjects: imageList("Grade-D")),
    ];
    super.initState();
  }

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
                  
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 6,
                      itemBuilder: (BuildContext context, int index) =>
                          topSection(item: items[index],),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 8,
                      itemBuilder: (BuildContext context, int index) =>
                          classsection(classes.elementAt(index)),
                    ),
                  ),
                ],
              ))
            : Center(child:Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  
                    SizedBox(
                      width: 300,
                    
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 8,
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
                          classsection(classes.elementAt(index)),
                    ),
                  ),
                ],
              ))));
  }

  Widget classsection(ClassItem classItem) {
    return SingleChildScrollView(
      // scrollDirection: Axis.horizontal,
      child: Row(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 150,
            width: cardwidth(context),
            margin: const EdgeInsets.only(left: 30,),
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
                      left: Radius.circular(15),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      classItem.text,
                      style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      classItem.subtext,
                      style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                  ),
                ),
              ],
            ),
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
          margin: const EdgeInsets.only(left: 30,top: 25),
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
  if (width < 307) {
    width = width * 0.75;
    return width;
  }
  else if (width < 465) {
    width = width * 0.85;
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
