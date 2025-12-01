import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class CardsPage extends StatelessWidget {
  const CardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'My Cards',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          const SizedBox(height: 16),

          // Big card
          Container(
            width: double.infinity,
            height: 220,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(
                colors: [Color(0xFF1E1C3D), Color.fromARGB(255, 15, 15, 33)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 32,
                      height: 26,
                      decoration: BoxDecoration(
                        color: Colors.yellow[700],
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),

                    Text(
                      'BANK',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        fontSize: 16,
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                // Card number
                const Text(
                  '4567  ****  ****  1234',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    letterSpacing: 2,
                    textBaseline: TextBaseline.ideographic,
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'CARD HOLDER',
                          style: TextStyle(color: Colors.white60, fontSize: 10),
                        ),
                        SizedBox(height: 4),
                        Text(
                          ' RABIB AL ADIB',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'EXPIRES',
                          style: TextStyle(color: Colors.white60, fontSize: 12),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '12/28',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Action buttons
          Row(
            children: const [
              _CardActionButton(icon: Icons.close, label: 'Block'),
              _CardActionButton(icon: Icons.credit_card, label: 'Details'),
              _CardActionButton(icon: Icons.info_outline, label: 'Limit'),
            ],
          ),
          const SizedBox(height: 24),

          // Linked accounts card
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Linked Accounts',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 12),
                _LinkedAccountTile(
                  title: 'Shared Savings',
                  subtitle: '\$5,500.00',
                  balance: '',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CardActionButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const _CardActionButton({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
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
            Container(
              width: 30,
              height: 30,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primary50,
              ),
              child: Icon(
                icon,
                size: 20,
                fontWeight: FontWeight.w400,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 6),
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

class _LinkedAccountTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String balance;

  const _LinkedAccountTile({
    required this.title,
    required this.subtitle,
    required this.balance,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundColor: Color(0xFFF1F2F7),
            child: CircleAvatar(
              radius: 24, // adjust as needed
              backgroundColor: Color(0xFFE3EDFF), // light blue
              child: Text(
                'S',
                style: TextStyle(
                  color: Color(0xFF377DFF), // strong blue
                  fontWeight: FontWeight.w700,
                  fontSize: 28,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.arrow_forward, color: Colors.grey[600]),
        ],
      ),
    );
  }
}
