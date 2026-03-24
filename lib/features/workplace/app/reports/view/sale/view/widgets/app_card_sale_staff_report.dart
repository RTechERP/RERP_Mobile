import 'package:flutter/material.dart';

class AppCardSaleStaffReport extends StatelessWidget {
  final String? projectCode;
  final String? customerName;
  final String? contactName;
  final String? content;
  final String? result;
  final String? planNext;
  final DateTime? dateStart;
  final VoidCallback? onTap;

  const AppCardSaleStaffReport({
    super.key,
    this.projectCode,
    this.customerName,
    this.contactName,
    this.content,
    this.result,
    this.planNext,
    this.dateStart,
    this.onTap,
  });

  String _formatDate(DateTime? dt) {
    if (dt == null) return '--/--/----';
    String two(int n) => n.toString().padLeft(2, '0');
    return '${two(dt.day)}/${two(dt.month)}/${dt.year}';
  }

  Widget _badge(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ),
    );
  }

  Widget _gridItem(String title, String? value) {
    if (value == null || value.isEmpty) return const SizedBox();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// PROJECT BADGE
              Row(
                children: [
                  if (projectCode?.isNotEmpty == true)
                    _badge(projectCode!, Colors.blue),
                ],
              ),

              const SizedBox(height: 6),

              /// CUSTOMER
              if (customerName?.isNotEmpty == true)
                Row(
                  children: [
                    const Icon(Icons.business_outlined,
                        size: 12, color: Colors.grey),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        customerName!,
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey[700],
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),

              const SizedBox(height: 4),

              /// CONTACT + DATE
              Row(
                children: [
                  if (contactName?.isNotEmpty == true)
                    Expanded(
                      child: Row(
                        children: [
                          const Icon(Icons.person_outline,
                              size: 12, color: Colors.grey),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              contactName!,
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.grey[700],
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),

                  Row(
                    children: [
                      const Icon(Icons.access_time_rounded,
                          size: 12, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(
                        _formatDate(dateStart),
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 6),

              /// CONTENT + RESULT
              Row(
                children: [
                  Expanded(child: _gridItem("Nội dung", content)),
                  const SizedBox(width: 6),
                  Expanded(child: _gridItem("Kết quả", result)),
                ],
              ),

              const SizedBox(height: 6),

              /// PLAN
              _gridItem("Kế hoạch", planNext),
            ],
          ),
        ),
      ),
    );
  }
}