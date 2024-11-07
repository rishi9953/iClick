import 'package:technical_round/Networks/network.dart';
import 'package:technical_round/Networks/urls.dart';
import 'package:technical_round/Repositories/Login/login_repository.dart';

class LoginImplRepository extends LoginRepository {
  final _networks = Networks();

  @override
  Future login(String email, String password) {
    final response = _networks.post(auth, {
      'username': email,
      'password': password,
    });
    return response;
  }
}
