//First, we’ll need to create a MyModelclass 
//that contains the data from our network request.
//It will also include a factory constructor that allows us to create a Post from json.

//Converting JSON by hand is only one option. For more information,
//please see the full article on JSON and serialization.


class MyModel  {
  final int id;
  final String title;
  final String description;
  MyModel({this.id, this.title, this.description});

  factory MyModel.fromJson(Map<String,dynamic>json) {
    return MyModel(
      description: json['description'],
      id: json['id'],
      title: json['name']);
  }
}