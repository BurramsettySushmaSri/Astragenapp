class CardItem{
  final String urlImage;
  final String title;
  final String subtitle;
  const CardItem({required this.urlImage,required this.title,required this.subtitle});
}
class ClassItem{
   String text;
   String subtext;
  List<MySubjects> subjects;
  ClassItem({required this.text,required this.subtext,required this.subjects});
}
class MySubjects{
  String img;
  String imgName;
  MySubjects({required this.img,required this.imgName});
}
 List<CardItem> items = [
    const CardItem(
      urlImage: 'images/image3.png',
      title: 'UKG',
      subtitle: 'Today@1:30 PM',
    ),
    const CardItem(
      urlImage: 'images/image1.png',
      title: 'LKG',
      subtitle: 'Today@11:30 PM',
    ),
    const CardItem(
      urlImage: 'images/image2.png',
      title: 'SR.KG',
      subtitle: 'Today@12:30 PM',
    ),
    const CardItem(
      urlImage: 'images/image3.png',
      title: '1',
      subtitle: 'Today@1:30 PM',
    ),
    const CardItem(
      urlImage: 'images/image1.png',
      title: '2',
      subtitle: 'Today@2:30 PM',
    ),
    const CardItem(
      urlImage: 'images/image3.png',
      title: '3',
      subtitle: 'Today@1:30 PM',
    ),
  ];