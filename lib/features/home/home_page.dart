import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../assets/data/transactions.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final transactions = sampleTransactions;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Total balance card
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              gradient: const LinearGradient(
                colors: [Color(0xFF5B4BFE), Color(0xFF7F5AFE)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Balance',
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                    Icon(Icons.card_membership, color: Colors.white, size: 30),
                  ],
                ),
                SizedBox(height: 3),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      '\$8,945',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '.32',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                // white line
                Divider(color: Colors.white24, thickness: 0.8, height: 16),

                SizedBox(height: 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Savings: \$5,500',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    Row(
                      children: [
                        Icon(Icons.arrow_upward, color: Colors.white, size: 16),
                        SizedBox(width: 4),
                        Text(
                          'Last 30 days: +\$300',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                        SizedBox(width: 8),
                        Text(
                          '->',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Quick actions
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              _HomeActionButton(icon: Icons.swap_horiz, label: 'Transfer'),
              _HomeActionButton(icon: Icons.receipt_long, label: 'Pay Bills'),
              _HomeActionButton(icon: Icons.trending_up, label: 'Invest'),
            ],
          ),
          const SizedBox(height: 24),

          // Recent transactions header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Recent Transactions',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                'View All',
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Transaction list
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: transactions.length,
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              final tx = transactions[index];
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: const Color(0xFFF1F2F7),
                      child: Icon(tx.icon, color: Colors.black54),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tx.title,
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            tx.subtitle,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 126, 126, 126),
                              fontSize: 12,

                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      tx.amount,
                      style: TextStyle(
                        color: tx.color,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _HomeActionButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const _HomeActionButton({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 14),
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          children: [
            Icon(icon, color: AppColors.primary, size: 28),
            const SizedBox(height: 10),
            Text(
              label,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
