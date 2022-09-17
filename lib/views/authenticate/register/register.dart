import 'package:flowinsurance/constants/images.dart';
import 'package:flowinsurance/constants/strings.dart';
import 'package:flowinsurance/models/user.dart';
import 'package:flowinsurance/views/accueil/accueil.dart';
import 'package:flowinsurance/views/authenticate/register/create_successful.dart';
import 'package:flowinsurance/views/customwidget/boutton.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController numeroController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  TextEditingController nomController = TextEditingController();
  TextEditingController prenomController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isVisible = false;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    passwordConfirmController.dispose();
    passwordController.dispose();
    numeroController.dispose();
    nomController.dispose();
    prenomController.dispose();
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
                padding: const EdgeInsets.all(5.0),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const AccueilPage()));
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
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(StringData.senregistrer,
                      style: const TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 25,
                        color: Colors.black, //#6FAFB7
                      )),
                ),
              ),
              SizedBox(
                height: size.height / 15,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      inputWidget(StringData.votreNom, nomController, size,
                          errorText: StringData.errorTextNom),
                      inputWidget(
                          StringData.votrePrenom, prenomController, size,
                          errorText: StringData.errorTextPrenom),
                      inputWidget(
                          StringData.numTelephone, numeroController, size,
                          errorText: StringData.errorTextnum,
                          type: TextInputType.phone),
                      inputWidget(
                          StringData.motDePasse, passwordController, size,
                          isObscure: true,
                          errorText: StringData.errorTextpassword),
                      inputWidget(StringData.confirmerMotDePasse,
                          passwordConfirmController, size,
                          isObscure: true),
                      Visibility(
                        visible: isVisible,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: size.width * 0.08, bottom: 10),
                          child: CustomWidget().myText(
                              "Mot de passe non conforme !",
                              color: Colors.red,
                              size: 14),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Center(
                          child: CustomWidget().mybutton(
                        size,
                        StringData.continuer,
                        () {
                          if (_formKey.currentState!.validate()) {
                            if (passwordController.text ==
                                passwordConfirmController.text) {
                              setState(() {
                                isLoading = true;
                              });
                              AppUser newUser = AppUser(
                                  nomController.text,
                                  prenomController.text,
                                  numeroController.text,
                                  passwordController.text);
                              setState(() {
                                isVisible = false;
                              });

                              newUser.addToDataBase().then((value) {
                                setState(() {
                                  isLoading = false;
                                });

                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const CreateSuccessfull()));
                              });
                            } else {
                              setState(() {
                                isVisible = true;
                              });
                            }
                          }
                        },
                        withLoading: true,
                        child: isLoading
                            ? const CircularProgressIndicator(color: Colors.white,)
                            : CustomWidget().myText(StringData.continuer,
                                size: 16, isbols: true, color: Colors.white),
                      )),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget inputWidget(
      String headText, TextEditingController controller, Size size,
      {bool isObscure = false,
      TextInputType type = TextInputType.text,
      String errorText = "Veuillez remplir ce champ !"}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.only(left: size.width * 0.08, bottom: 10),
          child: Text(
            headText,
            textAlign: TextAlign.start,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: 43,
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.08,
          ),
          margin: const EdgeInsets.only(bottom: 14),
          child: TextFormField(
            keyboardType: type,
            obscureText: isObscure,
            autofocus: false,
            decoration: const InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue)),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                // borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              errorBorder:
                  OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue)),
              //hintText: StringData.motDePasse,
              contentPadding: EdgeInsets.all(20),
              focusedErrorBorder:
                  OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
            ),
            cursorColor: Colors.black,
            controller: controller,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return errorText;
              }
              return null;
            },
          ),
        ),
        const SizedBox(
          height: 5,
        )
      ],
    );
  }
}
