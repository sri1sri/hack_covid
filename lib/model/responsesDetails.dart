import 'package:cloud_firestore/cloud_firestore.dart';
class ResponseDetails{
  ResponseDetails({
    this.userID,
    this.rating,
    this.empty,

  });

  final String userID;
  final int rating;

  final Null empty;



  factory ResponseDetails.fromMap(Map<String, dynamic> data, String documentID){
    if(data == null){
      return null;
    }
    final String responseID = documentID;

    final String userID = data['userID'];
    final int rating = data['rating'];

    final Null empty = data['empty'];


    return ResponseDetails(
      userID: userID,
      rating: rating,

      empty: empty,
    );
  }

  Map<String, dynamic> toMap(){
    return {
      userID != null ? 'userID': 'empty' : userID,
      rating != null ? 'rating':'empty' :  rating,
    };
  }
}