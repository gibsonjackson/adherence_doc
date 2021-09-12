import 'package:adherence_doc/src/utils/res/persistence/secure_manager.dart';

class AuthPersistManager {
  SecureStorageManager manager = SecureStorageManager();

  final String persistKey = "persistUser";
  final String usernameKey = "UserKey";
  final String assistantnameKey = "AssKey";

  Future<void> clearUser() async {
    await manager.deleteAll();
  }

  Future<String> getToken() async {
    String token = await manager.getString(persistKey);
    return token;
  }

  Future<bool> hasToken() async {
    //FIXME inc to inc splashscreen time
    await Future.delayed(Duration(milliseconds: 300));
    String token = await manager.getString(persistKey);
    if (token != null) {
      return true;
    }
    return false;
  }

  Future<void> persistUser() async {
    await manager.putString(persistKey, "awsm");
  }

  Future<void> persistUserName(String username) async {
    await manager.putString(usernameKey, username);
  }

  Future getUserMail() async {
    String mail = await manager.getString(usernameKey);
    return mail;
  }

  Future getPersonalisations() async {
    String username = await manager.getString(usernameKey);
    String assname = await manager.getString(assistantnameKey);

    return [username, assname];
  }

  Future<void> persistAssName(String assname) async {
    await manager.putString(assistantnameKey, assname);
  }
}
