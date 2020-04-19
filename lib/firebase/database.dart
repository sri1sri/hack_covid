
import 'package:flutter/material.dart';
import 'package:hackcovid/HomeScreens/viewPolicyDetails/policy_details.dart';
import 'package:hackcovid/model/premium_details.dart';
import 'package:hackcovid/model/responsesDetails.dart';
import 'package:hackcovid/model/user_details.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

import 'api_path.dart';
import 'firestore_service.dart';

abstract class Database{

  Stream<UserDetails> readUser(String userID);
  Future<void> setPremiumDetails(PremiumDetails premiumDetails);
  Future<void> setResonse(ResponseDetails responseDetails);
  Stream<List<ResponseDetails>> readResponses();


}

class FirestoreDatabase implements Database {

  FirestoreDatabase({@required this.uid}) : assert (uid != null);
  final String uid;

  final _service = FirestoreService.instance;

  @override
  Stream<UserDetails> readUser(String userID) => _service.documentStream(
    path: APIPath.userDetails(userID),
    builder: (data, documentId) => UserDetails.fromMap(data, documentId),
  );

  @override
  Future<void> setPremiumDetails(PremiumDetails premiumDetails) async => await _service.setData(
    path: APIPath.policies(DateTime.now().toString()),
    data: premiumDetails.toMap(),
  );

  @override
  Future<void> setResonse(ResponseDetails responseDetails) async => await _service.setData(
    path: APIPath.responses(DateTime.now().toString()),
    data: responseDetails.toMap(),
  );

  @override
  Stream<List<ResponseDetails>> readResponses() => _service.collectionStream(
    path: APIPath.responsesList(),
    builder: (data, documentId) => ResponseDetails.fromMap(data, documentId),
  );
}