

class Pokemon {

  int id;
  int attack;
  int defense;
  String description;
  int height;
  String name;
  String type;
  int weight;
  String imageUrl;

  Pokemon({
    this.id,
    this.attack,
    this.defense,
    this.description,
    this.height,
    this.name,
    this.type,
    this.weight,
    this.imageUrl,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'],
      attack: json['attack'],
      defense: json['defense'],
      description: json['description'],
      height: json['height'],
      name: json['name'],
      type: json['type'],
      weight: json['weight'],
      imageUrl: json['imageUrl'],
    );
  }

}