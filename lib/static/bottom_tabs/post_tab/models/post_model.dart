class PostModel {
  String image;
  String name;
  String time;
  String text;

  PostModel({this.image, this.name, this.text, this.time});
}

final posts = [
  PostModel(
      image: 'images/bat.jpeg',
      name: "Ebad",
      time: "2 hours ago",
      text:
          "Hello this is the post related to some of my oldest post. Hello guys what are you doing."),
  PostModel(
      image: 'no',
      name: "Zain",
      time: "2 hours ago",
      text:
          "Hello this is the post related to some of my oldest post. Hello guys what are you doing."),
  PostModel(
      image: 'images/bat.jpeg',
      name: "Farah",
      time: "2 hours ago",
      text:
          "Hello this is the post related to some of my oldest post. Hello guys what are you doing."),
  PostModel(
      image: 'no',
      name: "Huzaifa",
      time: "2 hours ago",
      text:
          "Hello this is the post related to some of my oldest post. Hello guys what are you doing."),
];
