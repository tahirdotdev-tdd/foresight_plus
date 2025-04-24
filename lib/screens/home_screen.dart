import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foresight_plus/components/colors.dart';
import 'package:foresight_plus/components/hero_cards.dart';
import 'package:foresight_plus/components/overall_summary_widget.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/ticket_button_one.dart';
import '../components/ticket_button_two.dart';
import 'all_tickets_screen.dart';
import 'new_ticket_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showDropdown = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(10),
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: AppColors.bcg),
              child: Align(
                alignment: Alignment.center, // or center if you prefer
                child: SizedBox(
                  width: 150, // Try increasing from 15 to see it clearly
                  height: 150,
                  child: SvgPicture.asset(
                    "lib/assets/images/logo.svg",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: Icon(Icons.new_label_outlined),
              title: Text('New Ticket'),
              onTap:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NewTicketScreen()),
                  ),
            ),
            ListTile(
              leading: Icon(Icons.all_inbox_rounded),
              title: Text('All Tickets'),
              onTap:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AllTicketsScreen()),
                  ),
            ),
          ],
        ),
      ),

      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset("lib/assets/images/bcg1.png", fit: BoxFit.cover),
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                children: [
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
                            Builder(
                              builder:
                                  (context) => GestureDetector(
                                    onTap:
                                        () => Scaffold.of(context).openDrawer(),
                                    child: Container(
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0XFFEAECF5),
                                      ),
                                      child: Icon(
                                        Icons.menu,
                                        size: 20,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                            ),
                            SvgPicture.asset(
                              'lib/assets/images/logo.svg',
                              width: screenWidth * 0.45,
                              height: 47,
                            ),
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      showDropdown = !showDropdown;
                                    });
                                  },
                                  child: Container(
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
                  Container(
                    padding: EdgeInsets.all(11.44),
                    margin: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.05,
                    ),
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
                  Container(
                    padding: EdgeInsets.all(11.44),
                    margin: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.05,
                    ),
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
                  Container(
                    padding: EdgeInsets.all(12),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.bottomBarBcg,
                      border: Border.all(color: Color(0XFFD0D5DD), width: 1),
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30),
                      ),
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
          // 👇 The dropdown is now outside the Column
          if (showDropdown)
            Positioned(
              top: 100, // adjust the vertical position based on your design
              right: 16, // position it right where you need
              child: Container(
                width: 120,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Profile", style: TextStyle(fontSize: 12)),
                    SizedBox(height: 5),
                    Text("Logout", style: TextStyle(fontSize: 12)),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
