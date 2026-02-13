import 'package:care_mall_affiliate/app/commenwidget/apptext.dart';
import 'package:care_mall_affiliate/app/theme_data/app_colors.dart';
import 'package:care_mall_affiliate/app/utils/spaces.dart';
import 'package:care_mall_affiliate/gen/assets.gen.dart';
import 'package:care_mall_affiliate/src/modules/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _phoneCtrl.dispose();
    super.dispose();
  }

  Future<void> _signup() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        // TODO: Implement your signup logic here
        // Example: await authService.requestLoginOtp(_phoneCtrl.text, "signup", _nameCtrl.text, _emailCtrl.text);

        // Simulated delay
        await Future.delayed(const Duration(seconds: 2));

        if (mounted) {
          // Show success message or navigate to next screen
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('OTP sent successfully!')),
          );
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Error: $e')));
        }
      } finally {
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: defaultPadding,
            vertical: defaultPaddingLarge,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 170,
                      height: 40,
                      child: Assets.icons.appLogoPng.image(
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    AppText(
                      text: 'Join the Care Mall Affiliate Program',
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textnaturalcolor,
                    ),
                  ],
                ),
                defaultSpacerLarge,

                // Title & Subtitle
                Text(
                  'Create an Account',
                  style: theme.textTheme.headlineMedium,
                ),
                defaultSpacerTiny,
                Text(
                  'Welcome! please enter your details.',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.textTheme.bodyMedium?.color?.withValues(
                      alpha: 0.7,
                    ),
                  ),
                ),
                defaultSpacerLarge,

                // Full Name
                AppText(
                  text: "Full Name",
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                defaultSpacerSmall,
                TextFormField(
                  controller: _nameCtrl,
                  decoration: InputDecoration(
                    hintText: 'Enter Name here',
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Assets.icons.user.svg(),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),

                    // 👇 When Enabled
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 1.5,
                      ),
                    ),

                    // 👇 When Focused
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: AppColors
                            .primarycolor, // change to your theme color
                        width: 2,
                      ),
                    ),

                    // 👇 When Error
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 1.5,
                      ),
                    ),

                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.red, width: 2),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your full name';
                    }
                    return null;
                  },
                ),
                defaultSpacer,

                // Email
                AppText(
                  text: "Email",
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                defaultSpacerSmall,
                TextFormField(
                  controller: _emailCtrl,
                  decoration: InputDecoration(
                    hintText: 'Enter Email here',
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Assets.icons.mail.svg(),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),

                    // 👇 When Enabled
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 1.5,
                      ),
                    ),

                    // 👇 When Focused
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: AppColors
                            .primarycolor, // change to your theme color
                        width: 2,
                      ),
                    ),

                    // 👇 When Error
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 1.5,
                      ),
                    ),

                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.red, width: 2),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(
                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                    ).hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                defaultSpacer,

                // Phone Number
                AppText(
                  text: "Phone Number",
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                defaultSpacerSmall,
                TextFormField(
                  controller: _phoneCtrl,
                  keyboardType: TextInputType.phone,
                  maxLength: 10,
                  decoration: InputDecoration(
                    counterText: '',
                    hintText: 'Enter Phone Number here',
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Assets.icons.phone.svg(),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),

                    // 👇 When Focused
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: AppColors.primarycolor,
                        width: 2,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    if (!RegExp(r'^\d{10,15}$').hasMatch(value)) {
                      return 'Please enter a valid phone number';
                    }
                    return null;
                  },
                ),
                defaultSpacer,

                // Password
                defaultSpacer24,

                // Sign Up Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _signup,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: _isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : Text(
                            'Sign Up',
                            style: TextStyle(color: Colors.white),
                          ),
                  ),
                ),
                defaultSpacer,
                defaultSpacer24,

                // Social Buttons
                //lready have an account text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: theme.textTheme.bodyMedium,
                    ),
                    TextButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const LoginScreen()),
                      ),
                      child: Text(
                        'Login',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: Colors.red,
                          fontSize: 15.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
