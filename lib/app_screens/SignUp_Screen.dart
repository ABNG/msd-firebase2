import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_msd_app/firebase_auth/firebase_authentication.dart';
import 'package:flutter_msd_app/reusable_widget/reusable_textfield.dart';
import 'package:flutter_msd_app/utils/SizeConfig.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController confirm = TextEditingController();
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/main_image.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: SizeConfig.screenHeight),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    ReusableTextField(
                      text: "NAME",
                      icon: Icons.person_outline,
                      main: false,
                      controller: name,
                    ),
                    ReusableTextField(
                      text: "E-MAIL",
                      icon: CupertinoIcons.mail,
                      main: false,
                      controller: email,
                    ),
                    ReusableTextField(
                      text: "PASSWORD",
                      icon: Icons.lock_open,
                      main: false,
                      controller: password,
                      showObsecure: true,
                    ),
                    ReusableTextField(
                      text: "CONFIRM PASSWORD",
                      icon: Icons.lock_outline,
                      main: false,
                      controller: confirm,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.screenWidth * 0.08),
                      child: MaterialButton(
                        onPressed: () async {
                          bool value = await FirebaseAuths()
                              .createUserWithEmailAndPassword(
                                  email.text, password.text);
                          print(value);
                          Map<String, String> senData = {
                            "email": email.text,
                            "password": password.text
                          };
                          if (value) Navigator.pop(context, senData);
                        },
                        color: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          "REGISTER",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SafeArea(
              child: Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
