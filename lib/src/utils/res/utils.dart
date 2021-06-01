import 'my_enums.dart';

class Utils {
  String getRole(ROLES role) {
    switch (role) {
      case ROLES.ADMIN:
        return "ADMIN";
      case ROLES.PRACTITIONER:
        return "PRACTITIONER";
      case ROLES.PARENT:
        return "PARENT";
      case ROLES.PATIENT:
        return "PATIENT";
      default:
        return "UNDEFINED";
    }
  }
}
