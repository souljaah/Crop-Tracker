import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CropRecordsPage extends StatefulWidget {
  @override
  _CropRecordsPageState createState() => _CropRecordsPageState();
}

class _CropRecordsPageState extends State<CropRecordsPage> {
  DateTime selectedDate = DateTime.now();
  String selectedSection = 'Grade 10';
  String cropName = '';

  final RecordService _recordService = RecordService(); // Singleton instance

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate) {
      setState(() => selectedDate = picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDF7E3),
      appBar: AppBar(
        backgroundColor: Color(0xFF4C7C36),
        title: Text('Crop Records'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            GestureDetector(
              onTap: () => _pickDate(context),
              child: AbsorbPointer(
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Date',
                    hintText: 'Select Date',
                  ),
                  controller: TextEditingController(
                    text: DateFormat('yyyy-MM-dd').format(selectedDate),
                  ),
                ),
              ),
            ),
            DropdownButtonFormField<String>(
              value: selectedSection,
              decoration: InputDecoration(labelText: 'Section'),
              items: List.generate(6, (i) => 'Grade ${7 + i}').map((section) {
                return DropdownMenuItem(value: section, child: Text(section));
              }).toList(),
              onChanged: (value) => setState(() => selectedSection = value!),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Crop Name'),
              onChanged: (value) {
                setState(() {
                  cropName = value;
                });
              },
            ),
            SizedBox(height: 15),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF4C7C36),
                minimumSize: Size(double.infinity, 50),
              ),
              onPressed: cropName.trim().isEmpty
                  ? null
                  : () {
                setState(() {
                  _recordService.cropRecords.add({
                    'date': DateFormat('yyyy-MM-dd').format(selectedDate),
                    'section': selectedSection,
                    'crop': cropName,
                  });
                  cropName = '';
                });
              },
              child: Text('Assign Crop'),
            ),
            SizedBox(height: 10),
            Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: _recordService.cropRecords.length,
                itemBuilder: (context, index) {
                  var r = _recordService.cropRecords[index];
                  return ListTile(
                    title: Text('${r['date']}   ${r['section']}   ${r['crop']}'),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RecordService {
  static final RecordService _instance = RecordService._internal();
  factory RecordService() => _instance;
  RecordService._internal();

  final List<Map<String, String>> cropRecords = [];
}
