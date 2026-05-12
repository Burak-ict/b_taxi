import 'package:flutter/material.dart';
import '../../../../app/theme/app_colors.dart';

class LandingNavbar extends StatelessWidget {
  final VoidCallback? onLogin;
  final VoidCallback? onSignup;

  const LandingNavbar({
    super.key,
    this.onLogin,
    this.onSignup,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: Row(
        children: [
          _logo(),

          const SizedBox(width: 50),

          _navItem('Hoe het werkt'),
          const SizedBox(width: 40),
          _navItem('Voor chauffeurs'),

          const Spacer(),

          _loginButton(),
          const SizedBox(width: 20),
          _signupButton(),
        ],
      ),
    );
  }

  Widget _logo() {
    return Row(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: AppColors.neonGreen,
            borderRadius: BorderRadius.circular(18),
          ),
          child: const Icon(
            Icons.local_taxi_rounded,
            color: Colors.black,
          ),
        ),
        const SizedBox(width: 14),
        const Text(
          'B-Taxi',
          style: TextStyle(
            color: AppColors.white,
            fontSize: 28,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }

  Widget _navItem(String text) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Text(
        text,
        style: const TextStyle(
          color: AppColors.grey,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _loginButton() {
    return TextButton(
      onPressed: onLogin,
      child: const Text(
        'Inloggen',
        style: TextStyle(
          color: AppColors.white,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _signupButton() {
    return SizedBox(
      height: 60,
      child: ElevatedButton(
        onPressed: onSignup,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.neonGreen,
          foregroundColor: Colors.black,
          padding: const EdgeInsets.symmetric(horizontal: 28),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        child: const Text(
          'Aanmelden',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}