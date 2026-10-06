import '../../../../common/constants/index.dart';

/// Enum cảm xúc của chatbot Rio, khớp với các ảnh avatar trong assets.
enum ChatbotEmotion {
  smile,
  happy,
  exciting,
  love,
  agree,
  questioning,
  speechless,
  angry;

  /// Path asset tương ứng với emotion.
  String get imageAsset {
    switch (this) {
      case ChatbotEmotion.smile:
        return AppImages.chatbot_smile;
      case ChatbotEmotion.happy:
        return AppImages.chatbot_happy;
      case ChatbotEmotion.exciting:
        return AppImages.chatbot_exciting;
      case ChatbotEmotion.love:
        return AppImages.chatbot_love;
      case ChatbotEmotion.agree:
        return AppImages.chatbot_agree;
      case ChatbotEmotion.questioning:
        return AppImages.chatbot_questioning;
      case ChatbotEmotion.speechless:
        return AppImages.chatbot_speechless;
      case ChatbotEmotion.angry:
        return AppImages.chatbot_angry;
    }
  }

  /// Emoji/character nhỏ hiển thị kế bên tên Rio trong bubble — gợi cảm xúc.
  String get accentEmoji {
    switch (this) {
      case ChatbotEmotion.smile:
        return '🙂';
      case ChatbotEmotion.happy:
        return '😄';
      case ChatbotEmotion.exciting:
        return '✨';
      case ChatbotEmotion.love:
        return '❤';
      case ChatbotEmotion.agree:
        return '👍';
      case ChatbotEmotion.questioning:
        return '🤔';
      case ChatbotEmotion.speechless:
        return '😶';
      case ChatbotEmotion.angry:
        return '😣';
    }
  }
}

/// Suy luận cảm xúc của Rio từ nội dung câu trả lời (tiếng Việt, có/không dấu).
///
/// Thứ tự ưu tiên: questioning > angry > speechless > love > happy >
/// agree > smile > exciting (mặc định).
ChatbotEmotion detectEmotion(String text) {
  final lower = _normalize(text);

  // Câu hỏi / thắc mắc → questioning
  if (_matchesAny(lower, [
    'ban co the',
    'ban có thể',
    'cho minh biet',
    'cho toi biet',
    'cho mình biết',
    'cho tôi biết',
    'ban giup',
    'bạn giúp',
    'lam the nao',
    'làm thế nào',
    'nhu the nao',
    'như thế nào',
    '?',
    'la gi',
    'là gì',
    'bao nhieu',
    'bao nhiêu',
    'khi nao',
    'khi nào',
    'o dau',
    'ở đâu',
    'tai sao',
    'tại sao',
    'nhu the nao',
    'why',
    'how',
  ])) {
    return ChatbotEmotion.questioning;
  }

  // Tiêu cực → angry
  if (_matchesAny(lower, [
    'khong the',
    'không thể',
    'that bai',
    'thất bại',
    'loi',
    'lỗi',
    'tu choi',
    'từ chối',
    'khong duoc',
    'không được',
    'that bai',
    'that vong',
    'thất vọng',
    'khong hop le',
    'không hợp lệ',
    'xay ra loi',
    'xảy ra lỗi',
    'khong thanh cong',
    'không thành công',
  ])) {
    return ChatbotEmotion.angry;
  }

  // Bất ngờ / không biết → speechless
  if (_matchesAny(lower, [
    'toi khong biet',
    'tôi không biết',
    'chua ro',
    'chưa rõ',
    'khong chac chan',
    'không chắc chắn',
    'that su khong biet',
    'thật sự không biết',
    'vượt quá khả năng',
    'vuot qua kha nang',
  ])) {
    return ChatbotEmotion.speechless;
  }

  // Tình cảm / yêu thích → love
  if (_matchesAny(lower, [
    'yeu',
    'yêu',
    'thich',
    'thích',
    'cam on',
    'cảm ơn',
    'cam on ban',
    'cảm ơn bạn',
    'yeu cau',
    'yêu cầu',
    'tu van',
    'tư vấn',
    'tam su',
    'tâm sự',
    'rat tot',
    'rất tốt',
  ])) {
    return ChatbotEmotion.love;
  }

  // Vui / tích cực → happy
  if (_matchesAny(lower, [
    'vuive',
    'vui vẻ',
    'tuoi cuoi',
    'tươi cười',
    'cuoi',
    'cười',
    'tot',
    'tốt',
    'thanh cong',
    'thành công',
    'chuc mung',
    'chúc mừng',
    'hay qua',
    'hay quá',
    'tuyet voi',
    'tuyệt vời',
    'rat vui',
    'rất vui',
  ])) {
    return ChatbotEmotion.happy;
  }

  // Đồng ý / chấp nhận → agree
  if (_matchesAny(lower, [
    'dong y',
    'đồng ý',
    'chap nhan',
    'chấp nhận',
    'duoc',
    'được',
    'ok',
    'okay',
    'o roi',
    'ơ rồi',
    'xac nhan',
    'xác nhận',
    'roi nhe',
    'rồi nhé',
    'xong roi',
    'xong rồi',
  ])) {
    return ChatbotEmotion.agree;
  }

  // Nhẹ nhàng / bình thường → smile
  if (_matchesAny(lower, [
    'chao',
    'chào',
    'xin chao',
    'xin chào',
    'hi',
    'hello',
    'alo',
    'gui',
    'gửi',
    'tam',
    'tạm',
  ])) {
    return ChatbotEmotion.smile;
  }

  // Mặc định
  return ChatbotEmotion.exciting;
}

/// Chuẩn hóa: lowercase + bỏ dấu tiếng Việt + bỏ ký tự đặc biệt nhẹ.
String _normalize(String text) {
  var s = text.toLowerCase();

  // Bỏ dấu tiếng Việt theo từng block nguyên âm.
  s = s
      .replaceAll(RegExp('[áàảãạăắằẳẵặâấầẩẫậ]'), 'a')
      .replaceAll(RegExp('[éèẻẽẹêếềểễệ]'), 'e')
      .replaceAll(RegExp('[íìỉĩị]'), 'i')
      .replaceAll(RegExp('[óòỏõọôốồổỗộơớờởỡợ]'), 'o')
      .replaceAll(RegExp('[úùủũụưứừửữự]'), 'u')
      .replaceAll(RegExp('[ýỳỷỹỵ]'), 'y')
      .replaceAll('đ', 'd');
  return s;
}

bool _matchesAny(String text, List<String> keywords) {
  for (final k in keywords) {
    final nk = _normalize(k);
    if (text.contains(nk)) return true;
  }
  return false;
}
