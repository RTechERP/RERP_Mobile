import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../base/bloc/index.dart';
import '../../../../../../common/app_theme/index.dart';
import '../../../../../../di/injection.dart';
import '../../data/datasource/models/business_card_model.dart';
import '../bloc/business_card_bloc.dart';

/// Màn hình danh thiếp - hiển thị danh sách danh thiếp với 3 tabs.
/// 
/// Giao diện:
///   - AppBar với title và icon tìm kiếm
///   - Tabs lọc: "Tất cả", "Phòng ban", "Danh thiếp" (yêu thích)
///   - Thanh tìm kiếm (ẩn/hiện)
///   - Section header theo chữ cái (A, B, C...)
///   - BusinessCardTile: avatar + tên + chức vụ + phòng ban + icon gọi điện
///   - Thanh index A-Z bên phải màn hình để nhảy nhanh theo bảng chữ cái
///   - Nhấn vào card sẽ mở BusinessCardDetailScreen
class BusinessCardScreen extends StatelessWidget {
  const BusinessCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<BusinessCardBloc>()..add(const BusinessCardEvent.init()),
      child: const _BusinessCardView(),
    );
  }
}

class _BusinessCardView extends StatefulWidget {
  const _BusinessCardView();

  @override
  State<_BusinessCardView> createState() => _BusinessCardViewState();
}

