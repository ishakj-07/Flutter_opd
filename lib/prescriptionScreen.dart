import 'package:flutter/material.dart';

class PrescriptionScreen extends StatefulWidget {
  const PrescriptionScreen({Key? key}) : super(key: key);

  @override
  State<PrescriptionScreen> createState() => _PrescriptionScreenState();
}

class _PrescriptionScreenState extends State<PrescriptionScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TabBar
            Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey.shade200, // Light background
                borderRadius: BorderRadius.circular(25),
              ),
              child: TabBar(
                controller: _tabController,
                indicator: BoxDecoration(
                  color: Color(0xFF738ED3), // Selected tab background
                  borderRadius: BorderRadius.circular(25),
                ),
                indicatorPadding: const EdgeInsets.symmetric(horizontal: -35),
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.black,
                tabs: const [
                  Tab(
                    child: Text(
                      'Patients Prescription',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Patients Bill Generator',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Search Bar
            Container(
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: const [
                  Icon(Icons.search, color: Colors.black54),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Content Area (TabBarView)
            //  SizedBox(
            // height: 200, // Set height for TabBarView to prevent stretching
            //child: TabBarView(
            //  controller: _tabController,
            //  children: const [
            // Center(child: Text('Patients Prescription Content')),
            //Center(child: Text('Patients Bill Generator Content')),
            // ],
            // ),
            //  ),

            // Space between TabBarView and Patient Details
            const SizedBox(height: 20),

            // Title with background
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.blueGrey.shade300,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'Patient Details:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Patient Info
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Patient ID:'),
                  const SizedBox(height: 10),
                  const Text('Name:'),
                  const SizedBox(height: 20),
                  // Row for Age, Sex, Height
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Age:'),
                      Text('Sex:'),
                      Text('Height:'),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Row for Weight, BMI, Blood Pressure
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Weight:'),
                      Text('BMI:'),
                      Text('Blood Pressure:'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
