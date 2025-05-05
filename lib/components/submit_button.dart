import 'package:flutter/material.dart';
import 'package:foresight_plus/components/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class SubmitButton extends StatefulWidget {
  const SubmitButton({super.key});

  @override
  State<SubmitButton> createState() => _TicketButtonOneState();
}

class _TicketButtonOneState extends State<SubmitButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  // ignore: unused_field
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
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            margin: EdgeInsets.only(bottom: 80, left: 20, right: 20),
            content: Text('Ticket submitted successfully!'),
            duration: Duration(seconds: 2),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: Colors.green,
          ),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Submit Ticket",
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 8),
            Icon(Icons.check, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
