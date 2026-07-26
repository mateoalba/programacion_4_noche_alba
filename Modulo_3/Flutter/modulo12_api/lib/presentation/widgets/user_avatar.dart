import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../core/config/app_config.dart';

class UserAvatar extends StatelessWidget {
  final String?  avatarUrl;
  final String   username;
  final double   size;
  final VoidCallback? onTap;

  const UserAvatar({
    super.key,
    this.avatarUrl,
    required this.username,
    this.size = 80,
    this.onTap,
  });

  String? get _absoluteUrl => AppConfig.resolveImageUrl(avatarUrl);

  @override
  Widget build(BuildContext context) {
    final initial = username.isNotEmpty ? username[0].toUpperCase() : '?';

    final avatar = SizedBox(
      width: size, height: size,
      child: Stack(
        children: [
          _buildImage(initial),
          if (onTap != null)
            Positioned(
              bottom: 0, right: 0,
              child: Container(
                width: size * 0.35,
                height: size * 0.35,
                decoration: BoxDecoration(
                  color: AppColors.accent,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.surface, width: 2),
                ),
                child: const Icon(Icons.camera_alt,
                    color: AppColors.onAccent, size: 16),
              ),
            ),
        ],
      ),
    );

    if (onTap != null) {
      return GestureDetector(onTap: onTap!, child: avatar);
    }
    return avatar;
  }

  Widget _buildImage(String initial) {
    if (_absoluteUrl != null) {
      return ClipOval(
        child: CachedNetworkImage(
          imageUrl: _absoluteUrl!,
          fit: BoxFit.cover,
          width: size, height: size,
          placeholder: (_, __) => _GradientFallback(initial: initial, size: size),
          errorWidget: (_, __, ___) => _GradientFallback(initial: initial, size: size),
        ),
      );
    }
    return _GradientFallback(initial: initial, size: size);
  }
}

class _GradientFallback extends StatelessWidget {
  final String initial;
  final double size;
  const _GradientFallback({required this.initial, required this.size});

  @override
  Widget build(BuildContext context) => Container(
    width: size, height: size,
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        colors: [AppColors.accent, AppColors.accentLight],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      shape: BoxShape.circle,
    ),
    child: Center(
      child: Text(
        initial,
        style: TextStyle(
          color: AppColors.onAccent,
          fontSize: size * 0.42,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
