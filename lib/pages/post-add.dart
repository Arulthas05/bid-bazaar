import 'dart:math';
import 'package:bid_bazaar/pages/payment-page.dart';
import 'package:bid_bazaar/pages/profile-page.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../config/config.dart';

class PostAdd extends StatefulWidget {
  const PostAdd({super.key});

  @override
  State<PostAdd> createState() => _PostAddState();
}

class _PostAddState extends State<PostAdd> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController minBidAmountController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  // Dropdown values
  String? selectedType;
  List<String> types = ['House', 'Apartment', 'Land'];

  // Radio button values

  String? selectedCondition;
  String? selectedCondition1;

  // Date
  DateTime? selectedDate;

  // File & Image handling
  FilePickerResult? file;
  List<XFile>? selectedImages;

  // Function to pick date
  Future<void> _pickDate() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (date != null) {
      setState(() {
        selectedDate = date;
        dateController.text =
            '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}';
      });
    }
  }

  // Function to pick a file
  Future<void> _pickFile() async {
    file = await FilePicker.platform.pickFiles();
    setState(() {});
  }

  // Function to pick images
  Future<void> _pickImages() async {
    final ImagePicker picker = ImagePicker();
    final List<XFile> images = await picker.pickMultiImage();
    setState(() {
      selectedImages = images;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgAppBar,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
        ),
        title: const Text(
          "POST YOUR ADD",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Name Field
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: 'Enter your name',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none,
                  ),
                ),
                validator: (value) => value!.isEmpty ? 'Enter a name' : null,
              ),
              const SizedBox(height: 16),

              // Description Field
              TextFormField(
                controller: descriptionController,
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: 'Description',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Price Field
              TextFormField(
                controller: priceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Price',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none,
                  ),
                ),
                validator: (value) => value!.isEmpty ? 'Enter a price' : null,
              ),
              const SizedBox(height: 16),

              // Location Field
              TextFormField(
                controller: locationController,
                decoration: InputDecoration(
                  hintText: 'Enter location',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none,
                  ),
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Enter a location' : null,
              ),
              const SizedBox(height: 16),

              // Dropdown for Type
              DropdownButtonFormField<String>(
                value: selectedType,
                items: types.map((type) {
                  return DropdownMenuItem(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedType = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Type',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Radio Buttons for Condition
              // Text('Condition:'),
              Row(
                children: [
                  Row(
                    children: [
                      Radio<String>(
                        value: 'None',
                        groupValue: selectedCondition,
                        onChanged: (value) {
                          setState(() {
                            selectedCondition = value;
                          });
                        },
                      ),
                      const Text('None'),
                    ],
                  ),
                  const SizedBox(width: 16),
                  Row(
                    children: [
                      Radio<String>(
                        value: 'Bid',
                        groupValue: selectedCondition,
                        onChanged: (value) {
                          setState(() {
                            selectedCondition = value;
                          });
                        },
                      ),
                      const Text('Bid'),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Minimum Bid Amount Field (only shown if "Bid" is selected)
              if (selectedCondition == 'Bid') ...[
                TextFormField(
                  controller: minBidAmountController,
                  decoration: InputDecoration(
                    hintText: 'Minimum Bid Amount',
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator: (value) =>
                      value!.isEmpty ? 'Enter a minimum bid amount' : null,
                ),
                const SizedBox(height: 16),

                // Date Picker
                TextFormField(
                  readOnly: true,
                  controller: dateController,
                  decoration: InputDecoration(
                    hintText: 'Set Bid End Date',
                    filled: true,
                    fillColor: Colors.grey[200],
                    suffixIcon: const Icon(Icons.calendar_today),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onTap: _pickDate,
                ),
                const SizedBox(height: 16),

                // Attach File
                const Text('Attach Authenticity document (Optional)'),
                ElevatedButton(
                  style: ButtonStyle(
                    // Set the background color
                    backgroundColor: WidgetStateProperty.all(
                      Colors.grey[200],
                    ), // Replace with your desired color

                    // Customize the border radius
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            8), // Set the desired border radius (smaller for sharp corners)
                      ),
                    ),
                  ),
                  onPressed: _pickFile,
                  child: Text(
                      file == null ? 'Attach File' : file!.files.first.name),
                ),
              ],

              const SizedBox(height: 16),
              const Text('Condition:'),
              Row(
                children: [
                  Row(
                    children: [
                      Radio<String>(
                        value: 'New',
                        groupValue: selectedCondition1,
                        onChanged: (value) {
                          setState(() {
                            selectedCondition1 = value;
                          });
                        },
                      ),
                      const Text('New'),
                    ],
                  ),
                  const SizedBox(width: 16),
                  Row(
                    children: [
                      Radio<String>(
                        value: 'Used',
                        groupValue: selectedCondition1,
                        onChanged: (value) {
                          setState(() {
                            selectedCondition1 = value;
                          });
                        },
                      ),
                      const Text('Used'),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text('Add Images'),
              // Single Image Upload
              ElevatedButton(
                style: ButtonStyle(
                  // Set the background color
                  backgroundColor: WidgetStateProperty.all(
                    Colors.grey[200],
                  ), // Replace with your desired color

                  // Customize the border radius
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          8), // Set the desired border radius (smaller for sharp corners)
                    ),
                  ),
                ),
                onPressed: () => _pickImages(),
                child: Text(
                  selectedImages == null || selectedImages!.isEmpty
                      ? 'Upload Images'
                      : '${selectedImages!.length} Image(s) Selected',
                ),
              ),

              const SizedBox(height: 16),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Form Submitted')),
                        );
                      }
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProfilePage()));
                    },
                    child: Container(
                      height: 45,
                      width: 180,
                      decoration: BoxDecoration(
                        color: bgButton,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          "Post Ad",
                          style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
