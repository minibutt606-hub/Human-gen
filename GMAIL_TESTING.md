# 🔧 Gmail Setup - مکمل Guide

## ⚠️ موجودہ حالت:

Gmail فی الوقت **disabled** ہے۔ Verification codes **console logs میں** دیکھنے کو ملیں گے۔

```
I/flutter: Verification Code for minibutt606@gmail.com: 378720
```

---

## ✅ Gmail Integration Setup (اختیاری)

اگر حقیقی Gmail سے emails بھیجنا چاہتے ہو تو:

### **Step 1: Gmail Account Setup (1 منٹ)**

1. https://myaccount.google.com/ پر جائیں
2. Left sidebar میں **"Security"** تلاش کریں
3. **"App passwords"** پر جائیں
4. 2FA (2-Step Verification) enable ہونا ضروری ہے

**اگر 2FA نہیں ہے:**
- https://myaccount.google.com/security/signin
- "2-Step Verification" کو ON کریں
- پھر App passwords پر جائیں

### **Step 2: App Password Generate (2 منٹ)**

1. **App select:** Mail
2. **Device select:** Windows Computer (یا جو بھی ڈیوائس)
3. **Generate** دبائیں
4. 16-character password دیکھیں، مثال:
   ```
   abcd efgh ijkl mnop
   ```

### **Step 3: Code میں ڈالیں (1 منٹ)**

**فائل:** `lib/backend/email_service.dart`

یہ 2 lines تبدیل کریں:

```dart
// پہلے (غلط):
static const String senderEmail = "humanifyai@gmail.com";
static const String senderPassword = "abcd efgh ijkl mnop";
static const bool useGmail = false;

// بعد میں (صحیح):
static const String senderEmail = "minibutt606@gmail.com"; // ← اپنی email
static const String senderPassword = "abcdefghijklmnop"; // ← بغیر spaces
static const bool useGmail = true; // ← ہاں کریں
```

**Important:** Password میں spaces **نہیں** ہونی چاہیں۔

---

## 📧 Testing Gmail:

### **اگر useGmail = true ہے:**

```
User signup کرے:
  ↓
"Verification Code for minibutt606@gmail.com" logs میں
  ↓
Actual email بھی ملے (Gmail inbox میں)
  ↓
User code enter کرے
  ↓
Account بنے ✅
```

### **اگر useGmail = false ہے (موجودہ):**

```
User signup کرے:
  ↓
"[TEST MODE] Code: 378720" logs میں
  ↓
Email نہیں آئے گا (local testing کے لیے)
  ↓
Logs سے code copy کریں
  ↓
App میں paste کریں
  ↓
Account بنے ✅
```

---

## 🧪 فی الوقت Testing (Gmail بغیر):

**موجودہ Setup:**
- ✅ Verification codes generate ہوتے ہیں
- ✅ Codes console میں دیکھ سکتے ہو
- ✅ App میں code enter کر سکتے ہو
- ✅ Account بن جاتا ہے

**Run کریں:**
```bash
flutter run
```

**Signup میں:**
1. Name: Ahmed
2. Email: minibutt606@gmail.com (یا کوئی بھی)
3. Password: Pass@123
4. Sign Up دبائیں
5. **Console میں code دیکھیں** (I/flutter: Verification Code...)
6. Code اپ میں enter کریں
7. Done! ✅

---

## ⚠️ اگر Gmail Setup نہیں کیا:

```
- useGmail = false رہے گا
- Emails نہیں بھیجے جائیں گے
- Testing میں console سے code نکالیں
- Production میں Gmail setup کریں
```

---

## 🔐 Security:

✅ Password local میں ہے (کہیں upload نہیں ہوتا)  
✅ سوال نہیں ہے GitHub میں  
✅ Emails secure ہیں SMTP سے  

---

## 📱 Next Steps:

### **اگر Production میں جانا ہے:**

1. **Gmail Setup مکمل کریں**
2. **useGmail = true** کریں
3. **App Password set** کریں
4. **flutter run** کریں
5. **Real emails آنے لگیں گی**

### **اگر فی الوقت Testing ہے:**

1. **useGmail = false** رہنے دیں
2. **Logs سے codes نکالیں**
3. **App میں verify کریں**
4. **بعد میں Gmail setup کریں**

---

## ❓ کیا ہوگا اگر:

**Q: Gmail password غلط ہے?**
```
Error: Authentication Failed (code: 535)
  → Password دوبارہ check کریں
  → Spaces ہٹائیں
  → نیا generate کریں
```

**Q: 2FA disabled ہے?**
```
Error: Less secure apps
  → https://myaccount.google.com/security
  → 2-Step Verification ON کریں
  → App passwords دوبارہ try کریں
```

**Q: Email inbox میں نہیں آیا?**
```
Check:
1. Spam folder
2. Gmail settings
3. Blocked senders
4. SMTP port (465) open ہے?
```

---

## 🎯 آسان Summary:

**فی الوقت:**
- Codes ✅ generate ہو رہے ہیں
- Console ✅ میں visible ہیں
- Testing ✅ ہو سکتی ہے
- Emails ❌ نہیں آ رہی

**Gmail enable کرنے کے لیے:**
- `email_service.dart` میں اپنی credentials ڈالیں
- `useGmail = true` کریں
- App restart کریں
- Done! Emails آنے لگیں گی

---

**اب app چلائیں اور test کریں! 🚀**

Logs میں verification code ملے گا۔ وہ code app میں ڈالیں۔ ✅
