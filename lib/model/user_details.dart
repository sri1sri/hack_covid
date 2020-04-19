import 'package:cloud_firestore/cloud_firestore.dart';
class UserDetails{
  UserDetails({
    this.username,
    this.phoneNumber,
    this.dateOfBirth,
    this.gender,
    this.joinedDate,
    this.userID,
    this.aadharCard,
    this.panCard,
    this.emailID,
    this.drivingLicenseNumber,
    this.drivingLicenseYear,
    this.empty,

  });

  final String username;
  final String phoneNumber;
  final String gender;
  final Timestamp dateOfBirth;
  final Timestamp joinedDate;
  final String userID;
  final String emailID;
  final String aadharCard;
  final String panCard;
  final String drivingLicenseNumber;
  final String drivingLicenseYear;

  final Null empty;



  factory UserDetails.fromMap(Map<String, dynamic> data, String documentID){
    if(data == null){
      return null;
    }
    final String userID = documentID;

    final String username = data['user_name'];
    final String phoneNumber = data['user_contact_number'];
    final String gender = data['user_gender'];
    final Timestamp dateOfBirth = data['user_date_of_birth'];
    final Timestamp joinedDate = data['user_join_date'];
    final String emailID = data['user_email_id'];
    final String aadharCard = data['user_aadhar_card'];
    final String panCard = data['user_pan_card'];
    final String drivingLicenseNumber = data['driving_license_number'];
    final String drivingLicenseYear = data['driving_license_year'];
    final Null empty = data['empty'];


    return UserDetails(
      username: username,
      phoneNumber: phoneNumber,
      gender: gender,
      dateOfBirth: dateOfBirth,
      joinedDate: joinedDate,
      userID: userID,
      emailID: emailID,
      aadharCard:aadharCard,
      panCard:panCard,
      drivingLicenseYear:drivingLicenseYear,
      drivingLicenseNumber:drivingLicenseNumber,
      empty: empty,


    );
  }

  Map<String, dynamic> toMap(){
    return {
      username != null ? 'user_name': 'empty' : username,
      phoneNumber != null ? 'user_contact_number':'empty' :  phoneNumber,
      gender != null ? 'user_gender': 'empty' : gender,
      dateOfBirth != null ? 'user_date_of_birth': 'empty' : dateOfBirth,
      joinedDate != null ? 'user_join_date': 'empty' : joinedDate,
      emailID != null ? 'user_email_id':'empty' :  emailID,
      aadharCard != null ? 'user_aadhar_card':'empty' :  aadharCard,
      panCard != null ? 'user_pan_card':'empty' :  panCard,
      drivingLicenseYear != null ? 'driving_license_year':'empty' :  drivingLicenseYear,
      drivingLicenseNumber != null ? 'driving_license_number':'empty' :  drivingLicenseNumber,


    };
  }

}