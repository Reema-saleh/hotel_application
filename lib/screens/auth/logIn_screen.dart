import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter/material.dart';
import 'package:hotel_application/app.dart';
import 'package:hotel_application/components/button_widget.dart';
import 'package:hotel_application/components/gradient_button_widget.dart';
import 'package:hotel_application/components/textfield_widget.dart';
import 'package:hotel_application/constants/spaces.dart';
import 'package:hotel_application/db_services/services.dart';
import 'package:hotel_application/extension/nav.dart';
import 'package:hotel_application/extension/screen_size.dart';
import 'package:hotel_application/extension/validation.dart';
import 'package:hotel_application/screens/auth/signup_screen.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

bool _loading = false;
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    final supabase1 = Supabase.instance.client;
    debugPrint('Token: ${supabase1.auth.currentSession?.accessToken}');
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Stack(
            children: [
              SizedBox(
                height: context.getHeight,
                width: context.getWidth,
              ),
              Image.asset(
                'assets/images/10.png',
                height: context.getHeight / 3,
                width: context.getWidth,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: context.getHeight / 3.4,
                child: Container(
                  width: context.getWidth,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      color: Colors.white),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Column(
                    children: [
                      kHSpace16,
                      const Text(
                        'Welcome Back',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      kHSpace8,
                      TextfieldWidget(
                        controller: emailController,
                        preIcon: const Icon(Icons.email_outlined),
                        label: 'Email',
                      ),
                      kHSpace16,
                      TextfieldWidget(
                        obscureText: true,
                        controller: passwordController,
                        preIcon: const Icon(Icons.lock_outline),
                        label: 'Password',
                      ),
                      kHSpace16,
                      GradientButtonWidget(
                        onPressed: () async {
                          setState(() {
                            _loading = true;
                          });
                          try {
                            final email = emailController.text;
                            final password = passwordController.text;
                            if (email.isNotEmpty &&
                                password.isNotEmpty &&
                                email.isValidEmail) {
                              await SupabaseClass.supabase.auth
                                  .signInWithPassword(
                                email: email,
                                password: password,
                              );
                              if (context.mounted) {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const App()),
                                    (route) {
                                  return false;
                                });
                              }
                            }
                          } catch (e) {
                            ElegantNotification.error(
                                    title: const Text("Login failed"),
                                    description: const Text("Please try again"))
                                .show(context);
                          }
                        },
                        text: 'Login',
                      ),
                      kHSpace8,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Dont have an account?'),
                          TextButton(
                            onPressed: () {
                              const SignUpScreen().push(context);
                            },
                            child: const Text('Sign up'),
                          ),
                        ],
                      ),
                      kHSpace8,
                      ButtonWidget(
                        text: 'Continue with phone number',
                        icon: Icons.phone,
                        buttonAction: () {},
                        width: context.getWidth - 100,
                        buttonColor: Colors.white,
                        textColor: Colors.black,
                      ),
                      ButtonWidget(
                        text: 'Countinue with google',
                        icon: FontAwesome.google,
                        buttonAction: () {},
                        width: context.getWidth - 100,
                        buttonColor: Colors.white,
                        textColor: Colors.black,
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
