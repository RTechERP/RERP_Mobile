import 'package:flutter_test/flutter_test.dart';
import 'package:rtc_erp/features/workplace/app/personal_approve/app/approve_timesheet/view/widgets/approve_timesheet_content_parser.dart';

void main() {
  group('ApproveTimesheetContentParser', () {
    test('parse HTML mẫu Ngày lễ', () {
      const html =
          'Ngày lễ: 4.00 h<br/><span style="color:#dc3545; white-space:nowrap;">26/06/2026 18:00 - 26/06/2026 22:00</span><br/>Dự án: NB.785278.26.001 - huhuh<br/>Địa điểm: Văn phòng';

      final lines = ApproveTimesheetContentParser.parse(html);

      expect(lines, hasLength(4));

      expect(lines[0].label, 'Ngày lễ');
      expect(lines[0].value, '4.00 h');
      expect(lines[0].isHighlighted, isFalse);

      expect(lines[1].label, '');
      expect(lines[1].value, '26/06/2026 18:00 - 26/06/2026 22:00');
      expect(lines[1].isHighlighted, isTrue);

      expect(lines[2].label, 'Dự án');
      expect(lines[2].value, 'NB.785278.26.001 - huhuh');
      expect(lines[2].isHighlighted, isFalse);

      expect(lines[3].label, 'Địa điểm');
      expect(lines[3].value, 'Văn phòng');
      expect(lines[3].isHighlighted, isFalse);
    });

    test('null hoặc rỗng trả về list rỗng', () {
      expect(ApproveTimesheetContentParser.parse(null), isEmpty);
      expect(ApproveTimesheetContentParser.parse(''), isEmpty);
      expect(ApproveTimesheetContentParser.parse('   '), isEmpty);
    });

    test('bỏ qua dòng trống do <br/> liên tiếp', () {
      const html = 'Dự án: NB.A<br/><br/>Địa điểm: VP';
      final lines = ApproveTimesheetContentParser.parse(html);
      expect(lines, hasLength(2));
      expect(lines[0].label, 'Dự án');
      expect(lines[1].label, 'Địa điểm');
    });

    test('xử lý <br> không đóng', () {
      const html = 'A: 1<br>B: 2';
      final lines = ApproveTimesheetContentParser.parse(html);
      expect(lines, hasLength(2));
      expect(lines[0].value, '1');
      expect(lines[1].value, '2');
    });

    test('giá trị không có dấu ":" thì label rỗng', () {
      const html = 'Một dòng bình thường';
      final lines = ApproveTimesheetContentParser.parse(html);
      expect(lines, hasLength(1));
      expect(lines.first.label, '');
      expect(lines.first.value, 'Một dòng bình thường');
    });
  });
}
