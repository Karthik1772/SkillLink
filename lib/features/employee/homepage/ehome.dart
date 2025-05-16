import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Mock data for job cards (replace with your actual data source)
List<Map<String, String>> _jobList = [
  {
    'title': 'Software Engineer',
    'company': 'Tech Innovators Inc.',
    'location': 'San Francisco, CA',
    'salary': '\$120,000 - \$150,000',
    'tags': 'Full-time, Engineering, Remote',
    'image': 'https://via.placeholder.com/150', // Replace with actual image URLs
  },
  {
    'title': 'Data Scientist',
    'company': 'DataWise Solutions',
    'location': 'New York, NY',
    'salary': '\$110,000 - \$140,000',
    'tags': 'Full-time, Data Science, On-site',
    'image': 'https://via.placeholder.com/150',
  },
  {
    'title': 'UX/UI Designer',
    'company': 'Creative Designs Co.',
    'location': 'Los Angeles, CA',
    'salary': '\$90,000 - \$120,000',
    'tags': 'Contract, Design, Remote',
    'image': 'https://via.placeholder.com/150',
  },
  {
    'title': 'Product Manager',
    'company': 'Global Corp',
    'location': 'Chicago, IL',
    'salary': '\$130,000 - \$160,000',
    'tags': 'Full-time, Product, Hybrid',
    'image': 'https://via.placeholder.com/150',
  },
  {
    'title': 'Frontend Developer',
    'company': 'Web Wizards',
    'location': 'Austin, TX',
    'salary': '\$100,000 - \$130,000',
    'tags': 'Full-time, Web Development, Remote',
    'image': 'https://via.placeholder.com/150',
  },
];

class Ehome extends StatefulWidget {
  const Ehome({super.key});

  @override
  State<Ehome> createState() => _EhomeState();
}

class _EhomeState extends State<Ehome> {
  @override
  Widget build(BuildContext context) {
    // Define the colors and text styles.  Using a separate class is good for
    final AppColors appColors = AppColors();
    final TextStyles textStyles = TextStyles();

    return Scaffold(
      backgroundColor: appColors.background,
      // Use a custom AppBar for more flexibility
      appBar: CustomAppBar(
        title: 'Find Your Dream Job',
        colors: appColors,
        textStyles: textStyles,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Added Buttons here
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle Explore Jobs
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: appColors.primary,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Explore Jobs'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle Apply for Jobs
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: appColors.primary,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Apply for Jobs'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _jobList.length,
                itemBuilder: (context, index) {
                  final job = _jobList[index];
                  return JobCard(job: job, colors: appColors, textStyles: textStyles);
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(colors: appColors),
    );
  }
}

//Custom App bar
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final AppColors colors;
  final TextStyles textStyles;

  const CustomAppBar({super.key, required this.title, required this.colors, required this.textStyles});

  @override
  Size get preferredSize => const Size.fromHeight(60.0); // Set the preferred height

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: colors.primary,
      title: Text(
        title,
        style: textStyles.appBarTitle,
      ),
      centerTitle: true, // Center the title
      elevation: 0, // Remove shadow for a cleaner look
      actions: [
        IconButton(
          icon: const Icon(Icons.settings, color: Colors.white),
          onPressed: () {
            // Navigate to the settings page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SettingsPage()),
            );
          },
        ),
      ],
    );
  }
}

//Custom Bottom Navigation Bar
class CustomBottomNavigationBar extends StatelessWidget {
  final AppColors colors;

  const CustomBottomNavigationBar({super.key, required this.colors});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: colors.bottomNavBackground,
      selectedItemColor: colors.bottomNavSelected,
      unselectedItemColor: colors.bottomNavUnselected,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      onTap: (index) {
        // Handle navigation based on the selected item
        if (index == 2) { // Profile
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ProfilePage()),
          );
        }
      },
    );
  }
}

// Job Card Widget
class JobCard extends StatelessWidget {
  final Map<String, String> job;
  final AppColors colors;
  final TextStyles textStyles;

  const JobCard({super.key, required this.job, required this.colors, required this.textStyles});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: colors.cardBackground,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Job Image
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: NetworkImage(job['image'] ?? 'https://via.placeholder.com/150'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Job Details
            Text(
              job['title'] ?? 'Title N/A',
              style: textStyles.jobTitle.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 22,
              ),
            ),
            Text(
              job['company'] ?? 'Company N/A',
              style: textStyles.jobCompany.copyWith(
                color: colors.primary,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.location_on, size: 18, color: Colors.grey[600]),
                const SizedBox(width: 4),
                Text(
                  job['location'] ?? 'Location N/A',
                  style: textStyles.jobLocation.copyWith(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              job['salary'] ?? 'Salary N/A',
              style: textStyles.jobSalary.copyWith(
                color: Colors.green[700],
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 16),
            // Tags
            Wrap(
              spacing: 8,
              runSpacing: 4,
              children: (job['tags'] ?? '').split(', ').map((tag) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: colors.tagBackground,
                  ),
                  child: Text(
                    tag.trim(),
                    style: textStyles.jobTag.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

// Settings Page (Placeholder)
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: const Center(
        child: Text('Settings Page Content'),
      ),
    );
  }
}

// Profile Page (Placeholder)
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: const Center(
        child: Text('Profile Page Content'),
      ),
    );
  }
}

// Custom color palette for the app.
class AppColors {
  final Color primary = const Color(0xFF007BFF); // Blue
  final Color background = const Color(0xFFF5F5F5); // Light gray
  final Color cardBackground = Colors.white;
  final Color tagBackground = const Color(0xFFE0E0E0); // Light gray for tags
  final Color bottomNavBackground = Colors.white;
  final Color bottomNavSelected = const Color(0xFF007BFF);
  final Color bottomNavUnselected = Colors.grey;
  final Color error = Colors.red;
}

// Custom text styles for the app.
class TextStyles {
  final TextStyle appBarTitle = GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
  final TextStyle jobTitle = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );
  final TextStyle jobCompany = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Colors.grey[600],
  );
  final TextStyle jobLocation = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Colors.grey[700],
  );
  final TextStyle jobSalary = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.green,
  );
  final TextStyle jobTag = GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: Colors.black87,
  );
}

// SplashScreen Widget
class SplashScreen extends StatefulWidget {
  final Widget? nextScreen;
  const SplashScreen({super.key, this.nextScreen});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Simulate loading
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => widget.nextScreen ?? const Ehome()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().primary, // Use your primary color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //  Add a logo here
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white), // White indicator
            ),
            const SizedBox(height: 16),
            const Text(
              'SkillLink', // App name
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SkillLink',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const SplashScreen(nextScreen: Ehome()), // Use SplashScreen as the initial route
    );
  }
}

void main() {
  runApp(const MyApp());
}