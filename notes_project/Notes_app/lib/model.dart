class DataModel {
  int? id;
  String? name;
  String? age;
  String? number;
  String? gender;

  DataModel({
    this.id,
    this.name,
    this.age,
    this.number,
    this.gender,
  });

  factory DataModel.formMap(Map<String, dynamic> json) => DataModel(
        id: json["id"],
        name: json["name"],
        age: json["age"],
        number: json["number"],
        gender: json["gender"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "age": age,
        "number": number,
        "gender": gender,
      };
}
