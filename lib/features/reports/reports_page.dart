import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/widgets/student_app_bar.dart';

class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final spending = [
      _SpendingItem('Food & Drink', 450.00, 0.35, Colors.red),
      _SpendingItem('Shopping', 320.00, 0.25, Colors.blue),
      _SpendingItem('Housing', 280.00, 0.22, Colors.amber),
      _SpendingItem('Transport', 150.00, 0.12, Colors.green),
      _SpendingItem('Other', 70.00, 0.06, Colors.grey[350]!),
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Monthly Spending Report',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            const SizedBox(height: 10),

            // Total expenses card with shadow
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.09),
                    blurRadius: 22,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Total Expenses (Last 30 days)',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Text(
                    '-\$1270.00',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 29,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: const [
                      Icon(Icons.arrow_upward, color: Colors.red, size: 17),
                      SizedBox(width: 5),
                      Text(
                        'Up 12% from last month',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),

            // Spending breakdown card with shadow
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.09),
                    blurRadius: 22,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Spending Breakdown',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.5,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ...spending.map((item) => _SpendingRow(item: item)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SpendingItem {
  final String category;
  final double amount;
  final double percent; // 0–1
  final Color color;

  _SpendingItem(this.category, this.amount, this.percent, this.color);
}

class _SpendingRow extends StatelessWidget {
  final _SpendingItem item;

  const _SpendingRow({required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  item.category,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 13.5,
                  ),
                ),
              ),
              Text(
                '\$${item.amount.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 13.5,
                  color: Colors.black,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                '(${(item.percent * 100).toStringAsFixed(0)}%)',
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                  fontSize: 11.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: item.percent,
              minHeight: 8,
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation<Color>(item.color),
            ),
          ),
        ],
      ),
    );
  }
}
