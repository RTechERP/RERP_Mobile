// Date: 11/04/2026 - Dev: NQHung
// Nội dung/Chức năng: Màn hình danh bạ - hiển thị danh sách liên hệ theo bảng chữ cái với thanh A-Z index
//
// Giao diện:
//   - AppBar với title và icon tìm kiếm
//   - Tabs lọc: "Tất cả", "Nhân viên", "Phòng ban"
//   - Thanh tìm kiếm (ẩn/hiện)
//   - Section header theo chữ cái (A, B, C...)
//   - ContactTile: avatar + tên + chức vụ + phòng ban + trạng thái online
//   - Thanh index A-Z bên phải màn hình để nhảy nhanh theo bảng chữ cái
//   - Nhấn vào contact sẽ mở ContactDetailScreen
//
// Dữ liệu hiện tại là mock tĩnh.

import 'package:flutter/material.dart';

import '../../../../../common/app_theme/index.dart';
import 'contact_detail_screen.dart';
import 'models/contact_model.dart';

/// Màn hình danh bạ - tab thứ 4 trong DashboardScreen.
///
/// Hiển thị danh sách liên hệ theo bảng chữ cái với thanh index A-Z.
/// Hỗ trợ lọc theo tabs và tìm kiếm theo tên.
/// Dữ liệu là mock tĩnh, cần tạo BLoC + gọi API khi backend sẵn sàng.
class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _searchQuery = '';
  bool _isSearchVisible = false;
  final TextEditingController _searchController = TextEditingController();

  // Mock danh sách liên hệ
  final List<ContactData> _allContacts = [
    // A
    const ContactData(
      id: '1',
      fullName: 'An Thị B',
      position: 'Nhân viên',
      department: 'Phòng Kỹ thuật',
      email: 'an.thib@rtc.edu.vn',
      phone: '091 XXX XXX',
      avatar: 'A',
      avatarColor: Color(0xFF2957A6),
      isOnline: true,
    ),
    // B
    const ContactData(
      id: '2',
      fullName: 'Bùi Thị H',
      position: 'Trưởng phòng',
      department: 'Phòng Nhân sự',
      email: 'bui.thihuong@rtc.edu.vn',
      phone: '092 XXX XXX',
      avatar: 'B',
      avatarColor: Color(0xFFEE4623),
      isOnline: false,
    ),
    const ContactData(
      id: '3',
      fullName: 'Bạch Đình K',
      position: 'Nhân viên',
      department: 'Phòng Kinh doanh',
      email: 'bach.dinhkhanh@rtc.edu.vn',
      phone: '093 XXX XXX',
      avatar: 'B',
      avatarColor: Color(0xFF41B339),
      isOnline: true,
    ),
    // C
    const ContactData(
      id: '4',
      fullName: 'Phạm Văn Q',
      position: 'Trưởng phòng',
      department: 'Phòng Kỹ thuật',
      email: 'cao.minhtuan@rtc.edu.vn',
      phone: '094 XXX XXX',
      avatar: 'P',
      avatarColor: Color(0xFF853EFD),
      isOnline: false,
    ),
    // Đ
    const ContactData(
      id: '5',
      fullName: 'Đỗ Thị L',
      position: 'Nhân viên',
      department: 'Phòng Marketing',
      email: 'do.thilan@rtc.edu.vn',
      phone: '095 XXX XXX',
      avatar: 'Đ',
      avatarColor: Color(0xFFF0891A),
      isOnline: true,
    ),
    const ContactData(
      id: '6',
      fullName: 'Đặng Hoàng N',
      position: 'Nhân viên',
      department: 'Phòng Kỹ thuật',
      email: 'dang.hoangnam@rtc.edu.vn',
      phone: '096 XXX XXX',
      avatar: 'Đ',
      avatarColor: Color(0xFF2F80ED),
      isOnline: false,
    ),
    // H
    const ContactData(
      id: '7',
      fullName: 'Nguyễn Văn S',
      position: 'Giám đốc',
      department: 'Ban Giám đốc',
      email: 'hoang.thimai@rtc.edu.vn',
      phone: '097 XXX XXX',
      avatar: 'N',
      avatarColor: Color(0xFFE91E63),
      isOnline: true,
    ),
    const ContactData(
      id: '8',
      fullName: 'Hồ Văn D',
      position: 'Nhân viên',
      department: 'Phòng Kinh doanh',
      email: 'ho.vanduc@rtc.edu.vn',
      phone: '098 XXX XXX',
      avatar: 'H',
      avatarColor: Color(0xFF009688),
      isOnline: false,
    ),
    // L
    const ContactData(
      id: '9',
      fullName: 'Lê Thị Thu H',
      position: 'Phó phòng',
      department: 'Phòng Tài chính',
      email: 'le.thithuha@rtc.edu.vn',
      phone: '099 XXX XXX',
      avatar: 'L',
      avatarColor: Color(0xFF795548),
      isOnline: true,
    ),
    // N
    const ContactData(
      id: '10',
      fullName: 'Ngô Thị P',
      position: 'Nhân viên',
      department: 'Phòng Marketing',
      email: 'ngo.thiphuong@rtc.edu.vn',
      phone: '090 XXX XXX',
      avatar: 'N',
      avatarColor: Color(0xFFFF5722),
      isOnline: false,
    ),
    const ContactData(
      id: '11',
      fullName: 'Nguyễn Văn A',
      position: 'Nhân viên',
      department: 'Phòng Kỹ thuật',
      email: 'nguyen.vanan@rtc.edu.vn',
      phone: '091 XXX XXX',
      avatar: 'N',
      avatarColor: Color(0xFF607D8B),
      isOnline: true,
    ),
    // P
    const ContactData(
      id: '12',
      fullName: 'Phan Minh H',
      position: 'Trưởng phòng',
      department: 'Phòng Marketing',
      email: 'pham.thidung@rtc.edu.vn',
      phone: '092 XXX XXX',
      avatar: 'P',
      avatarColor: Color(0xFF9C27B0),
      isOnline: false,
    ),
    // T
    const ContactData(
      id: '13',
      fullName: 'Trần Hoàng L',
      position: 'Nhân viên',
      department: 'Phòng Kinh doanh',
      email: 'tran.hoanglong@rtc.edu.vn',
      phone: '093 XXX XXX',
      avatar: 'T',
      avatarColor: Color(0xFF3F51B5),
      isOnline: true,
    ),
    const ContactData(
      id: '14',
      fullName: 'Trần Thị B',
      position: 'Nhân viên',
      department: 'Phòng Kỹ thuật',
      email: 'tran.thibinh@rtc.edu.vn',
      phone: '094 XXX XXX',
      avatar: 'T',
      avatarColor: Color(0xFF00BCD4),
      isOnline: false,
    ),
    // V
    const ContactData(
      id: '15',
      fullName: 'Vũ Thị L',
      position: 'Phó phòng',
      department: 'Phòng Nhân sự',
      email: 'vu.thilan@rtc.edu.vn',
      phone: '095 XXX XXX',
      avatar: 'V',
      avatarColor: Color(0xFFCDDC39),
      isOnline: true,
    ),
    const ContactData(
      id: '16',
      fullName: 'Võ Đình N',
      position: 'Nhân viên',
      department: 'Phòng Tài chính',
      email: 'vo.dinhnam@rtc.edu.vn',
      phone: '096 XXX XXX',
      avatar: 'V',
      avatarColor: Color(0xFF8BC34A),
      isOnline: false,
    ),
  ];

  // Danh sách phòng ban (mock)
  final List<_DepartmentData> _departments = const [
    _DepartmentData(id: 'd1', name: 'Ban Giám đốc', memberCount: 3),
    _DepartmentData(id: 'd2', name: 'Phòng Kỹ thuật', memberCount: 12),
    _DepartmentData(id: 'd3', name: 'Phòng Kinh doanh', memberCount: 8),
    _DepartmentData(id: 'd4', name: 'Phòng Nhân sự', memberCount: 5),
    _DepartmentData(id: 'd5', name: 'Phòng Marketing', memberCount: 6),
    _DepartmentData(id: 'd6', name: 'Phòng Tài chính', memberCount: 4),
  ];

  static const List<String> _alphabet = [
    'A',
    'B',
    'C',
    'Đ',
    'E',
    'G',
    'H',
    'I',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'X',
    'Y',
  ];

  final Map<String, GlobalKey> _alphabetKeys = {};

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    for (final letter in _alphabet) {
      _alphabetKeys[letter] = GlobalKey();
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  List<ContactData> get _filteredContacts {
    var list = _allContacts;

    // Lọc theo tab
    final tabIndex = _tabController.index;
    if (tabIndex == 1) {
      // Nhân viên: không phải trưởng/phó phòng, giám đốc
      list = list.where((c) => c.position == 'Nhân viên').toList();
    } else if (tabIndex == 2) {
      // Phòng ban: lấy 1 đại diện mỗi phòng
      final seen = <String>{};
      list = list.where((c) => seen.add(c.department)).toList();
    }

    // Lọc theo từ khóa
    if (_searchQuery.isNotEmpty) {
      final q = _searchQuery.toLowerCase();
      list = list
          .where(
            (c) =>
                c.fullName.toLowerCase().contains(q) ||
                c.department.toLowerCase().contains(q) ||
                c.position.toLowerCase().contains(q),
          )
          .toList();
    }

    return list;
  }

  /// Nhảy đến section theo chữ cái.
  void _scrollToLetter(String letter) {
    final list = _filteredContacts;
    // Tìm contact đầu tiên bắt đầu bằng letter
    for (int i = 0; i < list.length; i++) {
      final firstLetter = _getFirstLetter(list[i].fullName);
      if (firstLetter == letter) {
        final key = _alphabetKeys[letter];
        if (key?.currentContext != null) {
          Scrollable.ensureVisible(
            key!.currentContext!,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
        return;
      }
    }
  }

  String _getFirstLetter(String name) {
    if (name.isEmpty) return '';
    final first = name[0].toUpperCase();
    // Map special chars
    if ('AĐ'.contains(first)) return first;
    return first;
  }

  /// Gom contacts theo chữ cái đầu tiên.
  Map<String, List<ContactData>> _groupByLetter(List<ContactData> contacts) {
    final grouped = <String, List<ContactData>>{};
    for (final c in contacts) {
      final letter = _getFirstLetter(c.fullName);
      grouped.putIfAbsent(letter, () => []).add(c);
    }
    // Sắp xếp theo thứ tự bảng chữ cái
    final sortedKeys = grouped.keys.toList()
      ..sort((a, b) {
        const order = 'ABCDEGHIKLMNOPQRSUTVXY';
        final ai = order.indexOf(a);
        final bi = order.indexOf(b);
        if (ai == -1 && bi == -1) return a.compareTo(b);
        if (ai == -1) return 1;
        if (bi == -1) return -1;
        return ai.compareTo(bi);
      });
    final result = <String, List<ContactData>>{};
    for (final key in sortedKeys) {
      result[key] = grouped[key]!;
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F2F5),
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: const Text(
          'Danh bạ',
          style: TextStyle(
            color: AppColors.heading,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search_outlined,
              color: AppColors.heading,
              size: 26,
            ),
            onPressed: () {
              setState(() {
                _isSearchVisible = true;
              });
            },
          ),
          const SizedBox(width: 4),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(_isSearchVisible ? 60 : 48),
          child: _isSearchVisible ? _buildSearchField() : _buildTabBar(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildContactList(),
          _buildContactList(),
          _buildDepartmentList(),
        ],
      ),
    );
  }

  /// Thanh tìm kiếm trong AppBar.
  Widget _buildSearchField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 6, 16, 6),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _searchController,
              autofocus: true,
              decoration: InputDecoration(
                hintText: 'Tìm kiếm tên, phòng ban...',
                hintStyle: const TextStyle(
                  color: AppColors.hintText,
                  fontSize: 14,
                ),
                prefixIcon: const Icon(
                  Icons.search_outlined,
                  color: AppColors.hintText,
                  size: 22,
                ),
                filled: true,
                fillColor: AppColors.bgCard,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value.trim();
                });
              },
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () {
              setState(() {
                _isSearchVisible = false;
                _searchQuery = '';
                _searchController.clear();
              });
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              child: const Icon(
                Icons.close,
                color: AppColors.heading,
                size: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// TabBar lọc liên hệ.
  Widget _buildTabBar() {
    return TabBar(
      controller: _tabController,
      labelColor: AppColors.primaryERP,
      unselectedLabelColor: AppColors.gray,
      labelStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      indicatorColor: AppColors.primaryERP,
      indicatorWeight: 2.5,
      dividerColor: Colors.transparent,
      onTap: (_) => setState(() {}),
      tabs: const [
        Tab(text: 'Tất cả'),
        Tab(text: 'Nhân viên'),
        Tab(text: 'Phòng ban'),
      ],
    );
  }

  /// Danh sách liên hệ theo bảng chữ cái.
  Widget _buildContactList() {
    final contacts = _filteredContacts;
    if (contacts.isEmpty) {
      return _buildEmptyState();
    }

    final grouped = _groupByLetter(contacts);

    return Stack(
      children: [
        ListView.builder(
          padding: const EdgeInsets.only(right: 16, top: 8, bottom: 20),
          itemCount: grouped.length,
          itemBuilder: (context, index) {
            final letter = grouped.keys.elementAt(index);
            final items = grouped[letter]!;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Section header
                _SectionHeader(letter: letter),
                ...items.map(
                  (c) => _ContactTile(
                    data: c,
                    onTap: () => _openDetail(context, c),
                  ),
                ),
              ],
            );
          },
        ),

        // Thanh index A-Z
        Positioned(
          right: 0,
          top: 0,
          bottom: 0,
          child: _AlphabetIndex(
            letters: _alphabet,
            onLetterTap: _scrollToLetter,
          ),
        ),
      ],
    );
  }

  /// Danh sách phòng ban.
  Widget _buildDepartmentList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _departments.length,
      itemBuilder: (context, index) {
        final dept = _departments[index];
        return _DepartmentTile(data: dept, onTap: () {});
      },
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.person_search_outlined,
            size: 64,
            color: AppColors.gray.withValues(alpha: 0.5),
          ),
          const SizedBox(height: 16),
          Text(
            _searchQuery.isNotEmpty
                ? 'Không tìm thấy liên hệ'
                : 'Chưa có liên hệ nào',
            style: const TextStyle(color: AppColors.gray, fontSize: 15),
          ),
        ],
      ),
    );
  }

  void _openDetail(BuildContext context, ContactData contact) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => ContactDetailScreen(contact: contact)),
    );
  }
}

