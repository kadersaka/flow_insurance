import 'package:flowinsurance/models/phone.dart';

class AppUser {
  // late String id;
  late String name;
  late String surname;
  // late String imageUrl;
  late String phoneNumber;
  late String mdp;
  late List<PhoneInfos> mesPhone;
  
  AppUser(this.name, this.surname, this.phoneNumber, this.mdp);
}
