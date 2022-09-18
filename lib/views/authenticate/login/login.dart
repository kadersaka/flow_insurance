import 'package:flowinsurance/constants/images.dart';
import 'package:flowinsurance/constants/strings.dart';
import 'package:flowinsurance/constants/styles.dart';
import 'package:flowinsurance/models/user.dart';
import 'package:flowinsurance/services/realtime_database.dart';
import 'package:flowinsurance/views/accueil/accueil.dart';
import 'package:flowinsurance/views/diagnostic/debut_diagnostic.dart';
import 'package:flutter/material.dart';
import 'package:prefs/prefs.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController mdpController = TextEditingController();
  TextEditingController numeroController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  // FirebaseAuth auth = FirebaseAuth.instance;
  @override
  void dispose() {
    mdpController.dispose();
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
                    // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const AccueilPage()));
                    Navigator.of(context).pop();
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
                      color: Color(0xff185182),
                    )),
              ),
              const SizedBox(
                height: 30,
              ),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                        keyboardType: TextInputType.phone,
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
                          hintText: "Numero de telephone",
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
                          focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                        ),
                        cursorColor: Colors.black,
                        controller: mdpController,
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
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        isLoading = true;
                      });
                      await DataBaseService().login(numeroController.text, mdpController.text).then((value) {
                        if (value is AppUser) {
                          _showToast("Vous êtes connecté avec succès !!!");
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const AccueilDiagnostic()), (route) => false);
                        } else {
                          _showToast("Connection echouée. \n Veuillez verifier votre mot de passe");
                        }
                      });
                    }
                  },
                  child: !isLoading
                      ? Text(
                          StringData.seConnecter,
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        )
                      : const CircularProgressIndicator(
                          color: Colors.white,
                        ),
                ),
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

  Future<void> _showToast(String text) async {
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.blue,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
