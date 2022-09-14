import 'package:flowinsurance/constants/images.dart';
import 'package:flowinsurance/constants/strings.dart';
import 'package:flowinsurance/views/accueil/accueil.dart';
import 'package:flowinsurance/views/authenticate/register/create_successful.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController numeroController = TextEditingController();

  @override
  void initState() {
    passwordController = TextEditingController();
    numeroController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    passwordController.dispose();
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
                  obscureText: true,
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
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      // borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    errorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red)),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                    hintText: "96058266",
                    contentPadding: const EdgeInsets.all(20),
                    focusedErrorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red)),
                  ),
                  cursorColor: Colors.black,
                  controller: passwordController,
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
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      // borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                    //hintText: StringData.motDePasse,
                    contentPadding: EdgeInsets.all(20),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red)),
                  ),
                  cursorColor: Colors.black,
                  controller: passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return StringData.motDePassePlease;
                    }
                    return null;
                  },
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
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      minimumSize: Size(size.width * 0.8, 43),
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: const BorderSide(color: Colors.black, width: 1),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const CreateSuccessfull()));
                    },
                    child: Text(
                      StringData.seConnecter,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
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
}
