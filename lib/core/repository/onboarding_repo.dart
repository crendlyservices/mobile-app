import 'package:crendly/models/otp_verification.dart';
import 'package:crendly/models/update_regulatory_id.dart';
import 'package:crendly/models/verify_bvn.dart';

import '../../models/user_profile.dart';

abstract class OnboardingRepo {
  Future<VerifyBvn> verifyBvn(
      String bvn, String dob, String phoneNumber, String gender);

  Future<OtpVerification> otpVerificaton(String otp, String phoneNumber);

  Future<void> _deviceDetails();
  Future<UpdateUserProfile> updateUserProfile(
    String userId,
    String picture,
    String phoneNumber,
    String firstName,
    String middleName,
    String lastName,
    String email,
    String gender,
    String maritalStatus,
    String educationalQualification,
  );

  Future<UpdateRegulatoryId> updateRegulatoryId(
      String userId, String idNumber, String issuanceDate, String expiryDate);
}
