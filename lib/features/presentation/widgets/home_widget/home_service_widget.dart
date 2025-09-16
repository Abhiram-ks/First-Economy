import 'package:flutter/material.dart';

class ServicesGridWidget extends StatelessWidget {
  const ServicesGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Services',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 4,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          children: [
            _buildServiceItem(Icons.motorcycle, 'Two Wheeler\nLoan', Colors.blue),
            _buildServiceItem(Icons.person, 'Personal\nLoan', Colors.blue),
            _buildServiceItem(Icons.receipt, 'Pay Bills', Colors.blue),
            _buildServiceItem(Icons.credit_score, 'Credit\nScore', Colors.blue),
            _buildServiceItem(Icons.support_agent, 'Customer\nServicing', Colors.blue),
            _buildServiceItem(Icons.watch, 'Watch', Colors.blue),
            _buildServiceItem(Icons.quiz, 'Quiz &\nGames', Colors.blue),
            _buildServiceItem(Icons.ev_station, 'EV Charging\nLocation', Colors.blue),
          ],
        ),
      ],
    );
  }

  Widget _buildServiceItem(IconData icon, String title, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}