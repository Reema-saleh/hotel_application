import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter/material.dart';
import 'package:hotel_application/components/gradient_button_widget.dart';
import 'package:hotel_application/components/textfield_widget.dart';
import 'package:hotel_application/constants/spaces.dart';
import 'package:hotel_application/db_services/services.dart';
import 'package:hotel_application/utilitis/extension/nav.dart';
import 'package:hotel_application/utilitis/extension/screen_size.dart';
import 'package:hotel_application/utilitis/extension/validation.dart';
import 'package:hotel_application/screens/auth/logIn_screen.dart';
import 'package:hotel_application/screens/home_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

bool _loading = false;
TextEditingController nameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController ConfirmpasswordController = TextEditingController();

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    ConfirmpasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final supabase = Supabase.instance.client;
    debugPrint('Token: ${supabase.auth.currentSession?.accessToken}');
    debugPrint('Token: ${supabase.auth.currentSession?.user.id}');
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
                        'Create New Account',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      kHSpace8,
                      TextfieldWidget(
                        controller: nameController,
                        preIcon: const Icon(Icons.person),
                        label: 'Name',
                      ),
                      kHSpace16,
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
                      TextfieldWidget(
                        obscureText: true,
                        controller: ConfirmpasswordController,
                        preIcon: const Icon(Icons.lock_outline),
                        label: 'Confrim Password',
                      ),
                      kHSpace16,
                      GradientButtonWidget(
                        onPressed: () async {
                          setState(() {
                            _loading = true;
                          });
                          try {
                            final name = nameController.text;
                            final email = emailController.text;
                            final password = passwordController.text;
                            final confirmpassword =
                                ConfirmpasswordController.text;

                            if (email.isNotEmpty &&
                                email.isValidEmail &&
                                password.isNotEmpty &&
                                name.isNotEmpty) {
                              if (password == confirmpassword) {
                                await SupabaseClass.supabase.auth.signUp(
                                  email: email,
                                  password: password,
                                );

                                await SupabaseClass.supabase
                                    .from('user')
                                    .insert({
                                  "user_id": SupabaseClass
                                      .supabase.auth.currentUser!.id,
                                  "name": name,
                                  "email": email
                                });

                                if (context.mounted) {
                                  const Home().push(context);
                                }
                              } else {
                                ElegantNotification.error(
                                        title: const Text("Signup failed"),
                                        description: const Text(
                                            "Please make sure you entered right password confirm"))
                                    .show(context);
                              }
                            } else {
                              ElegantNotification.error(
                                      title: const Text("Signup failed"),
                                      description: const Text(
                                          "Please make sure you filled all the fields"))
                                  .show(context);
                            }
                          } catch (e) {
                            print(e);
                            ElegantNotification.error(
                                    title: const Text("Signup failed"),
                                    description: const Text("Please try again"))
                                .show(context);
                          }
                        },
                        text: 'Sign Up',
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Already have an account?'),
                          TextButton(
                            onPressed: () {
                              const LogInScreen().push(context);
                            },
                            child: const Text('Login'),
                          ),
                        ],
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
