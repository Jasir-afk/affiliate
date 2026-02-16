class Apiurls {
  // Base URL
  static const String baseUrl =
      'https://test.affiliate.api.caremallonline.com'; // test
  // static const String baseUrl = 'https://affiliate.api.caremallonline.com'; // live

  // Authentication Endpoints
  static const String sendOtp = '$baseUrl/api/v1/affiliate/auth/send-otp';
  static const String verifyOtp = '$baseUrl/api/v1/affiliate/auth/verify-otp';
}
