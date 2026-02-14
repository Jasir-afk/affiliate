import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_mall_affiliate/src/modules/auth/controller/auth_repo.dart';

/// Authentication Controller using GetX for state management
/// Handles all authentication-related business logic
class AuthController extends GetxController {
  // Observable states
  final isLoading = false.obs;
  final isResendingOtp = false.obs;

  // User data
  final phoneNumber = ''.obs;
  final userName = ''.obs;
  final userEmail = ''.obs;
  final authToken = ''.obs;

  /// Sends OTP for login
  ///
  /// Parameters:
  /// - [phone]: 10-digit phone number
  /// - [onSuccess]: Callback function when OTP is sent successfully
  /// - [onError]: Callback function when there's an error
  Future<void> sendLoginOtp({
    required String phone,
    Function? onSuccess,
    Function(String)? onError,
  }) async {
    isLoading.value = true;

    try {
      final result = await AuthRepo.sendOtp(phone: phone, mode: 'login');

      if (result['success']) {
        phoneNumber.value = phone;
        Get.snackbar(
          'Success',
          result['message'],
          backgroundColor: Colors.green,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
        if (onSuccess != null) onSuccess();
      } else {
        Get.snackbar(
          'Error',
          result['message'],
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
        if (onError != null) onError(result['message']);
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to send OTP: ${e.toString()}',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
      if (onError != null) onError(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  /// Sends OTP for signup/registration
  ///
  /// Parameters:
  /// - [phone]: 10-digit phone number
  /// - [name]: User's full name
  /// - [email]: User's email address
  /// - [onSuccess]: Callback function when OTP is sent successfully
  /// - [onError]: Callback function when there's an error
  Future<void> sendSignupOtp({
    required String phone,
    required String name,
    required String email,
    Function? onSuccess,
    Function(String)? onError,
  }) async {
    isLoading.value = true;

    try {
      final result = await AuthRepo.sendOtp(
        phone: phone,
        mode: 'signup',
        name: name,
        email: email,
      );

      if (result['success']) {
        phoneNumber.value = phone;
        userName.value = name;
        userEmail.value = email;
        Get.snackbar(
          'Success',
          result['message'],
          backgroundColor: Colors.green,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
        if (onSuccess != null) onSuccess();
      } else {
        Get.snackbar(
          'Error',
          result['message'],
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
        if (onError != null) onError(result['message']);
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to send OTP: ${e.toString()}',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
      if (onError != null) onError(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  /// Verifies the OTP entered by user
  ///
  /// Parameters:
  /// - [phone]: 10-digit phone number
  /// - [otp]: 6-digit OTP code
  /// - [onSuccess]: Callback function when OTP is verified successfully
  /// - [onError]: Callback function when there's an error
  Future<void> verifyOtp({
    required String phone,
    required String otp,
    Function? onSuccess,
    Function(String)? onError,
  }) async {
    isLoading.value = true;

    try {
      final result = await AuthRepo.verifyOtp(phone: phone, otp: otp);

      if (result['success']) {
        // Save authentication token if provided
        if (result['token'] != null) {
          authToken.value = result['token'];
          // TODO: Save token to persistent storage (SharedPreferences)
        }

        Get.snackbar(
          'Success',
          result['message'],
          backgroundColor: Colors.green,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
        if (onSuccess != null) onSuccess();
      } else {
        Get.snackbar(
          'Error',
          result['message'],
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
        if (onError != null) onError(result['message']);
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to verify OTP: ${e.toString()}',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
      if (onError != null) onError(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  /// Resends OTP using stored user data
  ///
  /// Parameters:
  /// - [mode]: "login" or "signup"
  /// - [onSuccess]: Callback function when OTP is sent successfully
  /// - [onError]: Callback function when there's an error
  Future<void> resendOtp({
    required String mode,
    Function? onSuccess,
    Function(String)? onError,
  }) async {
    isResendingOtp.value = true;

    try {
      final result = await AuthRepo.sendOtp(
        phone: phoneNumber.value,
        mode: mode,
        name: mode == 'signup' ? userName.value : '',
        email: mode == 'signup' ? userEmail.value : '',
      );

      if (result['success']) {
        Get.snackbar(
          'Success',
          result['message'],
          backgroundColor: Colors.green,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
        if (onSuccess != null) onSuccess();
      } else {
        Get.snackbar(
          'Error',
          result['message'],
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
        if (onError != null) onError(result['message']);
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to resend OTP: ${e.toString()}',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
      if (onError != null) onError(e.toString());
    } finally {
      isResendingOtp.value = false;
    }
  }

  /// Clears all authentication data
  void logout() {
    phoneNumber.value = '';
    userName.value = '';
    userEmail.value = '';
    authToken.value = '';
    isLoading.value = false;
    isResendingOtp.value = false;
    // TODO: Clear persistent storage
  }
}
