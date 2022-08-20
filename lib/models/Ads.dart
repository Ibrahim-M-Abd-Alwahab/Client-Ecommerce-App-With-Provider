class Advertisement {
  late String imageUrl;
  late String name;
  late String id;
  Advertisement({required this.imageUrl});

  Advertisement.fromMap(Map<String, dynamic> map) {
    imageUrl = map['imageUrl'];
    name = map['name'];
  }
  toMap() {
    return {
      'imageUrl': imageUrl,
      'name': name,
    };
  }
}
