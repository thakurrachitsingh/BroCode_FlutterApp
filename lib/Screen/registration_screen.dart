import 'package:BroCode_FlutterApp/Page/phone_verification_page.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dialog.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  Country _selectedFilteredDialogCountry =
      CountryPickerUtils.getCountryByPhoneCode("91");
  String _countryCode = "+91";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text("              "),
                  Text(
                    "Verify your phone Number",
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                  Text("        "),
                  Icon(Icons.more_vert),
                ],
              ),
              SizedBox(height: 30.0),
              Text(
                "Whatsapp will send an SMS message to verify your phone number. Enter your country Code and phone number",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 30.0),
              ListTile(
                onTap: _openFilteredCountryPickerDialog,
                title: _buildDialogItem(_selectedFilteredDialogCountry),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.0),
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 40,
                      height: 42,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 1.50, color: Colors.green),
                        ),
                      ),
                      child: Text(
                        "${_selectedFilteredDialogCountry.phoneCode}",
                        style: TextStyle(fontSize: 15.0),
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: Container(
                        height: 42.0,
                        child: TextField(
                          onTap: () {},
                          decoration: InputDecoration(
                            hintText: "Phone Number",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: MaterialButton(
                      color: Colors.green,
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return PhoneVerificationPage();
                          },
                        ));
                      },
                      child: Text("Next",
                          style:
                              TextStyle(fontSize: 18.0, color: Colors.white))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _openFilteredCountryPickerDialog() {
    showDialog(
      context: context,
      builder: (_) => Theme(
        data: Theme.of(context).copyWith(
          primaryColor: Colors.white,
        ),
        child: CountryPickerDialog(
          titlePadding: EdgeInsets.all(8.0),
          searchCursorColor: Colors.black,
          searchInputDecoration: InputDecoration(
            hintText: "Search",
          ),
          isSearchable: true,
          title: Text("Select your phone code"),
          onValuePicked: (Country country) {
            _selectedFilteredDialogCountry = country;
            _countryCode = country.phoneCode;
          },
          itemBuilder: _buildDialogItem,
        ),
      ),
    );
  }

  _buildDialogItem(Country country) {
    return Container(
        height: 40.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border:
                Border(bottom: BorderSide(color: Colors.green, width: 1.0))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CountryPickerUtils.getDefaultFlagImage(country),
            SizedBox(
              width: 10.0,
            ),
            Text("+${country.phoneCode}", style: TextStyle(fontSize: 13.0)),
            SizedBox(width: 4.0),
            Text("${country.name}", style: TextStyle(fontSize: 13.0)),
            Spacer(),
            Icon(Icons.arrow_drop_down),
          ],
        ));
  }
}
