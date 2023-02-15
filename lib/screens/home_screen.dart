import 'package:vaara_app/common_widgets/app_logo.dart';
import 'package:vaara_app/common_widgets/search_bar.dart';
import 'package:vaara_app/consts/consts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                appLogoWidget(100, 100),
                SearchBar(),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(PostNewProduct());
        },
        elevation: 5,
        backgroundColor: Color(0xff9F1F63),
        child: Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBar(
        curScene: 1, // 1 = home, 2 = my rents, 3 = notifications, 4 = profile
      ),
    );
  }
}
