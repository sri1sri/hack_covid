import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contact/contacts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

void GoToPage(BuildContext context, Widget page) {
  Navigator.of(context).push(
    MaterialPageRoute<void>(
      fullscreenDialog: true,
      builder: (context) => page,
    ),
  );
}
String USER_ID;
String FIREBASE_STORAGE_URL = 'gs://knowitmaster.appspot.com';
ImageSource IMAGE_SOURCE = ImageSource.gallery;

String getDateTime(int timestamp) {
  var format = new DateFormat('dd MMM yyyy, hh:mm a');
  var date = new DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  return format.format(date);
}

String getDate(int timestamp) {
  var format = new DateFormat('dd MMMM, yyyy');
  var date = new DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  return format.format(date);
}

String getTime(int timestamp) {
  var format = new DateFormat('hh:mm a');
  var date = new DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);

  return timestamp == 0 ? '--' : format.format(date);
}

List<String> CONTACT_NUMBERS = new List();

  getAllContacts() async {
  await Contacts.streamContacts().forEach((contact) {
    contact.phones.forEach((phone){
      String spaceRmoved = phone.value.replaceAll(" ", "");
      String con = spaceRmoved.replaceAll("-", "");
      if(con.length>10){
        String onlycon = con.replaceAll(new RegExp(r'[^\w\s]+'),'');

        if(!CONTACT_NUMBERS.contains(onlycon)){
          CONTACT_NUMBERS.add(onlycon);
        }
      }
    });

  }).whenComplete((){
    return CONTACT_NUMBERS;
//      print('contacts ${ContactNumber}');
//      setState(() {
//
//      });
  });
}


