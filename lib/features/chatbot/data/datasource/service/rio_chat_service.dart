import 'package:injectable/injectable.dart';

import '../../../../../base/network/dio/dio_base_api_service.dart';
import '../../../../../base/network/models/base_data.dart';
import '../../../../../common/constants.dart';
import '../models/rio_chat_model.dart';

/// Service giao tiếp với Rio Chat API.
@lazySingleton
class RioChatService extends DioBaseApiService {
  RioChatService(super.dio);

  /// Gửi tin nhắn tới Rio Chat và nhận phản hồi.
  ///
  /// API: `POST /Rio/chat` — response: `{ question, answer }`.
  Future<BaseData<RioChatResponse>> sendMessage({required String message}) {
    return post<BaseData<RioChatResponse>>(
      ApiEndPoint.rioChat,
      body: {'message': message},
      parser: (json) => BaseData<RioChatResponse>.fromJson(
        json as Map<String, dynamic>,
        (data) => RioChatResponse.fromJson(data as Map<String, dynamic>),
      ),
    );
  }

  /// Lấy danh sách session lịch sử chat từ API.
  ///
  /// API: `GET /Rio/chat-history`.
  Future<BaseData<List<ChatHistorySession>>> getChatHistory() {
    return get<BaseData<List<ChatHistorySession>>>(
      ApiEndPoint.rioChatHistory,
      parser: (json) => _parseList(json, _chatHistorySessionFromJsonSafe),
    );
  }

/// Lấy chi tiết một session chat kèm danh sách messages.
///
/// API: `GET /Rio/chat-history/{id}` — response: `{ status, data: {...} }`.
Future<BaseData<ChatSessionDetail>> getChatHistoryDetail(int sessionId) {
  return get<BaseData<ChatSessionDetail>>(
    ApiEndPoint.rioChatHistoryDetail(sessionId),
    parser: (json) => BaseData<ChatSessionDetail>.fromJson(
      json as Map<String, dynamic>,
      (data) => _chatSessionDetailFromJsonSafe(
        data as Map<String, dynamic>,
      ),
    ),
  );
}

  /// Parse danh sách linh hoạt: mảng trần hoặc `data` wrap.
  /// Áp dụng style giống `ContactService._parseList`.
  BaseData<List<T>> _parseList<T>(
    dynamic json,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    if (json is List) {
      return BaseData<List<T>>.fromJson(
        {'status': 1, 'data': json},
        (data) => (data as List)
            .map((e) => fromJson(e as Map<String, dynamic>))
            .toList(),
      );
    }

    return BaseData<List<T>>.fromJson(
      json as Map<String, dynamic>,
      (data) {
        if (data is List) {
          return data.map((e) => fromJson(e as Map<String, dynamic>)).toList();
        }
        if (data is Map) {
          final items = (data as Map<String, dynamic>).values
              .whereType<List>()
              .expand((e) => e)
              .map((e) => fromJson(e as Map<String, dynamic>))
              .toList();
          if (items.isNotEmpty) return items;
        }
        return <T>[];
      },
    );
  }

  /// Parse ChatHistorySession thủ công, hỗ trợ nhiều format DateTime.
  ChatHistorySession _chatHistorySessionFromJsonSafe(
    Map<String, dynamic> json,
  ) {
    return ChatHistorySession(
      sessionId: (json['SessionID'] as num?)?.toInt() ?? 0,
      createdDate: _parseDate(json['CreatedDate']),
      updatedDate: _parseDate(json['UpdatedDate']),
    );
  }

  /// Parse ChatSessionDetail thủ công, hỗ trợ nhiều format DateTime.
  ChatSessionDetail _chatSessionDetailFromJsonSafe(
    Map<String, dynamic> json,
  ) {
    final messages = (json['Messages'] as List? ?? const [])
        .whereType<Map<String, dynamic>>()
        .map(
          (m) => ChatHistoryMessage(
            question: (m['Question'] ?? m['question'] ?? '').toString(),
            answer: (m['Answer'] ?? m['answer'] ?? '').toString(),
          ),
        )
        .toList();

    return ChatSessionDetail(
      sessionId: (json['SessionID'] as num?)?.toInt() ?? 0,
      createdDate: _parseDate(json['CreatedDate']),
      updatedDate: _parseDate(json['UpdatedDate']),
      messages: messages,
    );
  }

  /// Parse DateTime linh hoạt: ISO 8601, fallback pad millisecond nếu < 3 chữ số.
  DateTime _parseDate(dynamic raw) {
    if (raw is DateTime) return raw;
    final s = raw?.toString();
    if (s == null || s.isEmpty) return DateTime.now();
    try {
      return DateTime.parse(s);
    } catch (_) {
      // Pad millisecond nếu < 3 chữ số (vd: .73 -> .730)
      final msMatch = RegExp(r'\.(\d+)$').firstMatch(s);
      if (msMatch != null) {
        final ms = msMatch.group(1)!.padRight(3, '0');
        final normalized =
            s.replaceFirst(msMatch.group(0)!, '.$ms').replaceFirst(' ', 'T');
        try {
          return DateTime.parse(normalized);
        } catch (_) {
          // ignore, fallback bên dưới
        }
      }
      return DateTime.now();
    }
  }
}
