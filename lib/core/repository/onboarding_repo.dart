import 'package:crendly/models/otp_verification.dart';
import 'package:crendly/models/update_regulatory_id.dart';
import 'package:crendly/models/verify_bvn.dart';

import '../../models/employment_details.dart';
import '../../models/user_profile.dart';

abstract class OnboardingRepo {
  Future<VerifyBvn> verifyBvn(
      String bvn, String dob, String phoneNumber, String gender);

  Future<OtpVerification> otpVerificaton(String otp, String phoneNumber);

  Future<void> deviceDetails();

  Future<UpdateUserProfile> updateUserProfile(
      String userId,
      String phoneNumber,
      String firstName,
      String middleName,
      String lastName,
      String email,
      String gender,
      String maritalStatus,
      String educationalQualification,
      String dependents);

  Future<UpdateRegulatoryId> updateRegulatoryId(String userId, String idNumber,
      String issuanceDate, String expiryDate, String imagePath);

  Future<EmploymentDetails> updateEmploymentDetails(
      String userId,
      String employer,
      String occupation,
      String salaryOrIncomeRange,
      bool politicallyExposed,
      String position,
      String employmentType,
      String employmentStatus);
}
