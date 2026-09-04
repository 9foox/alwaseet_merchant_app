# تطبيق القصيم - تطبيق التاجر

## نظرة عامة
تطبيق Flutter متكامل لإدارة المتجر والمنتجات والطلبات للتجار.

## الميزات
- ✅ تسجيل الدخول والتسجيل
- ✅ لوحة تحكم شاملة
- ✅ إدارة المنتجات
- ✅ إدارة الطلبات
- ✅ الملف الشخصي
- ✅ احصائيات المبيعات

## المتطلبات
- Flutter 3.16.0 أو أحدث
- Dart 3.0.0 أو أحدث
- Android SDK 21+
- iOS 11.0+

## التثبيت

```bash
# استنساخ المشروع
git clone https://github.com/9foox/alwaseet_merchant_app.git
cd alwaseet_merchant_app

# تثبيت المتطلبات
flutter pub get

# تشغيل التطبيق
flutter run
```

## البناء

### بناء APK
```bash
flutter build apk --release
```

### بناء AAB
```bash
flutter build appbundle --release
```

## الهيكل
```
lib/
├── main.dart
├── screens/
│   ├── login_screen.dart
│   ├── dashboard_screen.dart
│   ├── products_screen.dart
│   ├── orders_screen.dart
│   └── profile_screen.dart
└── providers/
    ├── auth_provider.dart
    ├── products_provider.dart
    └── orders_provider.dart
```

## المكتبات المستخدمة
- **Provider**: إدارة الحالة
- **HTTP/DIO**: طلبات API
- **SQLFlite**: قاعدة البيانات المحلية
- **FL Chart**: الرسوم البيانية
- **QR Flutter**: توليد رموز QR

## المساهمة

نرحب بالمساهمات! يرجى فتح Pull Request مع تفاصيل التغييرات.

## الترخيص
MIT License
