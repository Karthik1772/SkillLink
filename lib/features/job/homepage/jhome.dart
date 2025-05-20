import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Job {
  final String title;
  final String companyName;
  final String location;
  final String salary;
  final DateTime postedDate;
  final List<String> jobTypes;
  final String shortDescription;
  final String companyLogoUrl;

  Job({
    required this.title,
    required this.companyName,
    required this.location,
    required this.salary,
    required this.postedDate,
    required this.jobTypes,
    required this.shortDescription,
    required this.companyLogoUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'companyName': companyName,
      'location': location,
      'salary': salary,
      'postedDate': postedDate.toIso8601String(),
      'jobTypes': jobTypes,
      'shortDescription': shortDescription,
      'companyLogoUrl': companyLogoUrl,
    };
  }

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      title: json['title'],
      companyName: json['companyName'],
      location: json['location'],
      salary: json['salary'],
      postedDate: DateTime.parse(json['postedDate']),
      jobTypes: List<String>.from(json['jobTypes']),
      shortDescription: json['shortDescription'],
      companyLogoUrl: json['companyLogoUrl'],
    );
  }
}

class Jhome extends StatefulWidget {
  const Jhome({super.key});

  @override
  State<Jhome> createState() => _JhomeState();
}

class _JhomeState extends State<Jhome> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  // Sample data for featured jobs (replace with your actual data source)
  final List<Job> _featuredJobs = [
    Job(
      title: "Public Relations",
      companyName: "Reddit",
      location: "Sulaymaniyah",
      salary: "\$50,000 - \$70,000",
      postedDate: DateTime.now().subtract(const Duration(days: 5)),
      jobTypes: ["On Site", "Part Time", "Sulaymaniyah"],
      shortDescription: "This is a featured public relations job at Reddit.",
      companyLogoUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-nuBzsGwqhxuMohWpYeHlzozjgdgH-rquGw&s",
    ),
    Job(
      title: "Marketing Manager",
      companyName: "Google",
      location: "Erbil",
      salary: "\$60,000 - \$80,000",
      postedDate: DateTime.now().subtract(const Duration(days: 10)),
      jobTypes: ["Remote", "Contract", "Erbil"],
      shortDescription:
          "We’re looking for someone to lead campaigns across digital platforms and increase user engagement.",
      companyLogoUrl:
          "https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png",
    ),
    Job(
      title: "Growth Hacker",
      companyName: "Facebook",
      location: "Baghdad",
      salary: "\$70,000 - \$90,000",
      postedDate: DateTime.now().subtract(const Duration(days: 15)),
      jobTypes: ["On Site", "Full Time", "Baghdad", "Growth Hacking", "Marketing"],
      shortDescription:
          "We are hiring a Head of Growth to help us build an audience and expand beyond our community of early adopters.",
      companyLogoUrl: "https://www.facebook.com/images/fb_icon_325x325.png",
    ),
    // Add more job data here
  ];
  final PageController _pageController = PageController(viewportFraction: 0.8);
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Job Finder',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              _scaffoldKey.currentState?.openDrawer();
            },
            child: const CircleAvatar(
              backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=4'),
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage:
                        NetworkImage('https://i.pravatar.cc/150?img=4'),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Sadeq Al-mehana',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'sadeq@cv.com',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person_outline),
              title: const Text('Profile'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.notifications_none),
              title: const Text('Notifications'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.language),
              title: const Text('Language'),
              subtitle: const Text('English'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.brightness_4_outlined),
              title: const Text('Theme'),
              subtitle: const Text('Light'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildFilterChips(),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
                child: Text(
                  "Featured Jobs",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 250,
                child: _buildFeaturedJobs(),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
                child: Text(
                  "Recent Jobs",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              _buildRecentJobs(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'Saved'),
        ],
      ),
    );
  }

  Widget _buildFilterChips() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          _buildChip("All", true),
          _buildChip("Public Relations", false),
          _buildChip("Brand Manager", false),
        ],
      ),
    );
  }

  Widget _buildChip(String label, bool selected) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
      child: ChoiceChip(
        label: Text(label),
        selected: selected,
        selectedColor: Colors.blue,
        labelStyle: TextStyle(color: selected ? Colors.white : Colors.black),
        onSelected: (_) {},
      ),
    );
  }

  Widget _buildFeaturedJobs() {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            itemCount: _featuredJobs.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              final job = _featuredJobs[index];
              return _jobCard(
                company: job.companyName,
                date:
                    "${job.postedDate.day} ${job.postedDate.month}, ${job.postedDate.year}",
                position: job.title,
                tags: job.jobTypes,
                isFeatured: true,
                description: job.shortDescription,
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: SmoothPageIndicator(
            controller: _pageController,
            count: _featuredJobs.length,
            effect: const WormEffect(
              activeDotColor: Colors.blue,
              dotColor: Colors.grey,
              radius: 8,
              spacing: 10,
            ),
            onDotClicked: (index) {
              _pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildRecentJobs() {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      children: [
        _jobCard(
          company: "Reddit",
          date: "October 9, 2022",
          position: "Public Relations",
          description:
              "We are hiring a Head of Growth to help us build an audience and expand beyond our community of early adopters. This is a long description to test the overflow issue.",
          tags: ["On Site", "Full Time", "Baghdad", "Growth Hacking", "Marketing"],
          isFeatured: false,
        ),
        _jobCard(
          company: "Reddit",
          date: "October 9, 2022",
          position: "Marketing Manager",
          description:
              "We’re looking for someone to lead campaigns across digital platforms and increase user engagement. Another long description for testing.",
          tags: ["Remote", "Contract", "Erbil"],
          isFeatured: false,
        ),
      ],
    );
  }

  Widget _jobCard({
    required String company,
    required String date,
    required String position,
    required List<String> tags,
    bool isFeatured = false,
    String? description,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 12), // Added vertical margin
      child: Card(
        color: isFeatured ? Colors.blue : Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: isFeatured ? 2 : 1,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-nuBzsGwqhxuMohWpYeHlzozjgdgH-rquGw&s",
                    ),
                    radius: 20,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          company,
                          style: TextStyle(
                            color: isFeatured ? Colors.white : Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          date,
                          style: TextStyle(
                              color: isFeatured ? Colors.white70 : Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.bookmark_border,
                    color: isFeatured ? Colors.white : Colors.black,
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                position,
                style: TextStyle(
                  color: isFeatured ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (description != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    description,
                    style: TextStyle(
                      color: isFeatured ? Colors.white70 : Colors.grey[700],
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                children: tags
                    .map((tag) => Chip(
                          label: Text(tag),
                          backgroundColor: isFeatured
                              ? Colors.white24
                              : const Color(0xFFF0F0F0),
                          labelStyle: TextStyle(
                            color: isFeatured ? Colors.white : Colors.black,
                          ),
                        ))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

