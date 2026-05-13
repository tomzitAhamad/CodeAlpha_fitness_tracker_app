import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class FitnessStatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const FitnessStatCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 32, color: AppColors.primary),

            const Spacer(),

            Text(
              value,
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            Text(title, style: const TextStyle(color: AppColors.grey)),
          ],
        ),
      ),
    );
  }
}
