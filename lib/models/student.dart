import 'parent_detail.dart';

class Student {
  final String id;
  final String name;
  final String imageUrl;
  final String emailAddress;
  final int regularityNumber;
  final String number;
  final ParentDetails parentDetails;

  Student({
    required this.name,
    required this.id,
    this.imageUrl = "null",
    this.emailAddress = "null",
    required this.regularityNumber,
    this.number = "null",
    required this.parentDetails,
  });
}
