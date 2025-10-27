import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:elesafe_app/router/app_router.dart';

class AlertScreen extends StatelessWidget {
  const AlertScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<AlertLogDataModel> alerts = [
      AlertLogDataModel(
        title: 'Elephant detected near crossing 1',
        timestamp: '2025-10-04 21:32',
      ),
      AlertLogDataModel(
        title: 'Elephant detected near crossing 2',
        timestamp: '2025-10-04 21:32',
      ),
      AlertLogDataModel(
        title: 'Elephant detected near crossing 1',
        timestamp: '2025-10-04 21:32',
      ),
      AlertLogDataModel(
        title: 'Elephant detected near crossing 2',
        timestamp: '2025-10-04 21:32',
      ),
      AlertLogDataModel(
        title: 'Elephant detected near crossing 1',
        timestamp: '2025-10-04 21:32',
      ),
      AlertLogDataModel(
        title: 'Elephant detected near crossing 2',
        timestamp: '2025-10-04 21:32',
      ),
      AlertLogDataModel(
        title: 'Elephant detected near crossing 1',
        timestamp: '2025-10-04 21:32',
      ),
      AlertLogDataModel(
        title: 'Elephant detected near crossing 2',
        timestamp: '2025-10-04 21:32',
      ),
      AlertLogDataModel(
        title: 'Elephant detected near crossing 2',
        timestamp: '2025-10-04 21:32',
      ),
      AlertLogDataModel(
        title: 'Elephant detected near crossing 1',
        timestamp: '2025-10-04 21:32',
      ),
      AlertLogDataModel(
        title: 'Elephant detected near crossing 2',
        timestamp: '2025-10-04 21:32',
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
            onTap: () => context.push(AppRouter.mapPath),
            child: Container(
              margin: const EdgeInsets.only(bottom: 14),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.1),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
                border: Border.all(
                  color: Colors.grey.withValues(alpha: 0.2),
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  // Alert Icon
                  Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Color(0xFFff4444),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.error_outline,
                      color: Colors.white,
                      size: 24,
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
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            height: 1.3,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          alerts[index].timestamp,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[800],
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

class AlertLogDataModel {
  final String title;
  final String timestamp;

  AlertLogDataModel({
    required this.title,
    required this.timestamp,
  });
}
