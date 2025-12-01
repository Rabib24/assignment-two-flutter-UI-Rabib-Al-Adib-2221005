import 'package:flutter/material.dart';

class _TransactionItem {
  final String title;
  final String subtitle;
  final String amount;
  final Color color;
  final IconData icon;

  const _TransactionItem({
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.color,
    required this.icon,
  });
}

final sampleTransactions = [
  const _TransactionItem(
    title: 'Netflix Subscription',
    subtitle: 'Entertainment · Today',
    amount: '-\$19.99',
    color: Colors.red,
    icon: Icons.movie,
  ),
  const _TransactionItem(
    title: 'Coffee Shop',
    subtitle: 'Food & Drink · Today',
    amount: '-\$4.50',
    color: Colors.red,
    icon: Icons.local_cafe,
  ),
  const _TransactionItem(
    title: 'Salary Deposit',
    subtitle: 'Income · Yesterday',
    amount: '+\$3,500.00',
    color: Colors.green,
    icon: Icons.payments,
  ),
  const _TransactionItem(
    title: 'Grocery Store',
    subtitle: 'Shopping · Yesterday',
    amount: '-\$55.80',
    color: Colors.red,
    icon: Icons.shopping_basket,
  ),
  const _TransactionItem(
    title: 'Amazon Purchase',
    subtitle: 'Shopping · 2 days ago',
    amount: '-\$120.45',
    color: Colors.red,
    icon: Icons.shopping_bag,
  ),
];
