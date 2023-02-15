import 'package:vaara_app/consts/consts.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';

Widget CustomTextField(
    {String? title, String? hint, bool? isBig, BuildContext? context = null}) {
  return Container(
    padding: const EdgeInsets.all(10),
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title!.text.bold.size(18).make(),
        Container(
          //color: Color.fromARGB(130, 212, 206, 206),
          child: TextFormField(
            //expands: true,
            maxLines: isBig == true ? 5 : 1,
            minLines: isBig == true ? 3 : 1,
            keyboardType:
                isBig == true ? TextInputType.multiline : TextInputType.text,

            decoration: InputDecoration(
              //border: OutlineInputBorder(),
              hintStyle: const TextStyle(
                  //fontWeight: FontWeight.bold,
                  ),
              hintText: hint,
            ),
          ),
        ),
      ],
    ),
  );
}
