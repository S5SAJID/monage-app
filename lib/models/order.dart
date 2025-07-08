class Order {
  final int? id;
  final int customerId;
  final String name;
  final double price;
  final String? imagePath;
  final String createdAt;

  Order({
    this.id,
    required this.customerId,
    required this.name,
    required this.price,
    this.imagePath,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'customerId': customerId,
      'name': name,
      'price': price,
      'imagePath': imagePath,
      'createdAt': createdAt,
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      id: map['id'],
      customerId: map['customerId'],
      name: map['name'],
      price: map['price'],
      imagePath: map['imagePath'],
      createdAt: map['createdAt'],
    );
  }
}
