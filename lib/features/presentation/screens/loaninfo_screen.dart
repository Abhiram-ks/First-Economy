import 'package:flutter/material.dart';
import '../widgets/emi_widget/emi_dials_widget.dart';

class LoanInfoScreen extends StatelessWidget {
  const LoanInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          SizedBox(height: 40),
          Text(
            'Number Of EMIs',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 60),
          Expanded(
            child: Center(
              child: EmiDialWidget(),
            ),
          ),
        ],
      ),
    );
  }
}
