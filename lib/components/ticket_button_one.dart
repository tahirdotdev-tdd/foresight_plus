import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foresight_plus/components/colors.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/new_ticket_screen.dart';

class TicketButtonOne extends StatefulWidget {
  const TicketButtonOne({super.key});

  @override
  State<TicketButtonOne> createState() => _TicketButtonOneState();
}

class _TicketButtonOneState extends State<TicketButtonOne>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..repeat(reverse: true); // Keeps blinking

    _colorAnimation = ColorTween(
      begin: Colors.white,
      end: Colors.orange,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          (MaterialPageRoute(
            builder: (BuildContext context) {
              return NewTicketScreen();
            },
          )),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        width: 354,
        height: 60,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: AppColors.stroke),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Color(0x0D000000),
              blurRadius: 2,
              spreadRadius: 0,
              offset: Offset(0, 1),
            ),
          ],
          gradient: LinearGradient(
            colors: [AppColors.cardGradPrim, AppColors.cardGradSec],
          ),
        ),
        child: AnimatedBuilder(
          animation: _colorAnimation,
          builder:
              (context, child) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Open New Ticket",
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: _colorAnimation.value,
                    ),
                  ),
                  SvgPicture.asset(
                    'lib/assets/images/newTicket.svg',
                    height: 24,
                    color:
                        _colorAnimation.value, // Apply blinking color to icon
                  ),
                ],
              ),
        ),
      ),
    );
  }
}
