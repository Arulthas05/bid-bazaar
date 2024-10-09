class Location {
  final String id;
  final String name;
  final String type;
  final String? parent;

  Location({
    required this.id,
    required this.name,
    required this.type,
    this.parent,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      id: json['_id'],
      name: json['name'],
      type: json['type'],
      parent: json['parent'],
    );
  }
}
