import 'package:vaara_app/consts/consts.dart';

Widget CustomTextField({String? title, String? hint}) {
  return Container(
    padding: const EdgeInsets.all(10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title!.text.make(),
        TextFormField(
          decoration: InputDecoration(
            hintStyle: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
            hintText: hint,
          ),
        ),
      ],
    ),
  );
}
