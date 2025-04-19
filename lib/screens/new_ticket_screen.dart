import 'package:flutter/material.dart';
import 'package:foresight_plus/components/back_button.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/colors.dart';

class NewTicketScreen extends StatelessWidget {
  const NewTicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          // 🌄 Background SVG
          Positioned.fill(
            child: Image.asset("lib/assets/images/bcg1.png", fit: BoxFit.cover),
          ),

          // 📦 Foreground content
          LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                children: [
                  // 🧢 Header Section
                  Container(
                    padding: EdgeInsets.all(screenWidth * 0.04),

                    width: double.infinity,
                    height: 126,
                    decoration: BoxDecoration(
                      color: AppColors.bcg,
                      border: Border.all(color: Color(0XFFD0D5DD), width: 1),
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(30),
                      ),
                    ),

                    child: SafeArea(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomBackButton(),
                          SizedBox(width: screenWidth * 0.07),
                          Text(
                            "New Ticket",
                            style: GoogleFonts.inter(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
