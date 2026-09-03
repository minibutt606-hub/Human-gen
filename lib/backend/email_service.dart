import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class EmailService {
  // Gmail SMTP Configuration
  static const String senderEmail = "minibutt606@gmail.com";
  static const String senderPassword = "muneeb123@";

  static Future<bool> sendVerificationCode({
    required String recipientEmail,
    required String code,
  }) async {
    try {
      print("📧 Sending verification code to: $recipientEmail");

      // Gmail SMTP Server
      final smtpServer = gmail(senderEmail, senderPassword);

      // Create email message
      final message = Message()
        ..from = Address(senderEmail, 'Humanify AI')
        ..recipients.add(recipientEmail)
        ..subject = 'Humanify - Email Verification Code'
        ..html =
            '''
          <html>
            <body style="font-family: Arial, sans-serif; background-color: #f5f5f5; padding: 20px;">
              <div style="max-width: 600px; margin: 0 auto; background-color: white; border-radius: 10px; padding: 30px; box-shadow: 0 2px 10px rgba(0,0,0,0.1);">
                <h2 style="color: #7AEEB5; text-align: center;">Humanify AI</h2>
                <p style="font-size: 16px; color: #333; text-align: center;">
                  To verify your Humanify account, use this code:
                </p>
                <div style="background-color: #f0f0f0; border-radius: 8px; padding: 20px; text-align: center; margin: 20px 0;">
                  <h1 style="font-size: 48px; color: #7AEEB5; letter-spacing: 10px; margin: 0;">$code</h1>
                </div>
                <p style="font-size: 14px; color: #666; text-align: center;">
                  This code will expire in 10 minutes.
                </p>
                <p style="font-size: 12px; color: #999; text-align: center;">
                  If you didn't request this, please ignore this email.
                </p>
                <hr style="border: 1px solid #eee; margin: 20px 0;">
                <p style="font-size: 12px; color: #999; text-align: center;">
                  © 2024 Humanify AI. All rights reserved.
                </p>
              </div>
            </body>
          </html>
        ''';

      // Send email
      await send(message, smtpServer);
      print("✅ Email sent successfully to $recipientEmail");
      return true;
    } on MailerException catch (e) {
      print("❌ Gmail Error: $e");
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
      return false;
    } catch (e) {
      print("❌ Error sending email: $e");
      return false;
    }
  }
}
