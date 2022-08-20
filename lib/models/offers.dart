class Offer {
  late String id;
  late String name;
  late String discount;
  late String imageUrl;

  Offer(
      {required this.imageUrl, required this.name, required this.discount});

  Offer.fromMap(Map<String, dynamic> map) {
    name = map['name'];
    discount = map['discount'];
    imageUrl = map['imageUrl'];
  }
  toMap() {
    return {
      'name': name,
      'discount': discount,
      'imageUrl': imageUrl,
    };
  }
}
