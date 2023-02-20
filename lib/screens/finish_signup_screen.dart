import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vaara_app/common_widgets/app_logo.dart';
import 'package:vaara_app/common_widgets/bg_widget.dart';
import 'package:vaara_app/common_widgets/custom_textfield.dart';
import 'package:vaara_app/consts/consts.dart';
import 'package:vaara_app/screens/login_screen.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:vaara_app/screens/welcome_screen.dart';

import '../common_widgets/button.dart';

class FinishSignup extends StatefulWidget {
  String email;
  String password;

  FinishSignup({super.key, required this.email, required this.password});

  @override
  State<FinishSignup> createState() => _FinishSignupState();
}

class _FinishSignupState extends State<FinishSignup> {
  ImagePicker profilePicturePicker = ImagePicker();
  bool profilePictureUploaded = false;
  XFile? profilePicture;
  String userPhotoUrl = "null";
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  final _userNameContoller = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _cityNameController = TextEditingController();

  bool isLoading = false;

  Future signUp(context) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: widget.email,
        password: widget.password,
      );
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
      Get.to(WelcomeScreen());
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _userNameContoller.dispose();
    _cityNameController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  Future addUserDetails() async {
    // print(userPhotoUrl);
    try {
      await FirebaseFirestore.instance.collection('users').add({
        'Username': _userNameContoller.text.trim(),
        'Phone': _phoneNumberController.text.trim(),
        'Email': (FirebaseAuth.instance.currentUser!).email!,
        'City': _cityNameController.text.trim(),
        'PhotoUrl': userPhotoUrl as String,
        'id': FirebaseAuth.instance.currentUser!.uid,
      });
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BgWidget(
      child: Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                10.heightBox,
                Stack(
                  children: [
                    Center(
                      child: appLogoWidget(150, 150),
                    ),
                    Row(
                      children: [
                        10.widthBox,
                        IconButton(
                          onPressed: () {
                            context.pop();
                          },
                          icon: Icon(Icons.arrow_back_ios_rounded),
                          color: purple1,
                        )
                      ],
                    )
                  ],
                ),
                10.heightBox,
                "Finish Sign up".text.fontFamily(poppins).size(30).bold.make(),
                20.heightBox,
                profilePictureUploaded == false
                    ? IconButton(
                        onPressed: () async {
                          profilePicture = await profilePicturePicker.pickImage(
                              source: ImageSource.gallery);
                          setState(() {
                            if (profilePicture != null)
                              profilePictureUploaded = true;
                          });
                        },
                        icon: const Icon(Icons.add_a_photo),
                        color: purple1,
                      )
                        .box
                        .roundedFull
                        .size(100, 100)
                        .border(color: purple1, width: 2)
                        .make()
                    : CircleAvatar(
                        backgroundImage: FileImage(File(profilePicture!.path)),
                        radius: context.height * 0.08,
                      ),
                15.heightBox,
                profilePictureUploaded == false
                    ? "Upload Image".text.fontFamily(poppins).make()
                    : MyButton(
                        height: 30,
                        width: context.width * 0.33,
                        name: "Cancel Image",
                        whenPressed: () {
                          setState(() {
                            profilePictureUploaded = false;
                            profilePicture = null;
                          });
                        }),
                Column(
                  children: [
                    CustomTextField(
                        title: 'Username',
                        hint: 'Choose your username',
                        textController: _userNameContoller),
                    CustomTextField(
                        title: 'Phone Number',
                        hint: 'Enter your phone number',
                        textController: _phoneNumberController),
                    CustomTextField(
                        title: 'City',
                        hint: 'Enter your city',
                        textController: _cityNameController),
                  ],
                ).box.rounded.padding(EdgeInsets.all(19)).make(),
                20.heightBox,
                isLoading
                    ? CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(redColor),
                      )
                    : MyButton(
                        name: 'Finish Sign up',
                        width: context.width - 70,
                        whenPressed: () async {
                          setState(() {
                            isLoading = true;
                          });

                          await signUp(context);
                          if (profilePicture != null) {
                            profilePictureUploaded = true;
                          }

                          try {
                            firebase_storage.Reference ref =
                                firebase_storage.FirebaseStorage.instance.ref(
                                    '/userDp/${FirebaseAuth.instance.currentUser!.uid}');
                            firebase_storage.UploadTask uploadTask =
                                ref.putFile(File(profilePicture!.path));

                            await Future.value(uploadTask);
                            ref.getDownloadURL().then((String url) {
                              setState(() {
                                userPhotoUrl = url;
                                addUserDetails();
                              });
                            });
                            Get.to(() => LoginScreen());
                          } catch (e) {
                            VxToast.show(context, msg: e.toString());

                            setState(() {
                              isLoading = false;
                            });
                          }

                          setState(() {
                            isLoading = false;
                          });
                          Get.to(() => LoginScreen());
                        })
              ],
            ),
          ),
        )),
      ),
    );
  }
}
