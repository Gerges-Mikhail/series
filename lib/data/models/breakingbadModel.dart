class BBCharacterModel {
  int? charID;
  String? name;
  String? birthDate;
  List<String>? occupation;
  String? imageURL;

  BBCharacterModel(
      this.charID, this.name, this.birthDate, this.occupation, this.imageURL);

  BBCharacterModel.fromJson(Map<String,dynamic> json){
    charID = json['char_id'];
    name = json['name'];
    birthDate = json['birthDate'];
    occupation = List<String>.from(json["occupation"].map((x) => x));
    imageURL = json['img'];
  }
}
