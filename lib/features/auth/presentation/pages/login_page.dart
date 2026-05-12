import 'package:flutter/material.dart';
import '../../../../app/theme/app_colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

enum UserRole { passenger, driver }

class _LoginPageState extends State<LoginPage> {
  UserRole selectedRole = UserRole.passenger;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(56),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.greenStart,
                    AppColors.greenEnd,
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _logo(),
                  const Spacer(),
                  const Text(
                    'De stad onder je\nvingers.',
                    style: TextStyle(
                      fontSize: 52,
                      height: 1.15,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 28),
                  const Text(
                    'Boek, rij, verdien. Alles in één app — gemaakt\nom snel te bewegen.',
                    style: TextStyle(
                      fontSize: 24,
                      height: 1.4,
                      color: Colors.black87,
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    '© 2026 B-Taxi',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ),

          Expanded(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 64),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 560),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Welkom terug',
                        style: TextStyle(
                          fontSize: 44,
                          fontWeight: FontWeight.w800,
                          color: AppColors.white,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Log in om verder te gaan.',
                        style: TextStyle(
                          fontSize: 22,
                          color: AppColors.grey,
                        ),
                      ),
                      const SizedBox(height: 52),

                      _roleSwitch(),

                      const SizedBox(height: 40),
                      _label('E-mail'),
                      _input(emailController),

                      const SizedBox(height: 28),
                      _label('Wachtwoord'),
                      _input(passwordController, obscure: true),

                      const SizedBox(height: 34),
                      SizedBox(
                        width: double.infinity,
                        height: 68,
                        child: ElevatedButton(
                          onPressed: () {
                            // TODO: login logic
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.neonGreen,
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            elevation: 18,
                            shadowColor: AppColors.neonGreen.withOpacity(0.35),
                          ),
                          child: const Text(
                            'Inloggen',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 36),
                      Center(
                        child: RichText(
                          text: const TextSpan(
                            text: 'Nog geen account? ',
                            style: TextStyle(
                              color: AppColors.grey,
                              fontSize: 18,
                            ),
                            children: [
                              TextSpan(
                                text: 'Account aanmaken',
                                style: TextStyle(
                                  color: AppColors.neonGreen,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _logo() {
    return Row(
      children: [
        Container(
          width: 58,
          height: 58,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.18),
            borderRadius: BorderRadius.circular(18),
          ),
          child: const Icon(Icons.local_taxi_rounded, color: Colors.black),
        ),
        const SizedBox(width: 16),
        const Text(
          'B-Taxi',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w800,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _roleSwitch() {
    return Container(
      height: 68,
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: const Color(0xFF252525),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          _roleButton(
            title: 'Passagier',
            icon: Icons.person_outline,
            role: UserRole.passenger,
          ),
          _roleButton(
            title: 'Chauffeur',
            icon: Icons.local_taxi_outlined,
            role: UserRole.driver,
          ),
        ],
      ),
    );
  }

  Widget _roleButton({
    required String title,
    required IconData icon,
    required UserRole role,
  }) {
    final active = selectedRole == role;

    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => selectedRole = role),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          decoration: BoxDecoration(
            color: active ? Colors.black : Colors.transparent,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icon,
                  color: active ? Colors.white : AppColors.grey,
                ),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: active ? Colors.white : AppColors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _label(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        text,
        style: const TextStyle(
          color: AppColors.white,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _input(TextEditingController controller, {bool obscure = false}) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      style: const TextStyle(color: Colors.white, fontSize: 18),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.field,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 22,
          vertical: 22,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(
            color: AppColors.neonGreen,
            width: 1.5,
          ),
        ),
      ),
    );
  }
}