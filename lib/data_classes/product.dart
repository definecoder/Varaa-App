class Product {
  bool isLend;
  String title;
  String location;
  String frequency;
  String status;
  String imgLocation;
  String price;
  bool isHome;
  String condition;
  String description;
  String address;

  Product(
      {this.isLend = false,
      required this.location,
      required this.title,
      required this.frequency,
      this.status = 'N/A',
      this.imgLocation = 'assets/no_image.png',
      required this.price,
      this.isHome = false,
      this.address = 'N/A',
      this.condition = 'N/A',
      this.description = 'N/A'});
}
