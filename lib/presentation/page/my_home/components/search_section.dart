import 'package:flutter/material.dart';
import 'package:yumemi_flutter_codecheck/application/theme/extensions/app_colors.dart';
import '../../../../l10n/app_localizations.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({
    super.key,
    required this.appColors,
    required this.searchController,
    required this.onQueryChanged,
    required this.onClear,
  });

  final AppColors appColors;
  final TextEditingController searchController;
  final Future<void> Function(String query) onQueryChanged;
  final Future<void> Function() onClear;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final scaleH = (size.height / 812).clamp(0.8, 1.3);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20 * scaleH),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.searchRepositories,
            style: TextStyle(
              color: appColors.onSurface,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 12 * scaleH),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: appColors.primary.withValues(alpha: 0.1),
                  blurRadius: 20,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: TextFormField(
              controller: searchController,
              style: TextStyle(color: appColors.onSurface, fontSize: 16),
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.searchFieldHint,
                hintStyle: TextStyle(color: appColors.secondary, fontSize: 15),
                prefixIcon: Container(
                  margin: EdgeInsets.only(
                    left: 16 * scaleH,
                    right: 12 * scaleH,
                  ),
                  child: Icon(
                    Icons.search_rounded,
                    color: appColors.primary,
                    size: 24,
                  ),
                ),
                prefixIconConstraints: BoxConstraints(minWidth: 52 * scaleH),
                suffixIcon: searchController.text.isNotEmpty
                    ? IconButton(
                        onPressed: () async {
                          await onClear();
                        },
                        icon: Icon(
                          Icons.clear_rounded,
                          color: appColors.secondary,
                          size: 20,
                        ),
                      )
                    : null,
                filled: true,
                fillColor: appColors.cardBackground,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: appColors.border, width: 1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: appColors.border, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: appColors.primary, width: 2),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20 * scaleH,
                  vertical: 18 * scaleH,
                ),
              ),
              onChanged: onQueryChanged,
            ),
          ),
        ],
      ),
    );
  }
}
