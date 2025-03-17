import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo Thành phần UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UIComponentsListScreen(),
    );
  }
}

class UIComponentsListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Danh sách Thành phần UI'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildListTile(
                context, 'Text', 'Hiển thị văn bản', TextDetailScreen()),
            _buildListTile(
                context, 'Image', 'Hiển thị hình ảnh', ImageDetailScreen()),
            _buildListTile(context, 'TextField', 'Trường nhập văn bản',
                TextFieldDetailScreen()),
            _buildListTile(context, 'PasswordField', 'Trường nhập mật khẩu',
                PasswordFieldDetailScreen()),
            _buildListTile(
                context, 'Column', 'Bố cục dọc', ColumnDetailScreen()),
            _buildListTile(context, 'Row', 'Bố cục ngang', RowDetailScreen()),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile(
      BuildContext context, String title, String subtitle, Widget screen) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      tileColor: Colors.grey[200],
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
    );
  }
}

class TextDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildDetailScreen(
        context,
        'Chi tiết Văn bản',
        Text('The quick brown fox jumps over the lazy dog.',
            style: TextStyle(fontSize: 20)));
  }
}

class ImageDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildDetailScreen(
      context,
      'Chi tiết Hình ảnh',
      Image.asset('assets/image.png'),
    );
  }
}

class TextFieldDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildDetailScreen(
        context,
        'Chi tiết TextField',
        TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: 'Nhập văn bản')));
  }
}

class PasswordFieldDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildDetailScreen(
        context,
        'Chi tiết PasswordField',
        TextField(
            obscureText: true,
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: 'Nhập mật khẩu')));
  }
}

class ColumnDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildDetailScreen(
      context,
      'Chi tiết Column',
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Phần tử 1', style: TextStyle(fontSize: 18)),
          Text('Phần tử 2', style: TextStyle(fontSize: 18)),
          Text('Phần tử 3', style: TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}

class RowDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildDetailScreen(
      context,
      'Chi tiết Row',
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.star, color: Colors.yellow),
          SizedBox(width: 8),
          Text('Phần tử 1', style: TextStyle(fontSize: 18)),
          SizedBox(width: 8),
          Text('Phần tử 2', style: TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}

Widget _buildDetailScreen(BuildContext context, String title, Widget child) {
  return Scaffold(
    appBar: AppBar(
      title: Text(title),
    ),
    body: Center(child: child),
  );
}
