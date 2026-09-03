# ⚡ QUICK SETUP - 5 منٹ میں شروع کریں!

## Step 1: Gmail Setup (2 منٹ)

**فائل تبدیل کریں:**
```
lib/backend/email_service.dart
```

**یہ تبدیل کریں:**
```dart
static const String senderEmail = "your-email@gmail.com";
static const String senderPassword = "your-app-password";
```

**اپنی Gmail app password کیسے بنائیں:**
1. https://myaccount.google.com/ → Security
2. "App passwords" تلاش کریں
3. Mail + Your Device select کریں
4. 16-digit password copy کریں (spaces ہٹائیں)
5. Code میں paste کریں

---

## Step 2: Dependencies (1 منٹ)

```bash
flutter pub get
```

---

## Step 3: Rephrasy Key (1 منٹ)

**فائل:** `lib/home/setting.dart` (Settings screen میں)

App میں جاکر:
- ⚙️ Settings دبائیں
- API key section میں paste کریں
- https://rephrasy.ai/dashboard سے key لیں

---

## Step 4: Run (1 منٹ)

```bash
flutter run
```

---

## ✅ Done!

اب آپ:
1. ✅ Signup کر سکتے ہو
2. ✅ Email verification کر سکتے ہو
3. ✅ AI detection use کر سکتے ہو
4. ✅ Text humanize کر سکتے ہو

---

## 🔗 Important Links:

- Gmail App Passwords: https://myaccount.google.com
- Rephrasy Dashboard: https://rephrasy.ai/dashboard
- Rephrasy API Docs: https://rephrasy.ai/docs

---

**بس! مکمل ہو گیا! 🎉**
