import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'upload_button.dart'; // Import the UploadButton widget

class FileUploadWidget extends StatefulWidget {
  const FileUploadWidget({super.key});

  @override
  _FileUploadWidgetState createState() => _FileUploadWidgetState();
}

class _FileUploadWidgetState extends State<FileUploadWidget> {
  String? _fileName;
  bool _isLoading = false;
  String? _errorMessage;

  Future<void> _pickFile() async {
    if (_isLoading) return;
    setState(() {
      _isLoading = true;
      _errorMessage = null; // Reset error message
    });

    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'png'],
      );

      if (result != null && result.files.isNotEmpty) {
        var file = result.files.single;

        // Check file size (1MB = 1024 * 1024 bytes)
        if (file.size > 1024 * 1024) {
          setState(() {
            _errorMessage = 'File size exceeds 1MB.';
          });
          return;
        }

        // Check file extension
        if (!['jpg', 'png'].contains(file.extension)) {
          setState(() {
            _errorMessage = 'Invalid file type. Only JPG and PNG are allowed.';
          });
          return;
        }

        setState(() {
          _fileName = file.name;
        });
        print('File picked: $_fileName');
      } else {
        print('User canceled the picker');
      }
    } catch (e) {
      print('Error picking file: $e');
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error: ${e.toString()}')));
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
      child: Container(
        alignment: Alignment.center,
        width: 354,
        height: 150,
        decoration: BoxDecoration(
          color: Color(0XFFFFFFFF),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Color(0XFFE4E7EC)),
        ),
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Upload button
            UploadButton(
              iconPath: 'lib/assets/images/uploader.svg',
              onTap: _pickFile,
            ),
            SizedBox(height: 8), // Space between the button and text
            // Text below the button for file types and instructions
            Text(
              'Click to upload',
              style: TextStyle(
                color: Color(0XFF6941C6),
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'PNG, JPG (max. 1MB)',
              style: TextStyle(color: Colors.grey.shade700, fontSize: 12),
            ),

            // Display error message if any
            if (_errorMessage != null)
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Text(
                  _errorMessage!,
                  style: TextStyle(color: Colors.red, fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ),

            if (_fileName != null)
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Text(
                  'Selected File: $_fileName',
                  style: TextStyle(color: Colors.black, fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
