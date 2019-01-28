class Client {
  final int id;
  final String name;
  final String company;
  final String email;

  Client(this.id, {this.name, this.company, this.email});

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
        json['index'],
        name: json['name'],
        company: json['company'],
        email: json['email']
      );
  } 
}