import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sanlater/authentication_screen/login_screen.dart';
import 'package:sanlater/component/custom_button.dart';
import 'package:sanlater/util.dart/colors.dart';
import 'package:sanlater/util.dart/text_styles.dart';
class PersonalInformationScreen extends StatefulWidget {
  static const id = 'personal_information_screen';

  @override
  _PersonalInformationScreenState createState() => _PersonalInformationScreenState();
}

class _PersonalInformationScreenState extends State<PersonalInformationScreen> {
  final _phoneController = TextEditingController();
  final _ageController = TextEditingController();
  final _genderController = TextEditingController();
  final _occupationController = TextEditingController();
  final _nationController = TextEditingController();
  final _residentController = TextEditingController();
  final _homeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool _validate  = false;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left:10.0),
          child: RoundedBackButton(
            onTap: ()=>Navigator.pop(context  ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text('Personal Information', style: sizeTwentyEightBoldBlack,),
                // Material(
                //   elevation: 1,
                //   child: CircleAvatar(
                //     child: Text('0%', style: sizeFourteenLightBlack,),
                //   ),
                // )
              ],
            ),
            Expanded(
              child: Container(
                child: ListView(
                  children: [
                    PersonalTextField(hintText: 'Phone number', controller: _phoneController,validate: _validate,),
                    PersonalTextField(hintText: 'Age',controller: _ageController,validate: _validate,),
                    PersonalTextField(hintText: 'Gender',controller: _genderController,validate: _validate,),
                    PersonalTextField(hintText: 'Occupation',controller: _occupationController,validate: _validate,),
                    PersonalTextField(hintText: 'Nationality',controller:_nationController,validate: _validate,),
                    PersonalTextField(hintText: 'State of Residence',controller: _residentController,validate: _validate,),
                    PersonalTextField(hintText: 'Home address',controller: _homeController,validate: _validate,),
                  ],
                ),
              ),
            ),
            CustomButton(
              title: 'Proceed',
              isIcon: false,
              titleStyle: sizeEighteenBoldWhite,
              buttonColor: App.appPrimary,
            multiplyingFactor: 1,
              onPressed: (){
                setState(() {
                  _phoneController.text.isEmpty?_validate=true:_validate=false;
                });
              },
              buttonShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            )
          ],
        ),
      ),
    );
  }
}


class PersonalTextField extends StatelessWidget {

final String hintText;
final TextEditingController controller;
final bool validate;

  PersonalTextField({
    required this.hintText,
    required this.controller,
    this.validate = false,
  });

  @override
  Widget build(BuildContext context) {
    String validateText(value){
      if(value==null){
        return 'This field can\'t be empty';
      }
      else{
        return '';
      }
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(hintText, style: sizeFourteenLightBlack,),
          Card(
            elevation: 2,
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                errorText: validate?'this field can\'t be empty':null,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                hintText: hintText,
                hintStyle: sizeEighteenLightGrey,
                fillColor: Colors.white,
              ),
              validator: (value)=>validateText(value),
            ),
          ),
        ],
      ),
    );

  }

}