/// Thanh index bảng chữ cái bên phải.
class _AlphabetIndex extends StatelessWidget {
  final List<String> letters;
  final void Function(String) onLetterTap;

  const _AlphabetIndex({required this.letters, required this.onLetterTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: letters.map((letter) {
          return GestureDetector(
            onTap: () => onLetterTap(letter),
            child: Container(
              height: 17,
              alignment: Alignment.center,
              child: Text(
                letter,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: AppColors.secondaryERP,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

/// Section header hiển thị chữ cái.
class _SectionHeader extends StatelessWidget {
  final String letter;

  const _SectionHeader({required this.letter});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 6),
      child: Text(
        letter,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: AppColors.secondaryERP,
        ),
      ),
    );
  }
}

/// Dữ liệu phòng ban.
class _DepartmentData {
  final String id;
  final String name;
  final int memberCount;

  const _DepartmentData({
    required this.id,
    required this.name,
    required this.memberCount,
  });
}

/// Item hiển thị một liên hệ trong danh sách.
class _ContactTile extends StatelessWidget {
  final ContactData data;
  final VoidCallback onTap;

  const _ContactTile({required this.data, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 1),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            // Avatar với trạng thái online
            Stack(
              clipBehavior: Clip.none,
              children: [
                _ContactAvatar(
                  text: data.avatar,
                  color: data.avatarColor,
                  size: 46,
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: data.isOnline
                          ? const Color(0xFF41B339)
                          : AppColors.gray.withValues(alpha: 0.5),
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.white, width: 2),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(width: 12),

            // Thông tin: tên + chức vụ + phòng ban
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.fullName,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: AppColors.heading,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '${data.position} • ${data.department}',
                    style: const TextStyle(fontSize: 12, color: AppColors.gray),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),

            // Icon gọi điện
            Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                color: AppColors.primaryERP.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.phone_outlined,
                color: AppColors.primaryERP,
                size: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Item hiển thị một phòng ban.
class _DepartmentTile extends StatelessWidget {
  final _DepartmentData data;
  final VoidCallback onTap;

  const _DepartmentTile({required this.data, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: const Color(0xFFE8EAF0), width: 1),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF1A1A1A).withValues(alpha: 0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                gradient: AppColors.gradientERP,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.business_outlined,
                color: Colors.white,
                size: 24,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.name,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: AppColors.heading,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    '${data.memberCount} thành viên',
                    style: const TextStyle(fontSize: 13, color: AppColors.gray),
                  ),
                ],
              ),
            ),
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: AppColors.bgCard,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.arrow_forward_ios,
                color: AppColors.gray,
                size: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Avatar tròn cho liên hệ.
class _ContactAvatar extends StatelessWidget {
  final String text;
  final Color color;
  final double size;

  const _ContactAvatar({
    required this.text,
    required this.color,
    this.size = 44,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: size * 0.3,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
