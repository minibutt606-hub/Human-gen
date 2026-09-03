# 📧 Gmail Integration Setup Guide

## ⚠️ اہم: Gmail سے Email بھیجنا

آپ کے app میں real Gmail account سے verification codes بھیج سکتے ہیں۔

## 📋 Setup Steps:

### **Step 1: Gmail App Password بنائیں**

1. https://myaccount.google.com/ پر جائیں
2. **Security** → **App passwords** پر جائیں
3. **App**: Mail select کریں
4. **Device**: Windows Computer (یا آپ کا device) select کریں
5. **Generate** دبائیں
6. 16-character password copy کریں (مثال: `abcd efgh ijkl mnop`)

### **Step 2: Code میں Gmail credentials ڈالیں**

فائل open کریں: `lib/backend/email_service.dart`

یہ lines تبدیل کریں:

```dart
static const String senderEmail = "your-email@gmail.com"; // ← اپنی email ڈالیں
static const String senderPassword = "your-app-password"; // ← App password ڈالیں (بغیر spaces)
```

**مثال:**
```dart
static const String senderEmail = "humanifyai@gmail.com";
static const String senderPassword = "abcdefghijklmnop"; // 16 character password
```

### **Step 3: pubspec.yaml update کریں**

اگر dependency add نہیں ہوئی:

```yaml
dependencies:
  mailer: ^6.1.1
```

پھر run کریں:
```bash
flutter pub get
```

---

## ✅ کیسے کام کرتا ہے:

```
User Signup کرے
    ↓
Verification Screen
    ↓
App Gmail سے code بھیجے (SMTP)
    ↓
Gmail میں User کو email آئے
    ↓
Email میں code ہو (مثال: 123456)
    ↓
User app میں code enter کرے
    ↓
Verify ہو جائے
    ↓
Account بن جائے ✅
```

---

## 📧 Email Template:

جو email ملے گا:

```
━━━━━━━━━━━━━━━━━━━━━
    HUMANIFY AI
━━━━━━━━━━━━━━━━━━━━━

آپ کے Humanify account کی تصدیق کے لیے یہ 
code استعمال کریں:

      1 2 3 4 5 6
      (بڑے سائز میں)

یہ code 10 منٹ میں ختم ہو جائے گا۔

اگر یہ آپ نے نہیں مانگا تو ignore کریں۔

© 2024 Humanify AI
━━━━━━━━━━━━━━━━━━━━━
```

---

## ⚙️ Gmail App Password کیسے بنائیں (تفصیل):

**Option 1: Desktop سے**
1. https://accounts.google.com/security
2. Left sidebar میں "App passwords" تلاش کریں
3. (2FA enabled ہونا ضروری ہے)
4. 16-character password ملے گا

**Option 2: اگر 2FA نہیں ہے:**
- 2FA enable کریں پہلے
- https://myaccount.google.com/security/signin
- "2-Step Verification" turn on کریں

---

## ✨ Features:

✅ **Real Gmail Integration** - اصل Gmail سے بھیجو  
✅ **Professional Email** - خوبصورت HTML email  
✅ **Urdu Support** - اردو میں پیغام  
✅ **Fallback** - اگر Gmail fail ہو تو logs میں code دکھائیں  
✅ **Backend Support** - اپنے backend میں بھی بھیج سکتے ہو  

---

## 🧪 Testing:

1. اپنی Gmail email ڈالیں
2. اپنی Gmail app password ڈالیں
3. App میں signup کریں
4. اپنے Gmail inbox میں check کریں
5. Code copy کریں
6. App میں paste کریں
7. Done! ✅

---

## ⚠️ اگر Email نہیں آئی:

**مسائل:**
1. **Gmail credentials غلط** - دوبارہ check کریں
2. **2FA disabled** - 2-Step Verification enable کریں
3. **App Password غلط** - نیا generate کریں (spaces ہٹائیں)
4. **Firewall/VPN** - SMTP port 465 کھلا ہے
5. **Less Secure Apps** - اگر کام نہ کرے تو try کریں

---

## 🔐 Security Notes:

✅ Password safe رہے گا (local storage)  
✅ Email address visible نہیں ہے users کو  
✅ Code temporary ہے (10 منٹ)  
✅ Passwords never sent ہوتے ہیں  

---

## 📱 پورا Flow:

**1. Signup Screen:**
```
Name: Ahmed Ali
Email: myemail@gmail.com
Password: Pass@123
↓ Click "Sign Up"
```

**2. Verification Screen:**
```
Verification code بھیجا گیا!
Enter 6-digit code:
[1][2][3][4][5][6]
↓ Click "تصدیق کریں"
```

**3. Gmail میں Email:**
```
From: humanifyai@gmail.com
Subject: Humanify - Email Verification Code

Code: 123456 (بڑے سائز میں)
```

**4. Home Screen:**
```
✅ Logged in!
Welcome Ahmed Ali
```

---

**یہ setup مکمل ہے! Real emails اب آنے لگیں گی! 🎉**
