import 'package:flutter/material.dart';

class JobFilterScreen extends StatefulWidget {
  const JobFilterScreen({super.key});

  @override
  _JobFilterScreenState createState() => _JobFilterScreenState();
}

class _JobFilterScreenState extends State<JobFilterScreen> {
  List<Job> jobs = [
    Job(jobType: 'Full-Time', jobTitle: 'Software Engineer', country: 'USA'),
    Job(jobType: 'Part-Time', jobTitle: 'Data Analyst', country: 'India'),
    Job(jobType: 'Contract', jobTitle: 'UI/UX Designer', country: 'Canada'),
    Job(jobType: 'Full-Time', jobTitle: 'Backend Developer', country: 'USA'),
    Job(jobType: 'Part-Time', jobTitle: 'Project Manager', country: 'UK'),
    Job(jobType: 'Full-Time', jobTitle: 'DevOps Engineer', country: 'Germany'),
    Job(
        jobType: 'Contract',
        jobTitle: 'Mobile App Developer',
        country: 'Australia'),
    Job(
        jobType: 'Full-Time',
        jobTitle: 'Machine Learning Engineer',
        country: 'India'),
    Job(
        jobType: 'Part-Time',
        jobTitle: 'Quality Assurance Engineer',
        country: 'Singapore'),
    Job(jobType: 'Internship', jobTitle: 'Marketing Intern', country: 'USA'),
    Job(
        jobType: 'Full-Time',
        jobTitle: 'Cloud Architect',
        country: 'Netherlands'),
    Job(
        jobType: 'Part-Time',
        jobTitle: 'Customer Support Specialist',
        country: 'UK'),
    Job(
        jobType: 'Full-Time',
        jobTitle: 'Cybersecurity Specialist',
        country: 'USA'),
    Job(jobType: 'Contract', jobTitle: 'Game Developer', country: 'Canada'),
    Job(jobType: 'Part-Time', jobTitle: 'Content Writer', country: 'India'),
    Job(
        jobType: 'Full-Time',
        jobTitle: 'Business Analyst',
        country: 'South Africa'),
    Job(jobType: 'Freelance', jobTitle: 'SEO Consultant', country: 'Germany'),
    Job(
        jobType: 'Internship',
        jobTitle: 'Data Science Intern',
        country: 'France'),
    Job(jobType: 'Full-Time', jobTitle: 'Product Manager', country: 'Japan'),
    Job(
        jobType: 'Part-Time',
        jobTitle: 'Digital Marketing Specialist',
        country: 'Australia'),
  ];

  String? selectedSort; // For alphabetical sorting
  List<String> selectedJobTypes = []; // For job type filter (multiple)
  List<String> selectedCountries = []; // For country filter (multiple)

  List<String> sortOptions = ['Alphabetical'];
  List<String> jobTypes = ['Full-Time', 'Part-Time', 'Contract'];
  List<String> countries = ['USA', 'India', 'Canada', 'UK'];

  List<Job> filteredJobs = [];

  @override
  void initState() {
    super.initState();
    filteredJobs = jobs; // Initially, show all jobs
  }

  void applyFilters() {
    List<Job> result = jobs;

    // Filter by Job Types
    if (selectedJobTypes.isNotEmpty) {
      result = result
          .where((job) => selectedJobTypes.contains(job.jobType))
          .toList();
    }

    // Filter by Countries
    if (selectedCountries.isNotEmpty) {
      result = result
          .where((job) => selectedCountries.contains(job.country))
          .toList();
    }

    // Sort Alphabetically
    if (selectedSort == 'Alphabetical') {
      result.sort((a, b) => a.jobTitle.compareTo(b.jobTitle));
    }

    setState(() {
      filteredJobs = result;
    });
  }

  void showMultiSelectDialog({
    required String title,
    required List<String> options,
    required List<String> selectedItems,
    required ValueChanged<List<String>> onConfirm,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        List<String> tempSelectedItems = List.from(selectedItems);
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            title: Text(title),
            content: SingleChildScrollView(
              child: Column(
                children: options.map((option) {
                  return CheckboxListTile(
                    title: Text(option),
                    value: tempSelectedItems.contains(option),
                    onChanged: (isChecked) {
                      setState(() {
                        if (isChecked == true) {
                          tempSelectedItems.add(option);
                        } else {
                          tempSelectedItems.remove(option);
                        }
                      });
                    },
                  );
                }).toList(),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  onConfirm(tempSelectedItems);
                  Navigator.pop(context);
                },
                child: const Text('Apply'),
              ),
            ],
          );
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Job Filter')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                // Sort Dropdown
                Expanded(
                  child: DropdownButton<String>(
                    value: selectedSort,
                    hint: const Text('Sort by'),
                    items: sortOptions.map((sortOption) {
                      return DropdownMenuItem(
                        value: sortOption,
                        child: Text(sortOption),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedSort = value;
                      });
                      applyFilters();
                    },
                  ),
                ),
                const SizedBox(width: 8),
                // Job Type Multi-select
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      showMultiSelectDialog(
                        title: 'Select Job Types',
                        options: jobTypes,
                        selectedItems: selectedJobTypes,
                        onConfirm: (selectedItems) {
                          setState(() {
                            selectedJobTypes = selectedItems;
                          });
                          applyFilters();
                        },
                      );
                    },
                    child: const Text('Job Types'),
                  ),
                ),
                const SizedBox(width: 8),
                // Country Multi-select
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      showMultiSelectDialog(
                        title: 'Select Countries',
                        options: countries,
                        selectedItems: selectedCountries,
                        onConfirm: (selectedItems) {
                          setState(() {
                            selectedCountries = selectedItems;
                          });
                          applyFilters();
                        },
                      );
                    },
                    child: const Text('Countries'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredJobs.length,
              itemBuilder: (context, index) {
                final job = filteredJobs[index];
                return JobCard(job: job);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Job {
  final String jobType;
  final String jobTitle;
  final String country;

  Job({required this.jobType, required this.jobTitle, required this.country});
}

class JobCard extends StatelessWidget {
  final Job job;

  const JobCard({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Job Title
            Text(
              job.jobTitle,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            // Chips for Job Type and Country
            Wrap(
              spacing: 8,
              children: [
                // Job Type Chip
                Chip(
                  label: Text(
                    job.jobType,
                    style: const TextStyle(color: Colors.white),
                  ),
                  backgroundColor: _getJobTypeColor(job.jobType),
                ),
                // Country Chip
                Chip(
                  label: Text(
                    job.country,
                    style: const TextStyle(color: Colors.white),
                  ),
                  backgroundColor: _getCountryColor(job.country),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to get a color based on job type
  Color _getJobTypeColor(String jobType) {
    switch (jobType) {
      case 'Full-Time':
        return Colors.green;
      case 'Part-Time':
        return Colors.blue;
      case 'Contract':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  // Helper method to get a color based on country
  Color _getCountryColor(String country) {
    switch (country) {
      case 'USA':
        return Colors.red;
      case 'India':
        return Colors.purple;
      case 'Canada':
        return Colors.teal;
      case 'UK':
        return Colors.indigo;
      default:
        return Colors.grey;
    }
  }
}
