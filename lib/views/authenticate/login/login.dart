import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flowinsurance/constants/images.dart';
import 'package:flowinsurance/constants/strings.dart';
import 'package:flowinsurance/constants/styles.dart';
import 'package:flowinsurance/views/accueil/accueil.dart';
import 'package:flowinsurance/views/authenticate/register/create_successful.dart';
import 'package:flowinsurance/views/diagnostic/debut_diagnostic.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController optController = TextEditingController();
  TextEditingController numeroController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  bool otpVisibility = false;
  User? user;
  String verificationID = "";

  @override
  void initState() {
    optController = TextEditingController();
    numeroController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    optController.dispose();
    numeroController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const AccueilPage()));
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
              ),
              Center(child: Image.asset('assets/${ImageData.logo}')),
              Center(
                child: Text(StringData.appName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Color(0xff185182), //#6FAFB7
                    )),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.only(left: size.width * 0.08, bottom: 15),
                child: Text(
                  StringData.numDeTelephone,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
                child: TextFormField(
                  obscureText: false,
                  
                  autofocus: false,
                  decoration: InputDecoration(
                    
                    prefixIcon: Container(
                      height: 27,
                      width: 29,
                      margin: const EdgeInsets.only(right: 20, left: 7),
                      padding: const EdgeInsets.only(right: 5),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            "assets/${ImageData.logoBenin}",
                          ),
                        ),
                        //border: Border.all(color: Colors.grey)
                      ),
                    ),
                    //labelText: StringData.numDeTelephone,
                    enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      // borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    errorBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                    focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                    hintText: "96058266",
                    contentPadding: const EdgeInsets.all(20),
                    focusedErrorBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                  ),
                  cursorColor: Colors.black,
                  controller: numeroController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return StringData.numDeTelephonePlease;
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Visibility(
                visible: otpVisibility,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: size.width * 0.08, bottom: 15),
                      child: Text(
                        StringData.motDePasse,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
                      child: TextFormField(
                        obscureText: true,
                        autofocus: false,
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            // borderRadius: BorderRadius.all(Radius.circular(50)),
                          ),
                          errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                          //hintText: StringData.motDePasse,
                          contentPadding: EdgeInsets.all(20),
                          focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                        ),
                        cursorColor: Colors.black,
                        controller: optController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return StringData.motDePassePlease;
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 10, right: 10.0),
                width: size.width,
                child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    StringData.motDePasseOublie,
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                      decoration: TextDecoration.underline,
                      color: Color(0xff6FAFB7), //#6FAFB7
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height / 7,
              ),
              Center(
                child: ElevatedButton(
                    style: ButtonStyle1(size.width * 0.8),
                    onPressed: () {
                      // if (otpVisibility) {
                      //   verifyOTP();
                      // } else {
                      //   loginWithPhone();
                      // }

                      // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AccueilDiagnostic()));
                    },
                    child: Text(
                      otpVisibility ? "Verify" : "Login",
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    )),
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> verifiyAppUser() async {
    final ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child("/${numeroController.text}").get();
    if (snapshot.exists) {
      print(snapshot.value);
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AccueilDiagnostic()));
    } else {
      Fluttertoast();
    }
  }
  // void loginWithPhone() async {
  //   auth.verifyPhoneNumber(
  //     phoneNumber: "+229" + numeroController.text ,
  //     verificationCompleted: (PhoneAuthCredential credential) async {
  //       await auth.signInWithCredential(credential).then((value) {
  //         print("You are logged in successfully");
  //       });
  //     },
  //     verificationFailed: (FirebaseAuthException e) {
  //       print(e.message);
  //     },
  //     codeSent: (String verificationId, int? resendToken) {
  //       otpVisibility = true;
  //       verificationID = verificationId;
  //       setState(() {});
  //     },
  //     codeAutoRetrievalTimeout: (String verificationId) {},
  //   );
  // }

  // void verifyOTP() async {
  //   PhoneAuthCredential credential = PhoneAuthProvider.credential(
  //       verificationId: verificationID, smsCode: optController.text);

  //   await auth.signInWithCredential(credential).then(
  //     (value) {
  //       setState(() {
  //         user = FirebaseAuth.instance.currentUser;
  //       });
  //     },
  //   ).whenComplete(
  //     () {
  //       if (user != null) {
  //         Fluttertoast.showToast(
  //           msg: "You are logged in successfully",
  //           toastLength: Toast.LENGTH_SHORT,
  //           gravity: ToastGravity.BOTTOM,
  //           timeInSecForIosWeb: 1,
  //           backgroundColor: Colors.red,
  //           textColor: Colors.white,
  //           fontSize: 16.0,
  //         );
  //         Navigator.pushReplacement(
  //           context,
  //           MaterialPageRoute(
  //             builder: (context) => const AccueilDiagnostic(),
  //           ),
  //         );
  //       } else {
  //         Fluttertoast.showToast(
  //           msg: "your login is failed",
  //           toastLength: Toast.LENGTH_SHORT,
  //           gravity: ToastGravity.BOTTOM,
  //           timeInSecForIosWeb: 1,
  //           backgroundColor: Colors.red,
  //           textColor: Colors.white,
  //           fontSize: 16.0,
  //         );
  //       }
  //     },
  //   );
  // }
}
