import 'package:flutter/material.dart';
import 'package:skilllink/core/themes/app_colors.dart';
import 'package:skilllink/core/common/custom_appbar.dart';
import 'package:skilllink/core/common/custom_jobcard.dart';

class Jhome extends StatefulWidget {
  const Jhome({Key? key}) : super(key: key);

  @override
  State<Jhome> createState() => _JhomeState();
}

class _JhomeState extends State<Jhome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Find Your Dream Job',
        showBackButton: false,
      ),
      backgroundColor: AppColors.grey,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Hello Job Seeker!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.blue,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Explore Exciting Opportunities',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: 'Search for jobs, skills, or companies...',
                prefixIcon: const Icon(Icons.search, color: AppColors.blue),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Featured Jobs',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            CustomJobCard(
              title: 'Software Engineer',
              company: 'Tech Innovations Inc.',
              location: 'Bengaluru',
              salary: '\$80,000 - \$120,000',
              onTap: () {
                print('Tapped on Software Engineer');
              },
            ),
            const SizedBox(height: 10),
            CustomJobCard(
              title: 'Data Analyst',
              company: 'Analytics Pro',
              location: 'Mumbai',
              salary: '\$60,000 - \$90,000',
              onTap: () {
                print('Tapped on Data Analyst');
              },
            ),
            const SizedBox(height: 20),
            Center(
              child: TextButton(
                onPressed: () {
                  print('View All Jobs');
                },
                child: const Text(
                  'View All Jobs',
                  style: TextStyle(
                    color: AppColors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}