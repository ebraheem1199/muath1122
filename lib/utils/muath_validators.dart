class MuathValidators {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'الرجاء إدخال البريد الإلكتروني';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'الرجاء إدخال بريد إلكتروني صحيح';
    }
    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'الرجاء إدخال رقم الهاتف';
    }
    if (value.length != 10) {
      return 'رقم الهاتف يجب أن يكون 10 أرقام';
    }
    if (!value.startsWith('05')) {
      return 'رقم الهاتف يجب أن يبدأ بـ 05';
    }
    return null;
  }

  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'الرجاء إدخال الاسم';
    }
    if (value.length < 3) {
      return 'الاسم يجب أن يكون 3 أحرف على الأقل';
    }
    final nameRegex = RegExp(r'^[\u0600-\u06FF\s]+$');
    if (!nameRegex.hasMatch(value)) {
      return 'الرجاء إدخال أحرف عربية فقط';
    }
    return null;
  }

  static String? validateAge(String? value) {
    if (value == null || value.isEmpty) {
      return 'الرجاء إدخال العمر';
    }
    final age = int.tryParse(value);
    if (age == null) {
      return 'الرجاء إدخال رقم صحيح';
    }
    if (age < 18 || age > 100) {
      return 'العمر يجب أن يكون بين 18 و 100';
    }
    return null;
  }
}
