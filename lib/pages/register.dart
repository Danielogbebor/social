// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

import '../individualwidgets.dart';

// loggin
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late TextEditingController countryNameController;
  late TextEditingController countryCodeController;
  late TextEditingController phoneNumberController;

  @override
  void initState() {
    countryNameController = TextEditingController();
    countryCodeController = TextEditingController();
    phoneNumberController = TextEditingController();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    countryNameController.dispose();
    countryCodeController.dispose();
    phoneNumberController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  // show country picker
  showCountryCodePicker() {
    showCountryPicker(
        context: context,
        favorite: ['GB'],
        showPhoneCode: true,

        //
        countryListTheme: CountryListThemeData(
          flagSize: 25,
          backgroundColor: Colors.grey,
          textStyle: const TextStyle(fontSize: 16, color: Colors.black),
          //  Country list modal height
          bottomSheetHeight: 500,

          // Sets the border radius for the bottomsheet.
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          // Styles the search field.
          inputDecoration: InputDecoration(
              labelText: 'Search',
              labelStyle: const TextStyle(color: Colors.black),
              hintText: 'Start typing to search',
              prefixIcon: const Icon(Icons.search),
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                    // color: Color.fromARGB(255, 255, 25, 25).withOpacity(0.2),
                    ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black.withOpacity(0.2),
                ),
              )),
        ),
        onSelect: (Country country) {
          countryNameController.text = country.name;
          countryCodeController.text = country.phoneCode;
        });
  }

  void sendConfirmationCode() {
    final phone = phoneNumberController.text;
    if (phone.isEmpty) {
      return showAlertDialog(
          context: context, message: "Please proovide a valid phone number");
    } else if (phone.length < 9) {
      return showAlertDialog(
          context: context, message: "Please proovide a valid phone number");
    } else if (phone.length > 10) {
      return showAlertDialog(
          context: context, message: "Please proovide a valid phone number");
    }

    // final name = countryNameController.text;
    // final code = countryCodeController.text;
    //
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey,
        title: const Text(
          "Enter Phone Number",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          MyIcon(
            onPressed: () {
              print("object");
            },
            iconColor: Colors.black,
            icon: const Icon(Icons.more_vert),
          )
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
            ),
            child: RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                  text: "Social will need to verify  your phone number.\n",
                  style: TextStyle(color: Colors.black, height: 1.5),
                  children: [
                    TextSpan(
                        text: "What's my number?",
                        style: TextStyle(color: Colors.white)),
                  ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 70, left: 70),
            child: MyTextfield(
              onTap: showCountryCodePicker,
              prefix: const Icon(Icons.language),
              readOnly: true,
              suffixIcon: const Icon(Icons.arrow_drop_down),
              controller: countryNameController,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 70, right: 70),
            child: Row(
              children: [
                SizedBox(
                  width: 60,
                  child: MyTextfield(
                    hintText: "Code",
                    keyboardType: TextInputType.number,
                    onTap: showCountryCodePicker,
                    controller: countryCodeController,
                    prefixText: "+",
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: MyTextfield(
                    controller: phoneNumberController,
                    hintText: "Phone Number",
                    keyboardType: TextInputType.phone,
                    textAlign: TextAlign.start,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 30),
          const Text("Carrier charges may apply"),
          const SizedBox(height: 80),
          OutlinedButton(
            onPressed: sendConfirmationCode,
            child: const Text(
              "Next",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2),
            ),
          ),
        ],
      ),
    );
  }
}

class MyIcon extends StatelessWidget {
  final Widget icon;
  final void Function()? onPressed;
  final Color? iconColor;

  const MyIcon({
    Key? key,
    this.onPressed,
    required this.icon,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: icon,
      color: iconColor,
    );
  }
}
