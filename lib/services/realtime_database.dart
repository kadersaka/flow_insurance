import 'package:firebase_database/firebase_database.dart';
class Servive{
FirebaseDatabase database = FirebaseDatabase.instance;
DatabaseReference ref = FirebaseDatabase.instance.ref();

void createUser() {}
void login() {
  // ref.once().then((DataSnapshot snapshot) {});
}

void logout() {}
Future<void> allUsers() async {
  final snapshot = await ref.child('1').get();
  if (snapshot.exists) {
    print(snapshot.value);
  } else {
    print('No data available.');
  }
}
}