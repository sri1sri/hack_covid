import 'package:cloud_firestore/cloud_firestore.dart';
class PremiumDetails{
  PremiumDetails({
    this.policyID,
    this.ownerName,
    this.ownerEmail,
    this.ownerPhoneNumber,
    this.panCard,
    this.landmark,
    this.nomineeName,
    this.address,
    this.city,
    this.state,
    this.pincode,
    this.carRegNumber,
    this.preInsurerName,
    this.prePolicyNumber,
    this.carEnginNumber,
    this.carChassisNumber,
    this.premiumPrice,
    this.userID,
    this.empty,

  });

  final String policyID;
  final String ownerName;
  final String ownerEmail;
  final String ownerPhoneNumber;
  final String panCard;
  final String landmark;

  final String nomineeName;

  final String address;
  final String city;
  final String state;
  final String pincode;

  final String carRegNumber;
  final String preInsurerName;
  final String prePolicyNumber;
  final String carEnginNumber;
  final String carChassisNumber;

  final String premiumPrice;

  final String userID;

  final Null empty;



  factory PremiumDetails.fromMap(Map<String, dynamic> data, String documentID){
    if(data == null){
      return null;
    }
    final String policyID = documentID;

    final String ownerName = data['ownerName'];
    final String ownerEmail = data['ownerEmail'];
    final String ownerPhoneNumber = data['ownerPhoneNumber'];
    final String panCard = data['panCard'];
    final String landmark = data['landmark'];

    final String nomineeName = data['nomineeName'];

    final String address = data['address'];
    final String city = data['city'];
    final String state = data['state'];
    final String pincode = data['pincode'];

    final String carRegNumber = data['carRegNumber'];
    final String preInsurerName = data['preInsurerName'];
    final String prePolicyNumber = data['prePolicyNumber'];
    final String carEnginNumber = data['carEnginNumber'];
    final String carChassisNumber = data['user_name'];
    final String premiumPrice = data['premiumPrice'];
    final String userID = data['userID'];

    final Null empty = data['empty'];


    return PremiumDetails(
      ownerName: ownerName,
      ownerEmail: ownerEmail,
      ownerPhoneNumber: ownerPhoneNumber,
      panCard: panCard,
      landmark: landmark,
      nomineeName: nomineeName,
      address: address,
      city:city,
      state:state,
      pincode:pincode,
      carRegNumber:carRegNumber,
      preInsurerName:preInsurerName,
      prePolicyNumber:prePolicyNumber,
      carEnginNumber:carEnginNumber,
      carChassisNumber: carChassisNumber,
      premiumPrice:premiumPrice,
      userID:userID,
      empty: empty,


    );
  }

  Map<String, dynamic> toMap(){
    return {
      ownerName != null ? 'ownerName': 'empty' : ownerName,
      ownerEmail != null ? 'ownerEmail':'empty' :  ownerEmail,
      ownerPhoneNumber != null ? 'ownerPhoneNumber': 'empty' : ownerPhoneNumber,
      panCard != null ? 'panCard': 'empty' : panCard,
      landmark != null ? 'landmark': 'empty' : landmark,
      nomineeName != null ? 'nomineeName':'empty' :  nomineeName,
      address != null ? 'address':'empty' :  address,
      city != null ? 'city':'empty' :  city,
      state != null ? 'state':'empty' :  state,
      pincode != null ? 'pincode':'empty' :  pincode,
      carRegNumber != null ? 'carRegNumber':'empty' :  carRegNumber,
      preInsurerName != null ? 'preInsurerName':'empty' :  preInsurerName,
      prePolicyNumber != null ? 'prePolicyName':'empty' :  prePolicyNumber,
      carEnginNumber != null ? 'carEnginNumber':'empty' :  carEnginNumber,
      carChassisNumber != null ? 'carChassisNumber':'empty' :  carChassisNumber,
      premiumPrice != null ? 'premiumPrice':'empty' :  premiumPrice,
      userID != null ? 'userID':'empty' :  userID,

    };
  }

}