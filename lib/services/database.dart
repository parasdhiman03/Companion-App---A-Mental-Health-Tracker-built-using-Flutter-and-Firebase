import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:companion_app_main/models/auser.dart';
import 'package:companion_app_main/models/udata.dart';
import 'package:companion_app_main/quiz/quiz_screen.dart';
class DatabaseService{
  //collection reference
  final String uid;
  DatabaseService({required this.uid});
  final CollectionReference udataCollection=FirebaseFirestore.instance.collection('userdata');
  Future updateUserData(String mood,String name,String profession,int age) async{
    return await udataCollection.doc(uid).set({
      'mood':mood,
      'name':name,
      'profession':profession,
      'age':age,
    });
  }
  //udata list from snapshot
  List<Udata> _udataListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>; // Cast doc.data() to Map<String, dynamic>
      return Udata(
        mood: data['mood'] ?? '',
        profession: data['profession'] ?? '',
        age: data['age'] ?? 0,
        name: data['name'] ?? '',
        quizScore: data['quiz_scores'] ?? 0,
      );
    }).toList();
  }
  //userdata from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return UserData(
      uid: uid,
      name: data['name'] ?? '',
      age: data['age'] ?? 0,
      profession: data['profession'] ?? '',
      mood: data['mood'] ?? '',
    );
  }

  //get userdata stream
  Stream<List<Udata>> get udata{
    return udataCollection.snapshots().map(_udataListFromSnapshot);
  }
  // Stream<List<Udata>> get udata {
  //   return udataCollection
  //       .where('uid', isEqualTo: uid) // Add the where clause to filter by uid
  //       .snapshots()
  //       .map(_udataListFromSnapshot);
  // }

  //get user doc stream
  Stream<UserData> get userdata{
    return udataCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }

  Future<void> updateQuizScore(String uid, int score) async {
    await udataCollection.doc(uid).update({
      'quiz_scores': score,
    });
  }

  Future<Udata?> getUserData(String uid) async {
    try {
      DocumentSnapshot snapshot = await udataCollection.doc(uid).get();
      if (snapshot.exists) {
        Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
        return Udata.fromFirestore(data);
      } else {
        return null;
      }
    } catch (e) {
      print('Error getting user data: $e');
      return null;
    }
  }



}