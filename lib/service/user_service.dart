import 'package:blackrose_admin_panel/models/users.dart';
import 'package:blackrose_admin_panel/service/api.dart';

class UserService {
  static Stream<List<Users>> getAllUser() => GetAPI.fireStore
      .collection('users')
      .orderBy('created', descending: true)
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Users.fromMap(doc.data())).toList());
}
