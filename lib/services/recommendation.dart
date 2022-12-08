/* import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:math';
import './services.dart';

class RecommendationService {
  DatabaseService _db = DatabaseService();
  UserService _user = UserService();

  Future<double> getLikeness(targetId, placeId) async {
    // Obtenemos Id del usuario primario.
    FirebaseUser user = await _user.getUser;
    String userId = user.uid;

    /* if(userId == targetId){
      return 0;
    } */
    //Obtenemos data general del usario referencia.
    DocumentSnapshot _targetUserData = await _db.getUserData(targetId);
    Map<dynamic, dynamic> _targetScores = _targetUserData.data['scores'];
    //Obtenemos data de usuario primario.
    DocumentSnapshot _userData = await _db.getUserData(userId);
    Map<dynamic, dynamic> _userScores = _userData.data['scores'];
    // Se crea objeto para comparar coincidencias
    Map _existp1p2 = {};

    // Se crean placeholders para el algo.
    double p1Sum = 0, p2Sum = 0, p1SqSum = 0, p2SqSum = 0, prodP1P2 = 0;

    _userScores.forEach((key, dynamic value) {
      if (key == placeId) {
        print(
            '[[[[[[[[[[[[[[[[[[[[[[[[user has rated place with: $value for placeId $placeId]]]]]]]]]]]]]]]]]]]]]]]]');
        print('${value * 100 / 5}');
        print('stopping rec engine');
        return (value * 100 / 5);
      }
      if (_targetScores.containsKey(key) && key != placeId) {
        print('rec engine running for $placeId');
        _existp1p2[key] = 1;
        p1Sum += _userScores[key];
        p2Sum += _targetScores[key];
        p1SqSum += pow(_userScores[key], 2);
        p2SqSum += pow(_targetScores[key], 2);
        prodP1P2 += _userScores[key] * _targetScores[key];
      }
    });
    // Si no concurren con ningún elemento entonces para y regresa un cero.

    if (_existp1p2.length == 0) {
      print('No match to set recommendation!!!!');
      return 0;
    }

    var numerator = prodP1P2 - (p1Sum * p2Sum / _existp1p2.length);
    var st1 = p1SqSum - pow(p1Sum, 2) / _existp1p2.length;
    var st2 = p2SqSum - pow(p2Sum, 2) / _existp1p2.length;
    var denominator = sqrt(st1 * st2);
    if (denominator == 0) {
      print('denominator is cero for $placeId');
      return 0;
    } else {
      var val = numerator / denominator;
      print(
          'Recommendation set !!!! --------------- $val for placeId $placeId');
      if (val * 100 >= 75) {
        return val * 100;
      } else {
        return 0;
      }
    }
  }
  /* Future<double> getLikeness(targetId) async {
     FirebaseUser user = await _user.getUser;
     
     String userId = user.uid;
     DocumentSnapshot _targetUserData = await _db.getUserData(targetId);
     Map<dynamic,dynamic> _targetScores = _targetUserData.data['scores'];
     DocumentSnapshot _userData = await _db.getUserData(userId);
     Map<dynamic,dynamic> _userScores = _userData.data['scores'];
     Map _existp1p2 = {};
     List sumOfEuclideanDist = [];
     double sum = 0;
      
     _userScores.forEach((key, dynamic value) {
       if(_targetScores.containsKey(key)){
         _existp1p2[key] = 1;
         sumOfEuclideanDist.add(pow(value -_targetScores[key], 2));
       }
     });
     print(sumOfEuclideanDist);
     sum = sumOfEuclideanDist.reduce((curr, next) => curr + next);
     double sumSqrt = 1/(1 + sqrt(sum)); 
     print(sumSqrt);
     if(_existp1p2.length == 0){
       return 0;
     } else {
       return sumSqrt;
     }
   } */

}
 */