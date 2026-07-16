String fDecimal(num n) {
  final fixed = n.toStringAsFixed(2);
  final parts = fixed.split('.');
  final intPart = parts[0];
  var decPart = parts[1];

  final formatted = intPart.replaceAllMapped(
    RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
        (match) => '${match[1]},',
  );

  // Xóa các số 0 ở cuối phần thập phân
  decPart = decPart.replaceFirst(RegExp(r'0+$'), '');

  // Nếu không còn phần thập phân thì chỉ hiển thị số nguyên
  if (decPart.isEmpty) {
    return '$formatted đ';
  }

  return '$formatted.$decPart đ';
}