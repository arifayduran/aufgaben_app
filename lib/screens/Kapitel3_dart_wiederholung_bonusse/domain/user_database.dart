import 'package:aufgaben_app/screens/Kapitel3_dart_wiederholung_bonusse/models/user.dart';

class UserDatabase {
  static List<User> userDatabase = [
    User("Arif", "Ayduran", 33, "arif@blabla.com"),
    User("Frida", "Jackson", 17, "frieda@hallo.com"),
    User("Paul", "Heisenberg", 12, "heisenberg@breakingbad.com"),
    User("Merve", "Speisenberg", 28, "binbeimerve@groessteluege.com")
  ];

  static void registerUser(User user) => userDatabase.add(user);

  static List<User> listAdultUsers(List userDatabase) {
    List<User> adultUsers = [];
    for (User user in userDatabase) {
      if (user.userAge >= 18) {
        adultUsers.add(user);
      }
    }
    return adultUsers;
  }

  static List<User> listNotAdultUsers(List userDatabase) {
    List<User> noAdultUsers = [];
    for (User user in userDatabase) {
      if (user.userAge < 18) {
        noAdultUsers.add(user);
      }
    }
    return noAdultUsers;
  }
}
