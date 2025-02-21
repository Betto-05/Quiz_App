import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quiz/services/database_services.dart';

Future<dynamic> feedbackfeature(
  BuildContext context,
) async {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  String userName = await DatabaseServices().getUsername();

  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        contentPadding: EdgeInsets.all(16.0),
        content: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: titleController,
                      decoration: InputDecoration(
                        hintText: "Title",
                        hintStyle: TextStyle(fontSize: 12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue.shade900,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Title is required';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: descriptionController,
                      maxLines: 6,
                      decoration: InputDecoration(
                        hintText: "Description",
                        hintStyle: TextStyle(fontSize: 12),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue.shade900,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Description is required';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    MaterialButton(
                      height: 45,
                      color: Colors.blue.shade900,
                      shape: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      onPressed: () {
                        // Validate the form
                        if (formKey.currentState?.validate() ?? false) {
                          // If valid, save the data
                          String title = titleController.text;
                          String description = descriptionController.text;

                          try {
                            saveData(userName, title, description);

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                showCloseIcon: true,
                                backgroundColor: Colors.green,
                                content: Center(
                                  child: Text(
                                    "Feedback sent successfully!",
                                  ),
                                ),
                              ),
                            );
                            Navigator.pop(context);
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                showCloseIcon: true,
                                backgroundColor: Colors.red,
                                content: Center(
                                  child: Text(
                                    "There was a problem sending the feedback , Please try again!",
                                  ),
                                ),
                              ),
                            );
                            Navigator.pop(context);
                          }
                        }
                      },
                      child: const Center(
                        child: Text(
                          "Submit",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    MaterialButton(
                      height: 45,
                      color: Colors.white,
                      shape: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue.shade900),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Center(
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                            color: Colors.blue.shade900,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

void saveData(String userName, String title, String content) {
  FirebaseFirestore.instance.collection('notes').doc().set({
    'title': title,
    'content': content,
    'timestamp': DateTime.now(),
    'Name': userName
  });
}
