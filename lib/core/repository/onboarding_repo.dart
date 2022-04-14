import 'package:crendly/models/verify_bvn.dart';

abstract class OnboardingRepo {
  Future<VerifyBvn> verifyBvn();
}
