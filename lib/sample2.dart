import 'package:flutter/material.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({Key? key}) : super(key: key);

  @override
  AppointmentScreenState createState() => AppointmentScreenState();
}

class AppointmentScreenState extends State<AppointmentScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Declare the selected doctor
  String? selectedDoctor;

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
      body: Column(
        children: [
          const SizedBox(height: 40), // Safe area adjustment (optional)

          // Tab Bar
          Container(
            height: 40,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(20),
            ),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                color: Colors.blue.shade200,
                borderRadius: BorderRadius.circular(20),
              ),
              indicatorPadding: const EdgeInsets.symmetric(horizontal: -40),
              labelColor: Colors.black,
              unselectedLabelColor: Colors.black54,
              tabs: const [
                Tab(text: "Upcoming Appointment"),
                Tab(text: "Appointments Done"),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  const Icon(Icons.search, color: Colors.black54),
                  const SizedBox(width: 8),
                  const Expanded(
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
          ),

          const SizedBox(height: 20),

          // Select Doctor Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              height: 60,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  const Icon(Icons.person, color: Colors.black54),
                  const SizedBox(width: 8),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: selectedDoctor,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedDoctor = newValue;
                        });
                      },
                      items: ['Dr. Sharma', 'Dr. Verma', 'Dr. Kapoor']
                          .map((doctor) => DropdownMenuItem(
                                value: doctor,
                                child: Center(child: Text(doctor)),
                              ))
                          .toList(),
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 0, 0, 0),
                            width: 2,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                      hint: const Center(
                        child: Text(
                          'Select Doctor',
                          style: TextStyle(
                            color: Color.fromARGB(255, 120, 117, 117),
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      isExpanded: true,
                      alignment: Alignment.center,
                    ),
                  ),
                  const Icon(Icons.arrow_drop_down, color: Colors.black54),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Tab Bar View (Compulsory for TabBar)
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                Center(child: Text('Upcoming Appointments List')),
                Center(child: Text('Appointments Done List')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