class _BusinessCardViewState extends State<_BusinessCardView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _searchQuery = '';
  bool _isSearchVisible = false;
  final TextEditingController _searchController = TextEditingController();
  Timer? _debounceTimer;

  List<BusinessCardModel> _cachedFilteredCards = [];
  String _cachedSearchQuery = '';

  static final Map<String, int> _alphabetOrder = {
    'A': 0, 'B': 1, 'C': 2, 'D': 3, 'E': 4, 'G': 5, 'H': 6, 'I': 7,
    'K': 8, 'L': 9, 'M': 10, 'N': 11, 'O': 12, 'P': 13, 'Q': 14, 'R': 15,
    'S': 16, 'T': 17, 'U': 18, 'V': 19, 'X': 20, 'Y': 21,
  };

  static const List<String> _alphabet = [
    'A', 'B', 'C', 'D', 'E', 'G', 'H', 'I', 'K', 'L', 'M',
    'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'X', 'Y',
  ];

  final Map<String, GlobalKey> _sectionKeys = {};

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_onTabChanged);
  }

  void _onTabChanged() {
    if (!_tabController.indexIsChanging) {
      _sectionKeys.clear();
      setState(() {});
    }
  }

  GlobalKey _getSectionKey(String letter) {
    return _sectionKeys.putIfAbsent(letter, () => GlobalKey());
  }

  void _scrollToLetter(String letter) {
    final list = _filteredCards;
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
    _debounceTimer?.cancel();
    super.dispose();
  }

  List<BusinessCardModel> get _filteredCards {
    final cards = <BusinessCardModel>[];

    if (_searchQuery == _cachedSearchQuery && _cachedFilteredCards.isNotEmpty) {
      return _cachedFilteredCards;
    }

    List<BusinessCardModel> filtered;
    if (_searchQuery.isNotEmpty) {
      final q = _searchQuery.toLowerCase();
      filtered = cards
          .where(
            (c) =>
                (c.fullName?.toLowerCase().contains(q) ?? false) ||
                (c.departmentName?.toLowerCase().contains(q) ?? false) ||
                (c.chucVu?.toLowerCase().contains(q) ?? false) ||
                (c.code?.toLowerCase().contains(q) ?? false),
          )
          .toList();
    } else {
      filtered = cards;
    }

    _cachedSearchQuery = _searchQuery;
    _cachedFilteredCards = filtered;
    return filtered;
  }

  List<BusinessCardModel> get _displayedCards {
    final filtered = _filteredCards;
    final tabIndex = _tabController.index;

    if (tabIndex == 1) {
      // Phòng ban tab - vẫn hiển thị tất cả (sẽ được group trong _buildDepartmentList)
      return filtered;
    } else if (tabIndex == 2) {
      // Danh thiếp (yêu thích)
      return filtered.where((c) => c.isFavorite == true).toList();
    }

    // Tất cả
    return filtered;
  }

  String _getFirstLetter(String name) {
    if (name.isEmpty) return '';
    final first = name[0].toUpperCase();
    if ('AĐ'.contains(first)) return first;
    return first;
  }

  Map<String, List<BusinessCardModel>> _groupByLetter(
      List<BusinessCardModel> cards) {
    final grouped = <String, List<BusinessCardModel>>{};
    for (final c in cards) {
      final letter = _getFirstLetter(c.fullName ?? '');
      if (letter.isEmpty) continue;
      grouped.putIfAbsent(letter, () => []).add(c);
    }
    final sortedKeys = grouped.keys.toList()
      ..sort((a, b) {
        final ai = _alphabetOrder[a] ?? 999;
        final bi = _alphabetOrder[b] ?? 999;
        return ai.compareTo(bi);
      });
    final result = <String, List<BusinessCardModel>>{};
    for (final key in sortedKeys) {
      result[key] = grouped[key]!;
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BusinessCardBloc, BusinessCardState>(
      buildWhen: (previous, current) => previous.status != current.status,
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
              'Danh thiếp',
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
              preferredSize: Size.fromHeight(_isSearchVisible ? 100 : 48),
              child: _isSearchVisible ? _buildSearchField() : _buildTabBar(),
            ),
          ),
          body: _buildBody(state),
        );
      },
    );
  }

  Widget _buildBody(BusinessCardState state) {
    if (state.status == BaseStateStatus.loading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.status == BaseStateStatus.failed) {
      return _buildErrorState(
        message: state.message ?? 'Không tải được danh thiếp',
        onRetry: () => context.read<BusinessCardBloc>()
            .add(const BusinessCardEvent.init()),
      );
    }

    return TabBarView(
      controller: _tabController,
      children: [
        _buildContactList(_displayedCards),
        _buildDepartmentList(_displayedCards),
        _buildContactList(_displayedCards),
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

  Widget _buildSearchField() {
    final matchedCount = _displayedCards.length;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
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
                    _debounceTimer?.cancel();
                    _debounceTimer =
                        Timer(const Duration(milliseconds: 400), () {
                      setState(() {
                        _searchQuery = value.trim();
                        _cachedSearchQuery = '';
                        _cachedFilteredCards = [];
                      });
                    });
                  },
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: () {
                  _debounceTimer?.cancel();
                  setState(() {
                    _isSearchVisible = false;
                    _searchQuery = '';
                    _cachedSearchQuery = '';
                    _cachedFilteredCards = [];
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
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 16, 8),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Danh thiếp tương ứng ($matchedCount)',
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: AppColors.secondaryERP,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTabBar() {
    final allCount = _filteredCards.length;
    final favoriteCount =
        _filteredCards.where((c) => c.isFavorite == true).length;
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
      tabs: [
        Tab(text: 'Tất cả ($allCount)'),
        const Tab(text: 'Phòng ban'),
        Tab(text: 'Danh thiếp ($favoriteCount)'),
      ],
    );
  }

  Widget _buildContactList(List<BusinessCardModel> cards) {
    if (cards.isEmpty) {
      return _buildEmptyState();
    }

    final grouped = _groupByLetter(cards);

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
                  (c) => _BusinessCardTile(
                    data: c,
                    onTap: () => _openDetail(context, c),
                  ),
                ),
              ],
            );
          },
        ),
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

  Widget _buildDepartmentList(List<BusinessCardModel> cards) {
    final departments = <String, List<BusinessCardModel>>{};
    for (final c in cards) {
      final dept = c.departmentName;
      if (dept != null && dept.isNotEmpty) {
        departments.putIfAbsent(dept, () => []).add(c);
      }
    }

    final deptList = departments.entries.toList();

    if (deptList.isEmpty) {
      return Center(
        child: Text(
          _searchQuery.isNotEmpty
              ? 'Không tìm thấy phòng ban'
              : 'Chưa có phòng ban nào',
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
          cards: entry.value,
          onCardTap: (c) => _openDetail(context, c),
        );
      },
    );
  }

  Widget _buildEmptyState() {
    final isFavoriteTab = _tabController.index == 2;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            isFavoriteTab
                ? Icons.star_border_outlined
                : Icons.person_search_outlined,
            size: 64,
            color: AppColors.gray.withValues(alpha: 0.5),
          ),
          const SizedBox(height: 16),
          Text(
            isFavoriteTab
                ? 'Chưa có danh thiếp yêu thích'
                : (_searchQuery.isNotEmpty
                    ? 'Không tìm thấy danh thiếp'
                    : 'Chưa có danh thiếp nào'),
            style: const TextStyle(color: AppColors.gray, fontSize: 15),
          ),
        ],
      ),
    );
  }

  void _openDetail(BuildContext context, BusinessCardModel card) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BusinessCardDetailScreen(card: card),
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

