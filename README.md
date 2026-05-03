# 💊 PharmaFix — Pharmacy Management System (SaaS)

![PharmaFix Banner](https://img.shields.io/badge/Status-In_Progress-orange?style=for-the-badge)
![Flutter](https://img.shields.io/badge/Flutter-v3.22+-02569B?style=for-the-badge&logo=flutter)
![Supabase](https://img.shields.io/badge/Supabase-Backend-3ECF8E?style=for-the-badge&logo=supabase)
![Drift](https://img.shields.io/badge/Drift-Local_DB-FFC107?style=for-the-badge)

نظام متكامل لإدارة الصيدليات يعتمد على مبدأ **"أولاً بدون إنترنت" (Offline-First)**، مصمم لتوفير تجربة مستخدم سريعة وسلسة مع مزامنة سحابية متقدمة.

---

## 🚀 ما تم إنجازه (Accomplishments)

✅ **نظام البيع (POS System):**
- واجهة بيع متطورة تدعم البحث السريع والباركود.
- سلة تسوق ذكية تدعم تعدد الوحدات (علبة، شريط، قرص) مع حساب تلقائي للأسعار.
- نظام دفع مرن يدعم البحث عن الزبائن وإضافتهم السريعة.
- معالجة العمليات المالية (Checkout) مباشرة في قاعدة البيانات المحلية مع دعم نظام FIFO لخصم الكميات من الدفعات الأقدم.

✅ **إدارة المخزون (Inventory Management):**
- دعم كامل لتعدد الوحدات (Multi-Unit System V6.1).
- تتبع الدفعات (Batch Tracking) مع تواريخ الانتهاء وتنبيهات الألوان.
- محرك بحث ذكي (Smart Autocomplete) يربط بين المنتجات المحلية وقاموس الأدوية الشامل.

✅ **إدارة الموردين (Suppliers Management):**
- هيكل بيانات متكامل لإدارة الموردين، فواتير المشتريات، والمدفوعات.
- حساب تلقائي للديون وكشف حساب المورد.

✅ **البنية التحتية والتقنية:**
- اعتماد **Clean Architecture** لضمان سهولة التوسع والصيانة.
- مزامنة البيانات مع **Supabase** (Incremental Sync).
- إدارة الحالة باستخدام **Flutter Bloc / Cubit**.

---

## 🏗️ ما يتبقى (Remaining Roadmap)

- [ ] **التقارير والإحصائيات:** لوحة تحكم ذكية تعرض المبيعات، الأرباح، والمنتجات الأكثر مبيعاً.
- [ ] **إدارة المرتجعات:** واجهة كاملة لمرتفعات البيع والشراء.
- [ ] **نظام الصلاحيات:** أدوار المستخدمين (مدير، كاشير) وصلاحيات الوصول.
- [ ] **تحسين المزامنة:** استكمال الرفع التلقائي للفواتير (SyncUp) فور توفر الإنترنت.
- [ ] **الإعدادات:** تخصيص معلومات الصيدلية، الطابعة، والعملات.

---

## 🛠️ معلومات تقنية يجب معرفتها

- **قاعدة البيانات:** نستخدم **Drift (SQLite)** كمصدر وحيد للحقيقة (SSOT) للقراءة في الواجهات، و**Supabase** للمزامنة والتخزين السحابي.
- **اللغة والاتجاه:** التطبيق يدعم اللغة العربية بشكل كامل (RTL) مع استخدام خط **Cairo**.
- **المعايير البرمجية:** نتبع قواعد صارمة في نظافة الكود، حيث نسعى لتقليل طول الملفات (قاعدة الـ 60 سطر) وفصل المنطق عن الواجهات.

---

## 🏃 كيفية التشغيل

1. تأكد من تثبيت **Flutter SDK** (نسخة 3.22 أو أحدث).
2. قم بتثبيت المكتبات:
   ```bash
   flutter pub get
   ```
3. تشغيل منشئ الكود (Code Generation):
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```
4. تشغيل التطبيق:
   ```bash
   flutter run -d chrome  # أو الجهاز المستهدف
   ```

---

📱 **تطوير:** فريق PharmaFix
🔗 **المستودع:** [https://github.com/juba2222/pharmaFix](https://github.com/juba2222/pharmaFix)
