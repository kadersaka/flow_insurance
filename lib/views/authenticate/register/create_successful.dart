import 'package:flowinsurance/constants/images.dart';
import 'package:flowinsurance/constants/strings.dart';
import 'package:flowinsurance/views/diagnostic/debut_diagnostic.dart';
import 'package:flutter/material.dart';

class CreateSuccessfull extends StatefulWidget {
  const CreateSuccessfull({super.key});

  @override
  State<CreateSuccessfull> createState() => _CreateSuccessfullState();
}

class _CreateSuccessfullState extends State<CreateSuccessfull> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          children: [
            Center(child: Image.asset('assets/${ImageData.logo}')),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(StringData.bravo,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: Color(0xff185182), //#6FAFB7
                  )),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 7,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.95,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(StringData.diagnostiquerTel,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        )),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 8, top: 12, bottom: 12),
                    child: Text(StringData.pourVerifier,
                        style: const TextStyle(
                          //fontWeight: FontWeight.bold,
                          fontSize: 15,
                        )),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: TextButton(
                          onPressed: () {
                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: (context) =>
                            //         const CreateSuccessfull()));
                            _showMyDialog();
                          },
                          child: Text(StringData.commencerDiagnostic,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                decoration: TextDecoration.underline,
                                color: Color(0xff185182),
                              )),
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward,
                        color: Color(0xff185182),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        )),
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          //title: const Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Center(child: Image.asset('assets/${ImageData.logo}')),
                Padding(
                  padding: const EdgeInsets.only(bottom: 35.0),
                  child: Text(
                    StringData.approuveDiagnostic,
                    textAlign: TextAlign.center,
                  ),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      minimumSize:
                          Size(MediaQuery.of(context).size.width * 0.8, 43),
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: const BorderSide(color: Colors.black, width: 1),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const AccueilDiagnostic()));
                    },
                    child: Text(
                      StringData.autoriserIdentification,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    )),
              ],
            ),
          ),
        );
      },
    );
  }
}
