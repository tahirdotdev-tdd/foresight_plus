class TicketModel {
  final String heading;
  final String seeMore;
  final String ticketId;
  final String ticketCategory;
  final String ticketStatus;

  TicketModel({
    required this.heading,
    required this.seeMore,
    required this.ticketId,
    required this.ticketCategory,
    required this.ticketStatus,
  });

  // Optional: create from JSON (e.g. Firebase, API)
  factory TicketModel.fromJson(Map<String, dynamic> json) {
    return TicketModel(
      heading: json['heading'] ?? '',
      seeMore: json['seeMore'] ?? '',
      ticketId: json['ticketId'] ?? '',
      ticketCategory: json['ticketCategory'] ?? '',
      ticketStatus: json['ticketStatus'] ?? '',
    );
  }
}
