String? validateUsername(String? v) {
  if (v == null || v.trim().isEmpty) return 'Campo obligatorio';
  if (v.trim().length < 3) return 'Mínimo 3 caracteres';
  return null;
}

String? validateEmail(String? v) {
  if (v == null || v.trim().isEmpty) return 'Campo obligatorio';
  final ok = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(v.trim());
  return ok ? null : 'Email inválido';
}

String? validatePassword(String? v) {
  if (v == null || v.isEmpty) return 'Campo obligatorio';
  if (v.length < 8) return 'Mínimo 8 caracteres';
  return null;
}
