import 'package:flutter/material.dart';
import '../../../../app/theme/app_colors.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(0.7, 0.2),
            radius: 1.1,
            colors: [
              Color(0xFF102218),
              Color(0xFF050606),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                _navbar(context),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(child: _heroText()),
                      Expanded(child: _ridePreviewCard()),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _navbar(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Row(
        children: [
          Container(
            width: 58,
            height: 58,
            decoration: BoxDecoration(
              color: AppColors.greenEnd,
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
              fontSize: 30,
              fontWeight: FontWeight.w800,
            ),
          ),

          const Spacer(),

          _navText('Hoe het werkt'),
          const SizedBox(width: 52),
          _navText('Voor chauffeurs'),

          const Spacer(),

          TextButton(
            onPressed: () {
              // TODO: ga naar login
            },
            child: const Text(
              'Inloggen',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(width: 24),
          SizedBox(
            height: 58,
            child: ElevatedButton(
              onPressed: () {
                // TODO: ga naar aanmelden
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.neonGreen,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(horizontal: 30),
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
          ),
        ],
      ),
    );
  }

  Widget _heroText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.border),
            borderRadius: BorderRadius.circular(30),
            color: Colors.black.withOpacity(0.25),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 28,
                height: 28,
                decoration: const BoxDecoration(
                  color: Color(0xFF4C6A0A),
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: CircleAvatar(
                    radius: 7,
                    backgroundColor: AppColors.neonGreen,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                'Live in Amsterdam · Rotterdam · Utrecht',
                style: TextStyle(
                  color: AppColors.grey,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 42),

        const Text(
          'Een rit.',
          style: TextStyle(
            color: AppColors.white,
            fontSize: 92,
            height: 1.05,
            fontWeight: FontWeight.w900,
          ),
        ),
        const Text(
          'Eén tik\nweg.',
          style: TextStyle(
            color: AppColors.greenEnd,
            fontSize: 92,
            height: 1.05,
            fontWeight: FontWeight.w900,
          ),
        ),

        const SizedBox(height: 36),

        const SizedBox(
          width: 620,
          child: Text(
            'Boek een taxi in seconden, volg je chauffeur '
                'live op de kaart en betaal probleemloos. Of '
                'word zelf chauffeur en verdien op jouw schema.',
            style: TextStyle(
              color: AppColors.grey,
              fontSize: 26,
              height: 1.55,
            ),
          ),
        ),

        const SizedBox(height: 46),

        SizedBox(
          width: 290,
          height: 72,
          child: ElevatedButton.icon(
            onPressed: () {
              // TODO: boek rit actie
            },
            icon: const Icon(Icons.location_on_outlined),
            label: const Text('Boek een rit'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.neonGreen,
              foregroundColor: Colors.black,
              elevation: 20,
              shadowColor: AppColors.neonGreen.withOpacity(0.35),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              textStyle: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _ridePreviewCard() {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        width: 370,
        height: 370,
        padding: const EdgeInsets.all(42),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.06),
          borderRadius: BorderRadius.circular(36),
          border: Border.all(color: AppColors.border),
          boxShadow: [
            BoxShadow(
              color: AppColors.neonGreen.withOpacity(0.12),
              blurRadius: 120,
              spreadRadius: 20,
            ),
          ],
        ),
        child: Column(
          children: [
            _miniCard(
              label: 'Ophalen',
              value: 'Centraal Station',
            ),
            const SizedBox(height: 56),
            _miniCard(
              label: 'Bestemming',
              value: 'Vondelpark',
              price: '~ 12 min  € 41,40',
            ),
          ],
        ),
      ),
    );
  }

  Widget _miniCard({
    required String label,
    required String value,
    String? price,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(26),
      decoration: BoxDecoration(
        color: AppColors.dark,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: AppColors.grey,
              fontSize: 17,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 22,
              fontWeight: FontWeight.w800,
            ),
          ),
          if (price != null) ...[
            const SizedBox(height: 32),
            Text(
              price,
              style: const TextStyle(
                color: AppColors.neonGreen,
                fontSize: 26,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _navText(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: AppColors.grey,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}