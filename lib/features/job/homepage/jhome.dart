import 'package:flutter/material.dart';
import 'package:skilllink/core/common/custom_jobcard.dart';
import 'package:skilllink/core/themes/app_colors.dart';

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
}

class Jhome extends StatefulWidget {
  const Jhome({Key? key}) : super(key: key);

  @override
  State<Jhome> createState() => _JhomeState();
}

class _JhomeState extends State<Jhome> {
  final List<Job> _postedJobs = [
    // Example initial job
    Job(
      title: 'Plumber Needed',
      companyName: 'Local Plumbing Co.',
      location: 'Bengaluru, IN',
      salary: '\$25 - \$35/hour',
      postedDate: DateTime.now().subtract(const Duration(hours: 2)),
      jobTypes: ['On Site', 'Full Time'],
      shortDescription:
          'Looking for a skilled plumber for residential repairs and installations.',
      companyLogoUrl:
          'https://via.placeholder.com/80/ADD8E6/000000?Text=LP', // Placeholder logo
    ),
    Job(
      title: 'Electrician Apprentice',
      companyName: 'Bright Sparks Inc.',
      location: 'Whitefield, Bengaluru',
      salary: '\$18 - \$22/hour',
      postedDate: DateTime.now().subtract(const Duration(days: 1)),
      jobTypes: ['On Site', 'Part Time'],
      shortDescription:
          'Seeking a motivated apprentice electrician to assist with projects.',
      companyLogoUrl:
          'https://via.placeholder.com/80/FFFF00/000000?Text=BS', // Placeholder logo
    ),
  ];

