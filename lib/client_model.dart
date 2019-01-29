// Generate Our model

import 'dart:convert';

Client clientFromJson(String str) {
    final jsonData = json.decode(str);
    return Client.fromJson(jsonData);
}

String clientToJson(Client data) {
    final dyn = data.toJson();
    return json.encode(dyn);
}

class Client {
    int id;
    String name;
    String company;
    String email;

    Client({
        this.id,
        this.name,
        this.company,
        this.email,
    });

    factory Client.fromJson(Map<String, dynamic> json) => new Client(
        id: json["id"],
        name: json["name"],
        company: json["company"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "company": company,
        "email": email,
    };
}