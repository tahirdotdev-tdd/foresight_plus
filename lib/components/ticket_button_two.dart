import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foresight_plus/components/colors.dart';
import 'package:foresight_plus/screens/all_tickets_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class TicketButtonTwo extends StatelessWidget {
  const TicketButtonTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          (MaterialPageRoute(
            builder: (BuildContext context) {
              return AllTicketsScreen();
            },
          )),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        width: 354,
        height: 60,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0x0D000000), // 5% opacity black
              blurRadius: 2,
              spreadRadius: 0,
              offset: Offset(0, 1),
            ),
          ],
          border: Border.all(width: 1, color: AppColors.stroke),
          borderRadius: BorderRadius.circular(10),
          color: Color(0XFFFFFFFF),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "View All Tickets",
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            SvgPicture.asset('lib/assets/images/ticketView.svg', height: 24),
          ],
        ),
      ),
    );
  }
}
