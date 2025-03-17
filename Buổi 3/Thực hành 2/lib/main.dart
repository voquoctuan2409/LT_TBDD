import 'package:flutter/material.dart';

// Màn hình chính (UTH Screen)
class UthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo UTH
            Image.asset(
              'assets/logo.png',
              height: 100,
              errorBuilder: (context, error, stackTrace) {
                return Text('Image not found',
                    style: TextStyle(color: Colors.red));
              },
            ),
            SizedBox(height: 20),
            Text(
              'UTH SmartTasks',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 40),
            // Nút để chuyển đến màn hình onboarding
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OnboardingScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'Start Onboarding',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Màn hình Onboarding
class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  // Dữ liệu cho các màn hình onboarding
  final List<Map<String, String>> onboardingData = [
    {
      'image': 'assets/time_management.png',
      'title': 'EASY TIME MANAGEMENT',
      'description':
          'With management based on priority and daily tasks, it will give you convenience in managing and determining the tasks that must be done first',
    },
    {
      'image': 'assets/work_effectiveness.png',
      'title': 'INCREASE WORK EFFECTIVENESS',
      'description':
          'Time management and the determination of more important tasks will give your job statistics better and always improve',
    },
    {
      'image': 'assets/reminder_notification.png',
      'title': 'REMINDER NOTIFICATION',
      'description':
          'The advantage of this application is that it also provides reminders for you so you don’t forget to keep doing your assignments well and according to the time you have set',
    },
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Chấm tròn (Dots Indicator)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(onboardingData.length, (index) {
                  return AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    width: _currentIndex == index ? 12.0 : 8.0,
                    height: 8.0,
                    decoration: BoxDecoration(
                      color: _currentIndex == index ? Colors.blue : Colors.grey,
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  );
                }),
              ),
            ),

            // Nút "Skip"
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextButton(
                  onPressed: () {
                    // Quay lại màn hình UTH khi nhấn "Skip"
                    Navigator.pop(context);
                  },
                  child: Text(
                    'skip',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
            ),

            // PageView
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: onboardingData.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Hình minh họa
                      Image.asset(
                        onboardingData[index]['image']!,
                        height: 200, // Chiều cao cố định cho các màn hình
                        errorBuilder: (context, error, stackTrace) {
                          return Text('Image not found',
                              style: TextStyle(color: Colors.red));
                        },
                      ),
                      SizedBox(height: 20),
                      // Tiêu đề
                      Text(
                        onboardingData[index]['title']!,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                      // Mô tả
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Text(
                          onboardingData[index]['description']!,
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),

            // Nút điều hướng (Back, Next/Get Started)
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center, // Đặt nút ở giữa
                children: [
                  // Nút Back (ẩn ở màn hình đầu tiên, đặt bên trái nếu có)
                  if (_currentIndex != 0)
                    IconButton(
                      onPressed: () {
                        _pageController.previousPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      icon: Icon(Icons.arrow_back, color: Colors.blue),
                    )
                  else
                    SizedBox(width: 0), // Bỏ khoảng trống không cần thiết

                  // Spacer để đẩy nút "Next"/"Get Started" vào giữa
                  Spacer(),

                  // Nút Next/Get Started (luôn ở giữa)
                  ElevatedButton(
                    onPressed: () {
                      if (_currentIndex == onboardingData.length - 1) {
                        // Quay lại màn hình UTH khi nhấn "Get Started"
                        Navigator.pop(context);
                      } else {
                        _pageController.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      _currentIndex == onboardingData.length - 1
                          ? 'Get Started'
                          : 'Next',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),

                  // Spacer để cân đối
                  Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UthScreen(), // Đặt UthScreen làm màn hình chính
      debugShowCheckedModeBanner: false, // Ẩn banner debug
    );
  }
}

void main() {
  runApp(MyApp());
}
