import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';

class SearchBarWidget extends StatefulWidget {
  final String hintText;
  final Function(String) onSearch;
  final VoidCallback? onFilterTap;
  final String? initialValue;

  const SearchBarWidget({
    super.key,
    this.hintText = 'Buscar...',
    required this.onSearch,
    this.onFilterTap,
    this.initialValue,
  });

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              onChanged: widget.onSearch,
              decoration: InputDecoration(
                hintText: widget.hintText,
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _controller.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _controller.clear();
                          widget.onSearch('');
                        },
                      )
                    : null,
                filled: true,
                fillColor: AppColors.inputDark,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: AppColors.borderDark),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: AppColors.borderDark),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                      color: AppColors.primary, width: 2),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
            ),
          ),
          if (widget.onFilterTap != null) ...[
            const SizedBox(width: 8),
            IconButton.filled(
              onPressed: widget.onFilterTap,
              icon: const Icon(Icons.filter_list),
              style: IconButton.styleFrom(
                backgroundColor: AppColors.cardDark,
                foregroundColor: AppColors.accent,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
