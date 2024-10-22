import 'dart:async';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class OtpController extends GetxController {
  var otpCode = ''.obs;
  var seconds = 30.obs;
  late Timer _timer;
  bool _isTimerRunning = false;

  void updateOtp(String value) {
    otpCode.value = value;
  }
  void resetTimer() {
    if (_isTimerRunning) {
      _timer.cancel(); // Cancel any existing timer before resetting
    }
    seconds.value = 30; // Reset the timer to 120 seconds
    startTimer();
  }

  void startTimer() {
    if (!_isTimerRunning) { // Only start if the timer isn't running
      _isTimerRunning = true; // Set the flag to true
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (seconds.value > 0) {
          seconds.value--;
        } else {
          timer.cancel(); // Stop the timer when it reaches 0
          _isTimerRunning = false; // Reset the flag
          // Navigate to login page
        }
      });
    }
  }

  // Format seconds to MM:SS
  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  void addDigit(String digit) {
    if (otpCode.value.length < 4) {
      otpCode.value += digit;
    }
  }

  void removeDigit() {
    if (otpCode.value.isNotEmpty) {
      otpCode.value = otpCode.value.substring(0, otpCode.value.length - 1);
    }
  }

  void resendCode() {
  }

  void submitCode() {
  }
}