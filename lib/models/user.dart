import 'package:firebase_database/firebase_database.dart';

class AppUser {
  // late String id;
  late String name;
  late String surname;
  // late String imageUrl;
  late String phoneNumber;
  late String mdp;

  AppUser(this.name, this.surname, this.phoneNumber, this.mdp);
  Future<void> addToDataBase() async {
    DatabaseReference ref = FirebaseDatabase.instance.ref("/user");
    await ref.set({
      phoneNumber: {
        "name": name,
        "surname": surname,
        "phoneNumber": phoneNumber,
        "mdp": mdp,
      }
    });
  }
}
