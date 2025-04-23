import 'package:flutter/material.dart';

import '../models/ticket_model.dart';

Widget buildTicketCard(TicketModel ticket) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 6,
          offset: Offset(0, 3),
        ),
      ],
      border: Border.all(color: Colors.grey.shade300),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Heading
        Text(
          ticket.heading,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),

        /// See More text
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text.rich(
            TextSpan(
              text: ticket.seeMore,
              children: [
                TextSpan(
                  text: ' See More',
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(height: 12),

        /// Ticket Details
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Color(0xFFF4F4F6),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              _buildRow("Ticket ID", ticket.ticketId),
              _buildRow("Category", ticket.ticketCategory),
              _buildRow(
                "Status",
                ticket.ticketStatus,
                status: true,
                // Applying different colors based on ticket status
                color:
                    ticket.ticketStatus == "Resolved"
                        ? Colors.lightBlue.shade100
                        : Colors.deepOrange.shade100,
                textColor:
                    ticket.ticketStatus == "Resolved"
                        ? Colors.lightBlue
                        : Colors.deepOrange,
              ),
            ],
          ),
        ),

        const SizedBox(height: 12),

        /// See Details Button
        GestureDetector(
          onTap: () {
            // Handle button tap
          },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              border: Border.all(color: Color(0XFF101828)),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "See Details",
                  style: TextStyle(
                    color: Color(0XFF101828),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 8),
                Icon(
                  Icons.remove_red_eye_outlined,
                  size: 20,
                  color: Color(0XFF101828),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _buildRow(
  String label,
  String value, {
  bool status = false,
  Color? color,
  Color? textColor,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.w500)),
        status
            ? Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: color ?? Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                value,
                style: TextStyle(
                  color: textColor ?? Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            )
            : Text(value, style: TextStyle(fontWeight: FontWeight.w600)),
      ],
    ),
  );
}
