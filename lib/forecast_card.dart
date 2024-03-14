import 'package:flutter/material.dart';

class ForecastCard extends StatelessWidget {
  final IconData icon;
  final String time;
  final String temp;
  const ForecastCard({
    super.key,
    required this.icon,
    required this.time,
    required this.temp,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        width: 100,
        child: Column(
          children: [
            Text(
              time,
              style:const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Icon(
              icon,
              size: 32,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(temp),
          ],
        ),
      ),
    );
  }
}
