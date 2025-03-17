import 'package:flutter/material.dart';
import 'package:zynk/constants/theme/colors/app_colors.dart';
import 'package:zynk/view/widgets/commone_app_bar.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // App Logo
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.red,
                //backgroundImage: AssetImage("assets/logo.png"), // Replace with your actual logo
              ),
            ),
            const SizedBox(height: 20),
            const Center(
              child: Text(
                "Zynk",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 25.0),
            const Text(
              "About the App",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Zynk Short Videos is a creative platform designed to empower users to express themselves through engaging short videos. Whether you're sharing moments, trends, or original content, this app provides the tools to make it happen effortlessly.\n"
              "I built this app as a personal project to explore Flutter's capabilities while creating an intuitive and feature-rich video-sharing experience. It’s designed for smooth performance, AI-driven recommendations, and a seamless user interface.",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              "Why I Built This",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "As a passionate Flutter developer, I wanted to challenge myself by building a fully functional short video app. The project allowed me to integrate Firebase, explore video processing, and enhance my understanding of UI/UX in mobile applications.\n\n"
              "This app isn't just about sharing videos—it's about providing a smooth and fun experience for users, built with modern technology.",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              "About Me",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "I'm a Flutter developer passionate about building sleek, high-performance mobile applications. I enjoy working with new technologies and constantly improving my skills through real-world projects like this one.",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              "Contact Me",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const ListTile(
              leading: Icon(Icons.email, color: AppColors.whiteColor),
              title: Text("your.email@example.com"), 
            ),
            const ListTile(
              leading: Icon(Icons.web, color: AppColors.whiteColor),
              title: Text("yourportfolio.com"), // Replace with your portfolio
            ),
            const ListTile(
              leading: Icon(Icons.code, color: AppColors.whiteColor),
              title: Text("github.com/yourusername"), // Replace with your GitHub
            ),
          ],
        ),
      ),
    );
  }
}
