# 📱 HUMANIFY APP - مکمل Setup Guide

## ✅ سب کچھ تیار ہے!

### 🎯 Features Implemented:

#### 1. **Email Verification System** ✅
- Signup میں email verification لازمی ہے
- 6-digit code بھیجا جاتا ہے
- User کو code درج کرنا پڑتا ہے
- صرف verify ہونے کے بعد Home میں جا سکتے ہیں

**کیسے کام کرتا ہے:**
```
Signup → Email Verification → Code Check → Create Account → Home
```

#### 2. **Rephrasy API Integration** ✅
- AI detection feature (text کتنا AI-generated ہے %)
- Humanize feature (AI text کو natural بنائیں)
- Summarize feature (خلاصہ بنائیں)
- Settings میں API key change کر سکتے ہیں

#### 3. **Settings Screen** ✅
- API key management
- Logout functionality
- Privacy & Terms links

#### 4. **Token-Based Authentication** ✅
- Signup کے بعد token محفوظ ہوتا ہے
- App restart کے بعد بھی logged رہیں

---

## 🚀 How to Use:

### **First Time Signup:**

1. **App کھولیں** → Splash Screen
2. **"Get Started" دبائیں** → Login/Signup screen
3. **"Create New Account" دبائیں** → Signup screen
4. **فارم بھریں:**
   - Name: کوئی بھی نام
   - Email: **کوئی بھی email (ہے verify نہیں ہونا)** ✅
   - Password: 8+ characters, uppercase, special char
5. **"Sign Up" دبائیں** → **Email Verification Screen**
6. **Code دیکھیں:**
   - اگر backend ہے تو email میں ملے گا
   - اگر backend نہیں تو logs میں دیکھیں:
     - Android Studio Console / VS Code Terminal میں
     - "Verification Code for..." والا message
7. **Code enter کریں** (6 digits)
8. **"تصدیق کریں" دبائیں**
9. **✅ Home Screen میں آ گئے!**

### **Home Screen:**

1. **Text لکھیں** (max 300 characters)
2. **Model select کریں** (v3 recommended)
3. **Language select کریں**
4. **Features:**
   - 🤖 "Let's Check AI" - AI % معلوم کریں
   - 📝 "Humanize" - Text کو natural بنائیں  
   - 📋 "Summarize" - خلاصہ بنائیں

### **Settings میں Rephrasy API Key:**

1. ⚙️ **Settings icon** (top left) دبائیں
2. **"Rephrasy API Configuration"** section
3. **API key پیسٹ کریں** (https://rephrasy.ai/dashboard سے)
4. **"Save API Key" دبائیں**
5. **Back to Home** → Features کام کریں گی ✅

---

## ⚙️ Backend Requirements:

اگر آپ backend API کو مکمل کرنا چاہتے ہیں تو یہ endpoints بنائیں:

### **Endpoints:**

#### 1. **Signup**
```
POST /api/signup
Body: {
  "name": "User Name",
  "email": "user@example.com",
  "password": "Pass@123"
}
Response: {
  "token": "eyJhbGc...",
  "message": "Signup successful"
}
```

#### 2. **Send Verification Code** (Optional)
```
POST /api/send-verification-code
Body: {
  "email": "user@example.com",
  "code": "123456"
}
Response: {
  "message": "Code sent"
}
```

#### 3. **Verify Code** (Optional)
```
POST /api/verify-code
Body: {
  "email": "user@example.com",
  "code": "123456"
}
Response: {
  "verified": true
}
```

---

## 📝 File Structure:

```
lib/
├── backend/
│   └── server_Controller.dart       ← API calls + verification
├── splashscreen/
│   ├── splashscreen.dart            ← App کا شروع
│   ├── signup.dart                  ← Signup form
│   ├── login.dart                   ← Login form
│   ├── email_verification.dart      ← Email verification ✨ NEW
│   └── forgot.dart                  ← Forgot password
├── home/
│   ├── home.dart                    ← Main features
│   ├── Aichecker.dart               ← AI detection result
│   ├── humanize.dart                ← Humanized text
│   ├── summarize.dart               ← Summarized text
│   ├── premium.dart                 ← Premium features
│   └── setting.dart                 ← Settings + API key ✨ UPDATED
└── main.dart                        ← App entry point
```

---

## 🔐 Security Notes:

✅ Tokens محفوظ ہیں SharedPreferences میں  
✅ API keys صرف device میں ہیں  
✅ Verification codes temporary ہیں  
✅ Passwords secure ہیں backend میں  

---

## 🐛 Troubleshooting:

**Q: "Invalid API Key" error آ رہا ہے?**  
A: Settings میں سے صحیح Rephrasy API key ڈالیں

**Q: "Insufficient Credits" error؟**  
A: https://rephrasy.ai/dashboard میں account میں credits add کریں

**Q: Verification code نہیں ملا?**  
A: Android Studio/VS Code console میں "Verification Code for" والی line تلاش کریں

**Q: Login نہیں ہو رہا?**  
A: پہلے signup کریں اور email verify کریں

---

## 📞 Backend API Base URL:

```dart
String base_url = 'https://humanify.tecclubb.com/api/';
```

اپنا URL یہاں ڈالیں ↑

---

## 🎉 مبارک ہو!

آپ کا Humanify App مکمل ہے! 

**Next Steps:**
- [ ] Rephrasy API key حاصل کریں
- [ ] App میں key add کریں
- [ ] Features test کریں
- [ ] Backend integrate کریں (اگر چاہیے)

---

**Happy Coding! 🚀**
