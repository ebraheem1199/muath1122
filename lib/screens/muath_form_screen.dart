import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/muath_text_field.dart';
import '../widgets/muath_button.dart';
import '../utils/muath_validators.dart';

class MuathFormScreen extends StatefulWidget {
  const MuathFormScreen({super.key});

  @override
  State<MuathFormScreen> createState() => _MuathFormScreenState();
}

class _MuathFormScreenState extends State<MuathFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _phoneController.dispose();
    _nameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('تم إرسال النموذج بنجاح'),
          backgroundColor: Colors.green,
        ),
      );
      // يمكنك إضافة المزيد من المنطق هنا
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('نموذج معاذ'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                MuathTextField(
                  label: 'البريد الإلكتروني',
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: MuathValidators.validateEmail,
                  hintText: 'example@email.com',
                ),
                MuathTextField(
                  label: 'رقم الهاتف',
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  validator: MuathValidators.validatePhone,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(10),
                  ],
                  hintText: '05xxxxxxxx',
                ),
                MuathTextField(
                  label: 'الاسم',
                  controller: _nameController,
                  validator: MuathValidators.validateName,
                  hintText: 'الاسم الكامل',
                ),
                MuathTextField(
                  label: 'العمر',
                  controller: _ageController,
                  keyboardType: TextInputType.number,
                  validator: MuathValidators.validateAge,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  hintText: 'أدخل عمرك',
                ),
                const SizedBox(height: 24),
                MuathButton(
                  text: 'إرسال النموذج',
                  onPressed: _submitForm,
                  width: 250,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
