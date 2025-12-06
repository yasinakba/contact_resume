class ContactEntity {
  int id;
   String phoneNumber;
   String name;

  ContactEntity({
    required this.id,
    required this.phoneNumber,
    required this.name,
  });

  // From JSON
  factory ContactEntity.fromJson(Map<String, dynamic> json) {
    return ContactEntity(
      phoneNumber: json['phoneNumber'],
      name: json['name'], id: json['id'],
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'phoneNumber': phoneNumber,
      'name': name,
    };
  }
}
