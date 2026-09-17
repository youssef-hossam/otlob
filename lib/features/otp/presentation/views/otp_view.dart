import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:otlob/features/auth/repos/auth_repo.dart';
import 'package:otlob/nav_bar_view.dart';

class OtpView extends StatefulWidget {
  static const String routeName = '/otp';
  
  // يمكنك تمرير البريد الإلكتروني أو الهاتف لعرضه في الصفحة
  final String? emailOrPhone;

  const OtpView({super.key, this.emailOrPhone});

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  final int otpLength = 6;
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;
  
  int _remainingTime = 30; // عداد الثواني لإعادة الإرسال
  Timer? _timer;
  bool _canResend = false;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(otpLength, (index) => TextEditingController());
    _focusNodes = List.generate(otpLength, (index) => FocusNode());
    _startTimer();
  }

  void _startTimer() {
    setState(() {
      _remainingTime = 30;
      _canResend = false;
    });
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        setState(() {
          _remainingTime--;
        });
      } else {
        setState(() {
          _canResend = true;
        });
        _timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  String get _otpCode => _controllers.map((c) => c.text).join();

  void _verifyOtp() async {
    String code = _otpCode;
    if (code.length < otpLength) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter the full code')),
      );
      return;
    }
    
    print("Verifying OTP Code: $code");
    
    // إظهار مؤشر تحميل أثناء التأكيد
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator(color: Color(0xFFE91E63))),
    );

    // // استدعاء دالة التحقق من السيرفر
    // bool isVerified = await AuthRepo().verifyOtp(
    //   email: widget.emailOrPhone ?? "",
    //   code: code,
    // );

    if (context.mounted) {
      Navigator.pop(context); // إغلاق مؤشر التحميل
    }

    if (true) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Verification Successful!'), backgroundColor: Colors.green),
        );
        
        // الانتقال للـ NavBarView وحذف كل الصفحات السابقة حتى لا يعود لصفحة التسجيل عند الضغط على زر الرجوع
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const NavBarView()),
          (route) => false,
        );
      }
    } else {
      if (context.mounted) {
        // إظهار رسالة خطأ في حالة الكود غير صحيح
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Invalid verification code. Please try again.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              // أيقونة قفل أو التحقق علوية لتجميل الصفحة
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFEAEA),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.lock_open_rounded,
                  size: 50,
                  color: Color(0xFFE91E63),
                ),
              ),
              const SizedBox(height: 30),
              
              // عنوان الصفحة
              const Text(
                'Verification Code',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 12),
              
              // نص توضيحي
              Text(
                'Please enter the 6-digit code sent to\n${widget.emailOrPhone ?? "your email address"}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 40),

              // حقول الـ OTP
              Form(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(otpLength, (index) {
                    return SizedBox(
                      width: 48,
                      height: 55,
                      child: TextFormField(
                        controller: _controllers[index],
                        focusNode: _focusNodes[index],
                        onChanged: (value) {
                          if (value.length == 1) {
                            if (index < otpLength - 1) {
                              _focusNodes[index + 1].requestFocus();
                            } else {
                              _focusNodes[index].unfocus();
                              _verifyOtp(); // التأكيد تلقائياً عند إدخال آخر رقم
                            }
                          } else if (value.isEmpty) {
                            if (index > 0) {
                              _focusNodes[index - 1].requestFocus();
                            }
                          }
                        },
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Color(0xFFE0E0E0), width: 1.5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Color(0xFFE91E63), width: 2),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                        ),
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(height: 40),

              // مؤقت إعادة الإرسال
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Didn't receive code? ",
                    style: TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                  _canResend
                      ? GestureDetector(
                          onTap: () {
                            _startTimer();
                            // كود إعادة إرسال الـ OTP هنا
                          },
                          child: const Text(
                            "Resend",
                            style: TextStyle(
                              color: Color(0xFFE91E63),
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        )
                      : Text(
                          "00:${_remainingTime.toString().padLeft(2, '0')}",
                          style: const TextStyle(
                            color: Color(0xFFE91E63),
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                ],
              ),
              const SizedBox(height: 40),

              // زر التأكيد (Verify)
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE91E63),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  onPressed: _verifyOtp,
                  child: const Text(
                    'Verify',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}