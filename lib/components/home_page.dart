import 'package:flutter/material.dart';
import 'modal.dart';

class MyCardWidget extends StatelessWidget {
  const MyCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (MediaQuery.of(context).size.width < 560)
          ? (Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                // const Text(
                //   'Top Section',
                //   style:TextStyle(fontSize: 18),
                // ),
                Expanded(
                  child: ListView.builder(
                    controller: ScrollController(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) =>
                        sectionCard(context, item: items[index]),
                  ),
                ),
                // const Text(
                //   'Class Section',
                //   style: TextStyle(fontSize: 18),
                // ),
                Expanded(
                  child: ListView.builder(
                    controller: ScrollController(),
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) =>
                        classsection(context),
                  ),
                ),
              ],
            ))
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                    controller: ScrollController(),
                    shrinkWrap: true,
                    itemCount: 5,
                    // itemBuilder: (BuildContext context, int index) =>
                    //     topsection(context),
                    itemBuilder: (BuildContext context, int index) =>
                        sectionCard(context, item: items[index]),
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: ListView.builder(
                    controller: ScrollController(),
                    shrinkWrap: true,
                    itemCount: 15,
                    itemBuilder: (BuildContext context, int index) =>
                        classsection(context),
                  ),
                ),
              ],
            ),
    );
  }

  Widget classsection(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        (const Padding(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 0),
        )),
        Container(
          height: 150,
          // width: 450,
          width: cardwidth(context),
          margin: const EdgeInsets.only(top: 30, left: 20, right: 30),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.purpleAccent),
            borderRadius: const BorderRadius.all(Radius.circular(5)),
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
              )
            ],
          ),
        ),
      ]),
    );
  }

  Widget topsection(BuildContext context) {
    return Center(
        child: Container(
      width: 300,
      height: 200,
      padding: const EdgeInsets.all(10.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.red,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            ListTile(
              leading: Icon(Icons.album, size: 40),
              title: Text('top section', style: TextStyle(fontSize: 20.0)),
              subtitle: Text('', style: TextStyle(fontSize: 10.0)),
            ),
          ],
        ),
      ),
    ));
  }

  Widget sectionCard(BuildContext context, {required CardItem item}) =>
      Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        (const Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
        )),
        Container(
          height: 150,
          width: 200,
          margin: const EdgeInsets.only(top: 80, left: 30),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue, width: 3),
            borderRadius: const BorderRadius.all(Radius.circular(25)),
          ),
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            SizedBox(
              // height: 200,
              width: 80,
              child: Image(
                image: AssetImage(item.urlImage),
                fit: BoxFit.fitWidth,
              ),
            ),

            // ignore: prefer_const_constructors
            VerticalDivider(
              color: Colors.blue,
              thickness: 5,
              width: 30,
            ),

            Column(
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
          ]),
        ),
      ]);
}

cardwidth(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  if (width < 650) {
    width = 450;
    return width;
  } else {
    return 400;
  }
}
