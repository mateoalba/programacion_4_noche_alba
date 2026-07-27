import 'package:flutter/material.dart';
import '../../../domain/model/user.dart';
import '../../../theme/app_colors.dart';

class UserAvatar extends StatelessWidget {
  final LoggedUser? usuario;
  final double radio;
  final bool mostrarNombre;

  const UserAvatar({
    super.key,
    this.usuario,
    this.radio = 20,
    this.mostrarNombre = false,
  });

  @override
  Widget build(BuildContext context) {
    final iniciales = usuario?.iniciales ?? '?';
    final nombre = usuario?.nombre ?? 'Usuario';

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: radio,
          backgroundColor: AppColors.accent,
          child: Text(
            iniciales,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: radio * 0.7,
            ),
          ),
        ),
        if (mostrarNombre) ...[
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                nombre,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: AppColors.textPrimaryDark,
                ),
              ),
              if (usuario?.email != null)
                Text(
                  usuario!.email,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.textSecondaryDark,
                  ),
                ),
            ],
          ),
        ],
      ],
    );
  }
}
