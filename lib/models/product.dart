class Product {
  late String id;
  late String name;
  late String description;
  late String image;
  late num price;
  late num quantity;
  late num rate;

  Product({
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    required this.quantity,
    required this.rate,
  });

  Product.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    description = map['description'];
    image = map['image'];
    price = map['price'];
    quantity = map['quantity'];
    rate = map['rate'];
  }
  toMap() {
    return {
      'name': name,
      'description': description,
      'image': image,
      'price': price,
      'quantity': quantity,
      'rate': rate,
    };
  }
}
