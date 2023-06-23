import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseManager {
  final CollectionReference profileList =
      FirebaseFirestore.instance.collection('user');

  Future<void> createUserData(String first_name, String last_name,
      String password, String photo, String website, String uid) async {
    return await profileList.doc(uid).set({
      'first_name': first_name,
      'last_name': last_name,
      'password': password,
      'photo': photo,
      'website': website
    });
  }

  Future updateUserList(String first_name, String last_name, String password,
      String photo, String website, String uid) async {
    return await profileList.doc(uid).update({
      'first_name': first_name,
      'last_name': last_name,
      'password': password,
      'photo': photo,
      'website': website
    });
  }

  Future getUsersList() async {
    List itemsList = [];

    try {
      await profileList.get().then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          itemsList.add(element.data);
        });
      });
      return itemsList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
