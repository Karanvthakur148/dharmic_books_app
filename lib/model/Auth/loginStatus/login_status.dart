import 'package:hive/hive.dart';
part 'login_status.g.dart';
@HiveType(typeId: 1)
class LoginStatus extends HiveObject {
  @HiveField(0)
  bool isLogin;
  LoginStatus(this.isLogin);
}