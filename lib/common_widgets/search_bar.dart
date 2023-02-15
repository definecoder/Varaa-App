import 'package:vaara_app/consts/consts.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width - 120,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Color.fromARGB(229, 211, 211, 211),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          border: InputBorder.none,
          suffixIcon: GestureDetector(
            child: Icon(Icons.search, color: purple1),
            onTap: () {
              //print("hey");
            },
          ),
          hintText: 'Search...',
          hintStyle: TextStyle(fontFamily: poppins),
        ),
      ),
    );
  }
}
