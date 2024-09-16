
import 'package:flutter/material.dart';

class MaintenanceWidget extends StatefulWidget {
  const MaintenanceWidget({super.key});

  @override
  State<MaintenanceWidget> createState() => _MaintenanceWidgetState();
}

class _MaintenanceWidgetState extends State<MaintenanceWidget> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Maintenance"));
  }
}
