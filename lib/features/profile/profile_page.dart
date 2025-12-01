import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    const studentName = 'RABIB AL ADIB';
    const studentId = '2221005';
    const email = '2221005@iub.edu.bd';

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const SizedBox(height: 8),
          const Text(
            'User Profile',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          const SizedBox(height: 16),

          // Avatar
          const CircleAvatar(
            radius: 40,
            backgroundColor: Color(0xFF5B4BFE),
            child: Text(
              'RA',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Info cards
          _InfoCard(label: 'Name', value: studentName),
          const SizedBox(height: 12),
          _InfoCard(label: 'Student ID', value: studentId),
          const SizedBox(height: 12),
          const _InfoCard(label: 'Email', value: email),
          const SizedBox(height: 20),

          // Bio / Story
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bio / Story',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 8),
                Text(
                  '“ I’m a Computer Science student at IUB, passionate about web development, system design, and AI. Most of my time goes into building side projects, exploring new tools, and learning from online resources. Outside of coding, I enjoy anime and late‑night tech deep dives. My goal is to turn my ideas into real products that can help students and campuses stay more connected.”',
                  style: TextStyle(fontSize: 13, fontStyle: FontStyle.italic),
                ),
                SizedBox(height: 8),
                Text(
                  'Note: You must update this text with your actual story before submitting.',
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String label;
  final String value;

  const _InfoCard({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w900,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
          ),
        ],
      ),
    );
  }
}
