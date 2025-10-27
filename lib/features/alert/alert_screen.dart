import 'package:flutter/material.dart';
import 'package:elesafe_app/features/map/map_screen.dart';

class AlertLog {
  final String title;
  final String timestamp;
  final IconData icon;

  AlertLog({
    required this.title,
    required this.timestamp,
    required this.icon,
  });
}

class AlertScreen extends StatelessWidget {
  const AlertScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<AlertLog> alerts = [
      AlertLog(
        title: 'Elephant detected\nnear crossing 1',
        timestamp: '2025-10-04 21:32',
        icon: Icons.error_outline,
      ),
      AlertLog(
        title: 'Elephant detected\nnear crossing 2',
        timestamp: '2025-10-04 21:32',
        icon: Icons.error_outline,
      ),
      AlertLog(
        title: 'Elephant detected\nnear crossing 1',
        timestamp: '2025-10-04 21:32',
        icon: Icons.error_outline,
      ),
      AlertLog(
        title: 'Elephant detected\nnear crossing 2',
        timestamp: '2025-10-04 21:32',
        icon: Icons.error_outline,
      ),
      AlertLog(
        title: 'Elephant detected\nnear crossing 1',
        timestamp: '2025-10-04 21:32',
        icon: Icons.error_outline,
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Alert Logs',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        itemCount: alerts.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MapScreen(),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 15),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
                border: Border.all(
                  color: Colors.grey.withOpacity(0.2),
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  // Alert Icon
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xFFff4444),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.error_outline,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  const SizedBox(width: 16),
                  
                  // Alert Details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          alerts[index].title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                            height: 1.3,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          alerts[index].timestamp,
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}