class User {
  String name, email, password, username, phone_number;
  String image;

  User({
    required this.name,
    required this.email,
    this.image = './aseets/useraltfill.png',
    required this.password,
    required this.phone_number,
    required this.username,
  });
}
