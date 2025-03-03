import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    // Xử lý quay lại
                  },
                ),
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    // Xử lý chỉnh sửa thông tin
                  },
                ),
              ],
            ),
            Spacer(),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/avata.jpg'),
            ),
            SizedBox(height: 20),
            Text(
              "Võ Quốc Tuấn",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "Quy Nhơn, Bình Định",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
