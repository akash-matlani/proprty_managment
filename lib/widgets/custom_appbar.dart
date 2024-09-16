import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(150.0);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomAppBarClipper(),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF365774), // The background color (from the image)
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 20,
              offset: Offset(0, 10), // The shadow effect below the AppBar
            ),
          ],
        ),
        child: AppBar(
          backgroundColor: Colors.transparent, // Set AppBar background to transparent
          elevation: 0, // Remove default AppBar shadow
          title: Text("Title Here"), // Your title here
          centerTitle: true,
        ),
      ),
    );
  }
}

class CustomAppBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double controlPointHeight = 30.0; // The height of the curve

    path.lineTo(0, size.height - controlPointHeight);
    path.quadraticBezierTo(size.width / 2, size.height + controlPointHeight, size.width, size.height - controlPointHeight);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: CustomAppBar(),
      body: Center(child: Text("Custom App Bar")),
    ),
  ));
}