  void _addJob(Job newJob) {
    setState(() {
      _postedJobs.insert(0, newJob);
    });
    _showSnackBar('Job posted and updated in the list!');
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: const Duration(seconds: 2)),
    );
  }

  void _showApplyOptions() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return _JobPostingForm(onJobPosted: _addJob);
      },
    );
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays > 0) {
      return '${difference.inDays} day${difference.inDays == 1 ? '' : 's'} ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hour${difference.inHours == 1 ? '' : 's'} ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} minute${difference.inMinutes == 1 ? '' : 's'} ago';
    } else {
      return 'Just now';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Find Your Dream Job'),
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.blue,
        elevation: 1.0,
        centerTitle: true,
      ),
      backgroundColor: AppColors.grey,
      body: Padding(
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
              'Explore Opportunities for Skilled Tradesmen',
              style: TextStyle(fontSize: 18, color: Colors.black87),
            ),
            const SizedBox(height: 20),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText:
                    'Search for jobs, skills, or companies (e.g., Electrician, Wiring)',
                fillColor: Colors.white,
                hintStyle: TextStyle(color: AppColors.black),
                prefixIcon: Icon(Icons.search, color: AppColors.blue),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.blue),
                ),
              ),
              cursorColor: AppColors.black,
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
            if (_postedJobs.isEmpty)
              const Text('No jobs posted yet.')
            else
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: _postedJobs
                        .map(
                          (job) => Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: CustomJobCard(
                              companyLogoUrl: job.companyLogoUrl,
                              companyName: job.companyName,
                              jobTitle: job.title,
                              datePosted: _formatDate(job.postedDate),
                              location: job.location,
                              jobTypeOnSite: job.jobTypes.contains('On Site')
                                  ? 'On Site'
                                  : '',
                              jobTypePartTime: job.jobTypes.contains('Part Time')
                                  ? 'Part Time'
                                  : '',
                              description: job.shortDescription,
                              onTap: () {
                                print('Tapped on ${job.title}');
                              },
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showApplyOptions,
        tooltip: 'Post a Job',
        backgroundColor: AppColors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _JobPostingForm extends StatefulWidget {
  final Function(Job) onJobPosted;

  const _JobPostingForm({Key? key, required this.onJobPosted})
      : super(key: key);

  @override
  State<_JobPostingForm> createState() => _JobPostingFormState();
}

class _JobPostingFormState extends State<_JobPostingForm> {
  final TextEditingController _jobTitleController = TextEditingController();
  final TextEditingController _jobDescriptionController =
      TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _salaryController = TextEditingController();
  final TextEditingController _companyNameController = TextEditingController();
  final List<String> _selectedJobTypes = [];
  final _formKey = GlobalKey<FormState>();

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: const Duration(seconds: 2)),
    );
  }

  bool _validateAndSubmit() {
    if (_formKey.currentState!.validate()) {
      final newJob = Job(
        title: _jobTitleController.text,
        companyName: _companyNameController.text,
        location: _locationController.text,
        salary: _salaryController.text,
        postedDate: DateTime.now(),
        jobTypes: _selectedJobTypes.toList(),
        shortDescription:
            _jobDescriptionController.text, // Using full description for now
        companyLogoUrl:
            'https://via.placeholder.com/80/${Colors.primaries[DateTime.now().millisecond % Colors.primaries.length].value.toRadixString(16).substring(2, 8).toUpperCase()}/FFFFFF?Text=${_companyNameController.text.substring(0, 2).toUpperCase()}', // Simple dynamic placeholder
      );

      widget.onJobPosted(newJob);
      _clearForm();
      Navigator.pop(context);
      return true;
    }
    return false;
  }

  void _clearForm() {
    _jobTitleController.clear();
    _jobDescriptionController.clear();
    _locationController.clear();
    _salaryController.clear();
    _companyNameController.clear();
    setState(() {
      _selectedJobTypes.clear();
    });
  }

  @override
  void dispose() {
    _jobTitleController.dispose();
    _jobDescriptionController.dispose();
    _locationController.dispose();
    _salaryController.dispose();
    _companyNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        16,
        16,
        16,
        MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: SingleChildScrollView(
        child: Form(
          //Wrap with a form
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Post a Job',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _jobTitleController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Job Title',
                  fillColor: AppColors.white,
                  hintStyle: TextStyle(color: AppColors.black),
                  prefixIcon: Icon(Icons.title, color: AppColors.blue),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.blue),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter job title';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _companyNameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Company Name',
                  fillColor: AppColors.white,
                  hintStyle: TextStyle(color: AppColors.black),
                  prefixIcon: Icon(Icons.business, color: AppColors.blue),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.blue),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter company name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _jobDescriptionController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  hintText:
                      'Job Description (e.g., Install and repair water systems...)',
                  fillColor: AppColors.white,
                  hintStyle: TextStyle(color: AppColors.black),
                  prefixIcon:
                      Icon(Icons.description, color: AppColors.blue),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.blue),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter job description';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _locationController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Location (e.g., City, State)',
                  fillColor: AppColors.white,
                  hintStyle: TextStyle(color: AppColors.black),
                  prefixIcon: Icon(Icons.location_on, color: AppColors.blue),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.blue),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter job location';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _salaryController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Salary (e.g., \$20 - \$30/hour)',
                  fillColor: AppColors.white,
                  hintStyle: TextStyle(color: AppColors.black),
                  prefixIcon:
                      Icon(Icons.monetization_on, color: AppColors.blue),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.blue),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter salary';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              const Text(
                'Job Type:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Checkbox(
                    value: _selectedJobTypes.contains('On Site'),
                    onChanged: (bool? value) {
                      setState(() {
                        if (value!) {
                          _selectedJobTypes.add('On Site');
                        } else {
                          _selectedJobTypes.remove('On Site');
                        }
                      });
                    },
                  ),
                  const Text('On Site'),
                  Checkbox(
                    value: _selectedJobTypes.contains('Part Time'),
                    onChanged: (bool? value) {
                      setState(() {
                        if (value!) {
                          _selectedJobTypes.add('Part Time');
                        } else {
                          _selectedJobTypes.remove('Part Time');
                        }
                      });
                    },
                  ),
                  const Text('Part Time'),
                  Checkbox(
                    value: _selectedJobTypes.contains('Remote'),
                    onChanged: (bool? value) {
                      setState(() {
                        if (value!) {
                          _selectedJobTypes.add('Remote');
                        } else {
                          _selectedJobTypes.remove('Remote');
                        }
                      });
                    },
                  ),
                  const Text('Remote'),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _validateAndSubmit();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.blue,
                ),
                child: const Text(
                  'Post Job',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

