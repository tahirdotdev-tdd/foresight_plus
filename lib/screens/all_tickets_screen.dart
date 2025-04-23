import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foresight_plus/components/custom_tab_bar.dart';

import '../components/colors.dart';
import '../components/custom_search_bar.dart';
import '../components/ticket_card.dart';
import '../data/ticket_data.dart';
import '../models/ticket_model.dart';

class AllTicketsScreen extends StatelessWidget {
  const AllTicketsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final List<TicketModel> tickets =
        ticketData.map((e) => TicketModel.fromJson(e)).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        child: Stack(
          children: [
            // 🌄 Background SVG
            // 🌄 Background image stays in place
            // Positioned.fill(
            //   child: Image.asset(
            //     "lib/assets/images/bcg1.png",
            //     fit: BoxFit.cover,
            //   ),
            // ),
            // 📦 Foreground content
            LayoutBuilder(
              builder: (context, constraints) {
                return Column(
                  children: [
                    // 🧢 Header Section
                    Container(
                      padding: EdgeInsets.all(screenWidth * 0.03),
                      width: double.infinity,
                      height: 192,
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
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFF9F9FB),
                              // subtle off-white background like in image
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: CustomSearchBar(), // Your widget
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    CustomTabBar(),
                    Expanded(
                      child: ListView.builder(
                        itemCount: tickets.length,
                        itemBuilder: (context, index) {
                          return buildTicketCard(tickets[index]);
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
