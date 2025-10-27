import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:elesafe_app/router/app_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:elesafe_app/features/alert/models/alert_data_model.dart';

class AlertScreen extends StatelessWidget {
  const AlertScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample alerts with actual locations in Sri Lanka
    final List<AlertDataModel> alerts = [
      AlertDataModel(
        id: '1',
        title: 'Elephant detected near crossing 1',
        timestamp: '2025-10-27 21:32',
        location: const LatLng(7.2906, 80.6337), // Kandy area
        description: 'Wild elephant spotted crossing the road near Kandy',
      ),
      AlertDataModel(
        id: '2',
        title: 'Elephant detected near crossing 2',
        timestamp: '2025-10-27 20:15',
        location: const LatLng(8.3114, 80.4037), // Anuradhapura area
        description: 'Elephant herd detected near agricultural area',
      ),
      AlertDataModel(
        id: '3',
        title: 'Elephant detected near crossing 3',
        timestamp: '2025-10-27 19:45',
        location: const LatLng(6.9271, 79.8612), // Colombo outskirts
        description: 'Single elephant spotted near residential area',
      ),
      AlertDataModel(
        id: '4',
        title: 'Elephant detected near crossing 4',
        timestamp: '2025-10-27 18:20',
        location: const LatLng(7.9553, 81.0188), // Polonnaruwa area
        description: 'Multiple elephants near national park boundary',
      ),
      AlertDataModel(
        id: '5',
        title: 'Elephant detected near crossing 5',
        timestamp: '2025-10-27 17:50',
        location: const LatLng(6.0535, 80.2210), // Galle area
        description: 'Elephant crossing detected on coastal road',
      ),
      AlertDataModel(
        id: '6',
        title: 'Elephant detected near crossing 6',
        timestamp: '2025-10-27 16:30',
        location: const LatLng(8.5874, 81.2152), // Trincomalee area
        description: 'Young elephant spotted near village',
      ),
      AlertDataModel(
        id: '7',
        title: 'Elephant detected near crossing 7',
        timestamp: '2025-10-27 15:10',
        location: const LatLng(7.4818, 80.3609), // Matale area
        description: 'Elephant herd moving through forest edge',
      ),
      AlertDataModel(
        id: '8',
        title: 'Elephant detected near crossing 8',
        timestamp: '2025-10-27 14:25',
        location: const LatLng(6.9934, 81.0550), // Badulla area
        description: 'Elephant detected near tea plantation',
      ),
      AlertDataModel(
        id: '9',
        title: 'Elephant detected near crossing 9',
        timestamp: '2025-10-27 13:40',
        location: const LatLng(9.6615, 80.0255), // Jaffna area
        description: 'Elephant sighting reported in northern region',
      ),
      AlertDataModel(
        id: '10',
        title: 'Elephant detected near crossing 10',
        timestamp: '2025-10-27 12:55',
        location: const LatLng(7.8731, 80.7718), // Central Sri Lanka
        description: 'Elephant activity detected in central province',
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
            // Pass alert data to map screen using go_router extra parameter
            onTap: () => context.push(AppRouter.mapPath, extra: alerts[index]),
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