/// Item hiển thị một danh thiếp trong danh sách.
class _BusinessCardTile extends StatelessWidget {
  final BusinessCardModel data;
  final VoidCallback onTap;

  const _BusinessCardTile({required this.data, required this.onTap});

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
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          data.fullName ?? '--',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: AppColors.heading,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (data.isFavorite == true)
                        const Icon(
                          Icons.star,
                          size: 16,
                          color: Colors.amber,
                        ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (data.chucVu != null && data.chucVu!.trim().isNotEmpty)
                        Text(
                          data.chucVu!.trim(),
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.gray,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      if (data.departmentName != null &&
                          data.departmentName!.trim().isNotEmpty)
                        Text(
                          data.departmentName!.trim(),
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.gray,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                    ],
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () async {
                final phone = data.sdtCaNhan;
                if (phone != null && phone.isNotEmpty) {
                  final uri = Uri(scheme: 'tel', path: phone);
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(uri);
                  }
                }
              },
              child: Container(
                width: 55,
                height: 55,
                decoration: BoxDecoration(
                  color: AppColors.primaryERP.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.phone_outlined,
                  color: AppColors.primaryERP,
                  size: 22,
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
  final List<BusinessCardModel> cards;
  final void Function(BusinessCardModel) onCardTap;

  const _DepartmentTile({
    required this.name,
    required this.memberCount,
    required this.cards,
    required this.onCardTap,
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
          InkWell(
            onTap: () => setState(() => _isExpanded = !_isExpanded),
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(16)),
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
                          style:
                              const TextStyle(fontSize: 13, color: AppColors.gray),
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
          AnimatedCrossFade(
            firstChild: const SizedBox.shrink(),
            secondChild: Column(
              children: [
                Container(
                  height: 1,
                  color: const Color(0xFFE8EAF0),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFFF8F9FB),
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(16)),
                  ),
                  child: Column(
                    children: widget.cards.asMap().entries.map((entry) {
                      final index = entry.key;
                      final c = entry.value;
                      final isLast = index == widget.cards.length - 1;
                      final avatarText =
                          (c.fullName?.trim().isNotEmpty ?? false)
                              ? c.fullName!.trim()[0].toUpperCase()
                              : '?';
                      final avatarColor = _avatarColorFor(avatarText);
                      return Column(
                        children: [
                          InkWell(
                            onTap: () => widget.onCardTap(c),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          c.fullName ?? '--',
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.heading,
                                          ),
                                        ),
                                        if ((c.chucVu?.trim() ?? '')
                                            .isNotEmpty)
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
                                  GestureDetector(
                                    onTap: () async {
                                      final phone = c.sdtCaNhan;
                                      if (phone != null && phone.isNotEmpty) {
                                        final uri =
                                            Uri(scheme: 'tel', path: phone);
                                        if (await canLaunchUrl(uri)) {
                                          await launchUrl(uri);
                                        }
                                      }
                                    },
                                    child: Container(
                                      width: 45,
                                      height: 45,
                                      decoration: BoxDecoration(
                                        color: AppColors.primaryERP
                                            .withValues(alpha: 0.1),
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        Icons.phone_outlined,
                                        color: AppColors.primaryERP,
                                        size: 18,
                                      ),
                                    ),
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

/// Màn hình chi tiết danh thiếp.
class BusinessCardDetailScreen extends StatelessWidget {
  final BusinessCardModel card;

  const BusinessCardDetailScreen({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    final avatarText = (card.fullName?.trim().isNotEmpty ?? false)
        ? card.fullName!.trim()[0].toUpperCase()
        : '?';

    return Scaffold(
      backgroundColor: const Color(0xFFF0F2F5),
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.heading),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Chi tiết danh thiếp',
          style: TextStyle(
            color: AppColors.heading,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16),
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
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      gradient: AppColors.gradientERP,
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      avatarText,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    card.fullName ?? '--',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: AppColors.heading,
                    ),
                  ),
                  const SizedBox(height: 4),
                  if (card.chucVu != null && card.chucVu!.trim().isNotEmpty)
                    Text(
                      card.chucVu!.trim(),
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.gray,
                      ),
                    ),
                  if (card.departmentName != null &&
                      card.departmentName!.trim().isNotEmpty)
                    Text(
                      card.departmentName!.trim(),
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.gray,
                      ),
                    ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (card.sdtCaNhan != null &&
                          card.sdtCaNhan!.trim().isNotEmpty)
                        _ActionButton(
                          icon: Icons.phone_outlined,
                          label: 'Gọi điện',
                          onTap: () async {
                            final uri = Uri(
                              scheme: 'tel',
                              path: card.sdtCaNhan!.trim(),
                            );
                            if (await canLaunchUrl(uri)) {
                              await launchUrl(uri);
                            }
                          },
                        ),
                      if (card.emailCongTy != null &&
                          card.emailCongTy!.trim().isNotEmpty)
                        _ActionButton(
                          icon: Icons.email_outlined,
                          label: 'Email',
                          onTap: () async {
                            final uri = Uri(
                              scheme: 'mailto',
                              path: card.emailCongTy!.trim(),
                            );
                            if (await canLaunchUrl(uri)) {
                              await launchUrl(uri);
                            }
                          },
                        ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF1A1A1A).withValues(alpha: 0.06),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Thông tin liên hệ',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.heading,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _InfoRow(
                    icon: Icons.phone_outlined,
                    label: 'Điện thoại',
                    value: card.sdtCaNhan ?? '--',
                  ),
                  _InfoRow(
                    icon: Icons.email_outlined,
                    label: 'Email công ty',
                    value: card.emailCongTy ?? '--',
                  ),
                  if (card.emailCaNhan != null &&
                      card.emailCaNhan!.trim().isNotEmpty)
                    _InfoRow(
                      icon: Icons.email_outlined,
                      label: 'Email cá nhân',
                      value: card.emailCaNhan!.trim(),
                    ),
                  if (card.address != null && card.address!.trim().isNotEmpty)
                    _InfoRow(
                      icon: Icons.location_on_outlined,
                      label: 'Địa chỉ',
                      value: card.address!.trim(),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF1A1A1A).withValues(alpha: 0.06),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Thông tin công ty',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.heading,
                    ),
                  ),
                  const SizedBox(height: 16),
                  if (card.companyName != null &&
                      card.companyName!.trim().isNotEmpty)
                    _InfoRow(
                      icon: Icons.business_outlined,
                      label: 'Công ty',
                      value: card.companyName!.trim(),
                    ),
                  if (card.companyAddress != null &&
                      card.companyAddress!.trim().isNotEmpty)
                    _InfoRow(
                      icon: Icons.location_city_outlined,
                      label: 'Địa chỉ công ty',
                      value: card.companyAddress!.trim(),
                    ),
                  if (card.companyPhone != null &&
                      card.companyPhone!.trim().isNotEmpty)
                    _InfoRow(
                      icon: Icons.phone_callback_outlined,
                      label: 'Điện thoại công ty',
                      value: card.companyPhone!.trim(),
                    ),
                ],
              ),
            ),
            if (card.code != null && card.code!.trim().isNotEmpty) ...[
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF1A1A1A).withValues(alpha: 0.06),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Mã nhân viên',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.heading,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      card.code!.trim(),
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primaryERP,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            color: AppColors.primaryERP.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Icon(icon, color: AppColors.primaryERP, size: 24),
              const SizedBox(height: 4),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.primaryERP,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: AppColors.gray),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.gray,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.heading,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
