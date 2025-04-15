import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foresight_plus/components/colors.dart';
import 'package:foresight_plus/components/hero_cards.dart';
import 'package:foresight_plus/components/overall_summary_widget.dart';
import 'package:foresight_plus/components/ticket_button_two.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/ticket_button_one.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              // 🧢 Header Section
              Container(
                padding: EdgeInsets.all(screenWidth * 0.03),
                width: double.infinity,
                height: 273,
                decoration: BoxDecoration(
                  color: AppColors.bcg,
                  border: Border.all(color: Color(0XFFD0D5DD), width: 1),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 45),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0XFFEAECF5),
                          ),
                          child: Icon(Icons.menu, size: 20),
                        ),
                        SvgPicture.asset(
                          'lib/assets/images/logo.svg',
                          width: screenWidth * 0.45,
                          height: 47,
                        ),
                        Stack(
                          children: [
                            Container(
                              width: 36,
                              height: 36,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: Colors.grey.withOpacity(0.5),
                                ),
                                borderRadius: BorderRadius.circular(8),
                                color: Color(0XFFEAECF5),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                "UP",
                                style: TextStyle(
                                  color: Color(0XFF667085),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0.5,
                              right: 0.5,
                              child: Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: Colors.white,
                                  ),
                                  color: Colors.green,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          HeroCards(title: "Total", content: '546'),
                          SizedBox(width: 5),
                          HeroCards(title: "Pending", content: '346'),
                          SizedBox(width: 5),
                          HeroCards(title: "Resolved", content: '210'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 15),

              // 📈 Overall Summary
              Container(
                padding: EdgeInsets.all(11.44),
                margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                width: double.infinity,
                constraints: BoxConstraints(maxWidth: 400),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  border: Border.all(width: 2, color: Color(0XFFE4E7EC)),
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x0D000000),
                      blurRadius: 20,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Overall Summary",
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 11),
                    OverallSummaryWidget(),
                  ],
                ),
              ),

              SizedBox(height: 12),

              // 📋 Categories Summary
              Container(
                padding: EdgeInsets.all(11.44),
                margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                width: double.infinity,
                constraints: BoxConstraints(maxWidth: 400),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  border: Border.all(width: 2, color: Color(0XFFE4E7EC)),
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x0D000000),
                      blurRadius: 20,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: SizedBox(
                  height: 120,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Categories Summary",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            "Coming soon.",
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              color: Color(0XFF101828),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 15),

              // 🎟️ Ticket Buttons Footer
              Container(
                padding: EdgeInsets.all(12),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.bottomBarBcg,
                  border: Border.all(color: Color(0XFFD0D5DD), width: 1),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: TicketButtonOne(),
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.center,
                      child: TicketButtonTwo(),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
