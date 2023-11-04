import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Color(0xFF2CDC20),
        elevation: 0.0,
        actions: [
          Center(
            // Wrap the icon in a Center widget
            child: Container(
              margin: EdgeInsets.only(right: 16),
              padding: EdgeInsets.all(10),
              child: ClipOval(
                child: Icon(
                  Icons.home,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ),
          ),
        ],
        title: Text(
          'Security',
          style: Theme.of(context).textTheme.headline4?.copyWith(
                color: Colors.white, // Text color for heading
              ),
        ),
      ),
      body: Center(
        // Center the content horizontally and vertically
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center vertically
          crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally
          children: [
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add your button action here
              },
              child: Text('Visitor Request'),
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF2CDC20), // Green color
              ),
            ),
            const SizedBox(height: 10), // Add some spacing between buttons
            ElevatedButton(
              onPressed: () {
                // Add your button action here
              },
              child: Text('Garbage Notification'),
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF2CDC20), // Green color
              ),
            ),
            const SizedBox(height: 10), // Add some spacing between buttons
            ElevatedButton(
              onPressed: () {
                // Add your button action here
              },
              child: Text('Maintenance'),
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF2CDC20), // Green color
              ),
            ),
          ],
        ),
      ),
    );
  }
}
