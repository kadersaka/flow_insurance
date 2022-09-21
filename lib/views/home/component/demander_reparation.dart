import 'package:flowinsurance/constants/strings.dart';
import 'package:flowinsurance/views/customwidget/boutton.dart';
import 'package:flowinsurance/views/home/component/details_assurance.dart';
import 'package:flutter/material.dart';

class DemanderReparation extends StatefulWidget {
  const DemanderReparation({super.key});

  @override
  State<DemanderReparation> createState() => _DemanderReparationState();
}

class _DemanderReparationState extends State<DemanderReparation> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(onPressed: () => Navigator.of(context).pop(), icon: const Icon(Icons.arrow_back)),
          Center(
            child: CustomWidget().myText(
              StringData.demander,
              isbols: true,
              size: 18,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          // Container(
          //   height: 300,
          //   width: double.infinity,
          //   margin: const EdgeInsets.all(8),
          //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 1, blurStyle: BlurStyle.outer)]),
          //   child: Padding(
          //     padding: const EdgeInsets.all(10.0),
          //     child: CustomWidget().myText(StringData.faireDemande, size: 15),
          //   ),
          // ),
          Container(
            height: 200,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            // margin: const EdgeInsets.only(bottom: 8),
            child: TextFormField(
              maxLines: 10,
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                // focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                //hintText: StringData.motDePasse,
                contentPadding: EdgeInsets.all(15),
                focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
              ),
              cursorColor: Colors.black,
              controller: controller,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Renseignez un motif";
                }
                return null;
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.cloud_upload,
                    color: Color(0xffD3E12B),
                  ),
                ),
                CustomWidget().myText(StringData.uploader, size: 15, color: Colors.grey)
              ],
            ),
          ),

          Center(child: Container(margin: EdgeInsets.only(top: !isKeyboard ? 150 : 19), child: CustomWidget().mybutton(size, StringData.submit, () {}))),
          const SizedBox(height: 15)
        ],
      )),
    );
  }
}
