class Message {
  final String id;
  final String name;
  final String phone;
  final String email;
  final String address;
  final String image;

  Message({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.address,
    required this.image,
  });

  /// من JSON → Object
  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      phone: json['phone'] ?? '',
      email: json['email'] ?? '',
      address: json['address'] ?? '',
      image: json['image'] ?? '',
    );
  }

  /// من Object → JSON
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'phone': phone,
      'email': email,
      'address': address,
      'image': image,
    };
  }
}
