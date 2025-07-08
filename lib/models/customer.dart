class Customer {
  final int? id;
  final String name;
  final String? imagePath;
  double unpaidAmount;

  Customer({this.id, required this.name, this.imagePath, this.unpaidAmount = 0.0});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'imagePath': imagePath,
      'unpaidAmount': unpaidAmount,
    };
  }

  factory Customer.fromMap(Map<String, dynamic> map) {
    return Customer(
      id: map['id'],
      name: map['name'],
      imagePath: map['imagePath'],
      unpaidAmount: map['unpaidAmount'] ?? 0.0,
    );
  }
}
