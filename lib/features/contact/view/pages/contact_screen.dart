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
// Dữ liệu từ API /Home/get-all-contact.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../base/bloc/index.dart';
import '../../../../../../common/app_theme/index.dart';
import '../../../../../../di/injection.dart';
import '../bloc/contact_bloc.dart';
import '../../data/datasource/models/contact_model.dart';
import 'contact_detail_screen.dart';

/// Màn hình danh bạ - tab thứ 4 trong DashboardScreen.
///
/// Hiển thị danh sách liên hệ theo bảng chữ cái với thanh index A-Z.
/// Hỗ trợ lọc theo tabs và tìm kiếm theo tên.
/// Dữ liệu lấy từ API /Home/get-all-contact.
class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<ContactBloc>()..add(const ContactEvent.init(departmentID: 0)),
      child: const _ContactView(),
    );
  }
}

class _ContactView extends StatefulWidget {
  const _ContactView();

  @override
  State<_ContactView> createState() => _ContactViewState();
}

class _ContactViewState extends State<_ContactView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _searchQuery = '';
  bool _isSearchVisible = false;
  final TextEditingController _searchController = TextEditingController();

  static const List<String> _alphabet = [
    'A', 'B', 'C', 'D', 'E', 'G', 'H', 'I', 'K', 'L', 'M',
    'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'X', 'Y',
  ];

  final Map<String, GlobalKey> _sectionKeys = {};

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_onTabChanged);
  }

  void _onTabChanged() {
    if (!_tabController.indexIsChanging) {
      _sectionKeys.clear();
    }
  }

  GlobalKey _getSectionKey(String letter) {
    return _sectionKeys.putIfAbsent(letter, () => GlobalKey());
  }

  /// Nhảy đến section theo chữ cái.
  void _scrollToLetter(String letter) {
    final list = _filteredContacts;
    for (int i = 0; i < list.length; i++) {
      final firstLetter = _getFirstLetter(list[i].fullName ?? '');
      if (firstLetter == letter) {
        final key = _getSectionKey(letter);
        if (key.currentContext != null) {
          Scrollable.ensureVisible(
            key.currentContext!,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
        return;
      }
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  List<ContactPersonalItem> get _filteredContacts {
    final contacts = context.read<ContactBloc>().state.contacts;

    // Lọc theo từ khóa
    if (_searchQuery.isNotEmpty) {
      final q = _searchQuery.toLowerCase();
      return contacts
          .where(
            (c) =>
                (c.fullName?.toLowerCase().contains(q) ?? false) ||
                (c.departmentName?.toLowerCase().contains(q) ?? false) ||
                (c.chucVu?.toLowerCase().contains(q) ?? false) ||
                (c.code?.toLowerCase().contains(q) ?? false),
          )
          .toList();
    }

    return contacts;
  }

  String _getFirstLetter(String name) {
    if (name.isEmpty) return '';
    final first = name[0].toUpperCase();
    if ('AĐ'.contains(first)) return first;
    return first;
  }

  /// Gom contacts theo chữ cái đầu tiên.
  Map<String, List<ContactPersonalItem>> _groupByLetter(
      List<ContactPersonalItem> contacts) {
    final grouped = <String, List<ContactPersonalItem>>{};
    for (final c in contacts) {
      final letter = _getFirstLetter(c.fullName ?? '');
      if (letter.isEmpty) continue;
      grouped.putIfAbsent(letter, () => []).add(c);
    }
    // Sắp xếp theo thứ tự bảng chữ cái
    const order = 'ABCDEGHIKLMNOPQRSUTVXY';
    final sortedKeys = grouped.keys.toList()
      ..sort((a, b) {
        final ai = order.indexOf(a);
        final bi = order.indexOf(b);
        if (ai == -1 && bi == -1) return a.compareTo(b);
        if (ai == -1) return 1;
        if (bi == -1) return -1;
        return ai.compareTo(bi);
      });
    final result = <String, List<ContactPersonalItem>>{};
    for (final key in sortedKeys) {
      result[key] = grouped[key]!;
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactBloc, ContactState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color(0xFFF0F2F5),
          resizeToAvoidBottomInset: false,
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
          body: _buildBody(state),
        );
      },
    );
  }

  Widget _buildBody(ContactState state) {
    if (state.status == BaseStateStatus.loading &&
        state.contacts.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.status == BaseStateStatus.failed && state.contacts.isEmpty) {
      return _buildErrorState(
        message: state.message ?? 'Không tải được danh bạ',
        onRetry: () => context.read<ContactBloc>().add(
              ContactEvent.refresh(
                departmentID: state.departmentID,
                keyword: state.keyword,
              ),
            ),
      );
    }

    return TabBarView(
      controller: _tabController,
      children: [
        _buildContactList(state.contacts),
        _buildDepartmentList(state.contacts),
      ],
    );
  }

  Widget _buildErrorState({
    required String message,
    required VoidCallback onRetry,
  }) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 48,
              color: AppColors.alert,
            ),
            const SizedBox(height: 16),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14, color: AppColors.heading),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: onRetry,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryERP,
                foregroundColor: Colors.white,
              ),
              child: const Text('Thử lại'),
            ),
          ],
        ),
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
        Tab(text: 'Phòng ban'),
      ],
    );
  }

  /// Danh sách liên hệ theo bảng chữ cái.
  Widget _buildContactList(List<ContactPersonalItem> contacts) {
    final filtered = _filteredContacts;
    if (filtered.isEmpty) {
      return _buildEmptyState();
    }

    final grouped = _groupByLetter(filtered);

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
                _SectionHeader(key: _getSectionKey(letter), letter: letter),
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
  Widget _buildDepartmentList(List<ContactPersonalItem> contacts) {
    final allContacts = _filteredContacts;
    final departments = <String, List<ContactPersonalItem>>{};
    for (final c in allContacts) {
      final dept = c.departmentName;
      if (dept != null && dept.isNotEmpty) {
        departments.putIfAbsent(dept, () => []).add(c);
      }
    }

    final deptList = departments.entries.toList()
      ..sort((a, b) => a.key.compareTo(b.key));

    if (deptList.isEmpty) {
      return Center(
        child: Text(
          _searchQuery.isNotEmpty ? 'Không tìm thấy phòng ban' : 'Chưa có phòng ban nào',
          style: const TextStyle(color: AppColors.gray, fontSize: 14),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: deptList.length,
      itemBuilder: (context, index) {
        final entry = deptList[index];
        return _DepartmentTile(
          name: entry.key,
          memberCount: entry.value.length,
          contacts: entry.value,
          onContactTap: (c) => _openDetail(context, c),
        );
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

  void _openDetail(BuildContext context, ContactPersonalItem contact) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ContactDetailScreen(contact: contact),
      ),
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
      padding: const EdgeInsets.symmetric(vertical: 4),
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

  const _SectionHeader({required this.letter, super.key});

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

/// Item hiển thị một liên hệ trong danh sách.
class _ContactTile extends StatelessWidget {
  final ContactPersonalItem data;
  final VoidCallback onTap;

  const _ContactTile({required this.data, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final avatarText = (data.fullName?.trim().isNotEmpty ?? false)
        ? data.fullName!.trim()[0].toUpperCase()
        : '?';

    final avatarColor = _colorForLetter(avatarText);

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
            // Avatar
            Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                color: avatarColor,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Text(
                avatarText,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            const SizedBox(width: 12),

            // Thông tin: tên + chức vụ + phòng ban
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.fullName ?? '--',
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
                    '${data.chucVu ?? ''}${data.chucVu != null && data.chucVu!.isNotEmpty && data.departmentName != null && data.departmentName!.isNotEmpty ? ' • ' : ''}${data.departmentName ?? ''}',
                    style: const TextStyle(fontSize: 12, color: AppColors.gray),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),

            // Icon gọi điện
            InkWell(
              onTap: () async {
                final phone = data.sdtCaNhan;
                if (phone != null && phone.isNotEmpty) {
                  // Launch phone call
                }
              },
              child: Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                  color: AppColors.primaryERP.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.phone_outlined,
                  color: AppColors.primaryERP,
                  size: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _colorForLetter(String letter) {
    const colors = {
      'A': Color(0xFF2957A6),
      'B': Color(0xFFEE4623),
      'C': Color(0xFF41B339),
      'D': Color(0xFFF0891A),
      'E': Color(0xFF853EFD),
      'F': Color(0xFF2F80ED),
      'G': Color(0xFF009688),
      'H': Color(0xFFE91E63),
      'I': Color(0xFF795548),
      'J': Color(0xFFFF5722),
      'K': Color(0xFF607D8B),
      'L': Color(0xFF9C27B0),
      'M': Color(0xFF3F51B5),
      'N': Color(0xFF00BCD4),
      'O': Color(0xFF8BC34A),
      'P': Color(0xFFFF9800),
      'Q': Color(0xFF673AB7),
      'R': Color(0xFF4CAF50),
      'S': Color(0xFFCDDC39),
      'T': Color(0xFF03A9F4),
      'U': Color(0xFFF44336),
      'V': Color(0xFF009688),
      'W': Color(0xFFFFC107),
      'X': Color(0xFF9E9E9E),
      'Y': Color(0xFF607D8B),
    };
    return colors[letter.toUpperCase()] ?? AppColors.primaryERP;
  }
}

/// Item hiển thị một phòng ban (expandable).
class _DepartmentTile extends StatefulWidget {
  final String name;
  final int memberCount;
  final List<ContactPersonalItem> contacts;
  final void Function(ContactPersonalItem) onContactTap;

  const _DepartmentTile({
    required this.name,
    required this.memberCount,
    required this.contacts,
    required this.onContactTap,
  });

  @override
  State<_DepartmentTile> createState() => _DepartmentTileState();
}

class _DepartmentTileState extends State<_DepartmentTile> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE8EAF0), width: 1),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF1A1A1A).withValues(alpha: 0.06),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header - phòng ban
          InkWell(
            onTap: () => setState(() => _isExpanded = !_isExpanded),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      gradient: AppColors.gradientERP,
                      borderRadius: BorderRadius.circular(14),
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
                          widget.name,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: AppColors.heading,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          '${widget.memberCount} thành viên',
                          style: const TextStyle(fontSize: 13, color: AppColors.gray),
                        ),
                      ],
                    ),
                  ),
                  AnimatedRotation(
                    turns: _isExpanded ? 0.5 : 0,
                    duration: const Duration(milliseconds: 200),
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: AppColors.primaryERP.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.keyboard_arrow_down,
                        color: AppColors.primaryERP,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Danh sách liên hệ trong phòng ban
          AnimatedCrossFade(
            firstChild: const SizedBox.shrink(),
            secondChild: Column(
              children: [
                Container(
                  height: 1,
                  color: const Color(0xFFE8EAF0),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8F9FB),
                    borderRadius: const BorderRadius.vertical(bottom: Radius.circular(16)),
                  ),
                  child: Column(
                    children: widget.contacts.asMap().entries.map((entry) {
                      final index = entry.key;
                      final c = entry.value;
                      final isLast = index == widget.contacts.length - 1;
                      final avatarText = (c.fullName?.trim().isNotEmpty ?? false)
                          ? c.fullName!.trim()[0].toUpperCase()
                          : '?';
                      final avatarColor = _avatarColorFor(avatarText);
                      return Column(
                        children: [
                          InkWell(
                            onTap: () => widget.onContactTap(c),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                              child: Row(
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: avatarColor,
                                      shape: BoxShape.circle,
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      avatarText,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          c.fullName ?? '--',
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.heading,
                                          ),
                                        ),
                                        if ((c.chucVu?.trim() ?? '').isNotEmpty)
                                          Text(
                                            c.chucVu!.trim(),
                                            style: const TextStyle(
                                              fontSize: 12,
                                              color: AppColors.gray,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                  const Icon(
                                    Icons.chevron_right,
                                    color: AppColors.gray,
                                    size: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          if (!isLast)
                            Padding(
                              padding: const EdgeInsets.only(left: 68),
                              child: Container(
                                height: 1,
                                color: const Color(0xFFE8EAF0).withValues(alpha: 0.6),
                              ),
                            ),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            crossFadeState: _isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 200),
          ),
        ],
      ),
    );
  }

  Color _avatarColorFor(String letter) {
    const colors = {
      'A': Color(0xFF2957A6),
      'B': Color(0xFFEE4623),
      'C': Color(0xFF41B339),
      'D': Color(0xFFF0891A),
      'E': Color(0xFF853EFD),
      'F': Color(0xFF2F80ED),
      'G': Color(0xFF009688),
      'H': Color(0xFFE91E63),
      'I': Color(0xFF795548),
      'J': Color(0xFFFF5722),
      'K': Color(0xFF607D8B),
      'L': Color(0xFF9C27B0),
      'M': Color(0xFF3F51B5),
      'N': Color(0xFF00BCD4),
      'O': Color(0xFF8BC34A),
      'P': Color(0xFFFF9800),
      'Q': Color(0xFF673AB7),
      'R': Color(0xFF4CAF50),
      'S': Color(0xFFCDDC39),
      'T': Color(0xFF03A9F4),
      'U': Color(0xFFF44336),
      'V': Color(0xFF009688),
      'W': Color(0xFFFFC107),
      'X': Color(0xFF9E9E9E),
      'Y': Color(0xFF607D8B),
    };
    return colors[letter.toUpperCase()] ?? AppColors.primaryERP;
  }
}
