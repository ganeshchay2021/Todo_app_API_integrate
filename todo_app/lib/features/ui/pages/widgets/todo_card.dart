import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

class TodoCard extends StatelessWidget {
  final String title;
  final String description;
  final bool isCompleted;
  final DateTime createdAt;
  const TodoCard({
    super.key,
    required this.title,
    required this.description,
    required this.isCompleted,
    required this.createdAt,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      height: 110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              Container(
                height: 12,
                width: 12,
                decoration: BoxDecoration(
                    color: isCompleted ? Colors.green : Colors.red,
                    shape: BoxShape.circle),
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            description,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade700,
            ),
          ),
          Spacer(),
          Row(
            children: [
              Icon(
                Icons.calendar_today_outlined,
                size: 14,
                color: Colors.grey,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                Jiffy.parseFromDateTime(createdAt)
                    .format(pattern: "MMM-yyyy-dd hh:mm:ss aa")
                    .toString(),
                style: TextStyle(color: Colors.grey),
              ),
            ],
          )
        ],
      ),
    );
  }
}
