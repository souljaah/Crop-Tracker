import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDF7E3),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Color(0xFF4C7C36),
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Center(
                child: Text(
                  'Crop Rotation\n& Income Tracker',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    height: 1.3,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: 260),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/crop-records'),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black26),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.eco, size: 30, color: Color(0xFF2F5D34)),
                          SizedBox(width: 20),
                          Text(
                            'Crop Records',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/income-records'),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black26),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.attach_money, size: 30, color: Color(0xFF2F5D34)),
                          SizedBox(width: 20),
                          Text(
                            'Income Records',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
