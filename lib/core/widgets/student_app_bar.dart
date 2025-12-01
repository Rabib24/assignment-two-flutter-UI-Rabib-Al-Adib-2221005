import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class StudentAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String studentName;
  final String title; 

  const StudentAppBar({super.key, required this.studentName, this.title = ''});

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: false,
      titleSpacing: 16,
      toolbarHeight: 80,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundColor: AppColors.primary,
                child: Text('RA', style: TextStyle(color: Colors.white)),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Welcome back,',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  Text(
                    studentName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  if (title.isNotEmpty) ...[
                    const SizedBox(height: 2),
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundColor: Color(0xFFE3EDFF),
                child: Icon(Icons.notifications_none, color: Colors.black87),
              ),
              Positioned(
                top: 4,
                right: 4,
                child: Container(
                  width: 7,
                  height: 7,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
