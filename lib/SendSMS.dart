import 'dart:core';
import 'package:twilio_flutter/twilio_flutter.dart';

void sendSms(String phone_number,String message) async {
  TwilioFlutter twilioFlutter = TwilioFlutter(
      accountSid: 'SID',
      authToken: 'TOKEN',
      twilioNumber: '+9000000');
  twilioFlutter.sendSMS(toNumber: phone_number, messageBody: message);
} //DONE
void LimitExceededSMS(String phone_number,String message) async {
  TwilioFlutter twilioFlutter = TwilioFlutter(
      accountSid: 'SID',
      authToken: 'TOKEN',
      twilioNumber: '+9000000');
  twilioFlutter.sendSMS(toNumber: phone_number, messageBody: message);
} //DONE
