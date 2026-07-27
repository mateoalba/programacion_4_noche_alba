class Validators {
  static String? validateCodigoVuelo(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'El código de vuelo es obligatorio';
    }
    final regex = RegExp(r'^[A-Z]{2}\d{4}$');
    if (!regex.hasMatch(value.trim().toUpperCase())) {
      return 'Formato inválido (ej: AB1234)';
    }
    return null;
  }

  static String? validateAerolinea(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'La aerolínea es obligatoria';
    }
    if (value.trim().length < 2) {
      return 'Nombre de aerolínea demasiado corto';
    }
    return null;
  }

  static String? validateOrigen(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'El origen es obligatorio';
    }
    return null;
  }

  static String? validateDestino(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'El destino es obligatorio';
    }
    return null;
  }

  static String? validatePuerta(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'La puerta es obligatoria';
    }
    final regex = RegExp(r'^[A-Z]\d{1,3}$');
    if (!regex.hasMatch(value.trim().toUpperCase())) {
      return 'Formato inválido (ej: A12)';
    }
    return null;
  }

  static String? validatePasajeros(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'El número de pasajeros es obligatorio';
    }
    final num? n = num.tryParse(value.trim());
    if (n == null || n < 0 || n > 600) {
      return 'Ingrese un número entre 0 y 600';
    }
    return null;
  }

  static String? validateCapacidad(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'La capacidad es obligatoria';
    }
    final num? n = num.tryParse(value.trim());
    if (n == null || n <= 0 || n > 900) {
      return 'Ingrese una capacidad válida (1-900)';
    }
    return null;
  }

  static String? validateRequired(String? value, String campo) {
    if (value == null || value.trim().isEmpty) {
      return '$campo es obligatorio';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'El correo es obligatorio';
    }
    final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!regex.hasMatch(value.trim())) {
      return 'Correo electrónico inválido';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'La contraseña es obligatoria';
    }
    if (value.length < 6) {
      return 'La contraseña debe tener al menos 6 caracteres';
    }
    return null;
  }

  static String? validateDocumento(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'El documento es obligatorio';
    }
    if (value.trim().length < 5) {
      return 'Documento demasiado corto';
    }
    return null;
  }

  static String? validateAsiento(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'El asiento es obligatorio';
    }
    final regex = RegExp(r'^\d{1,3}[A-Z]?$');
    if (!regex.hasMatch(value.trim().toUpperCase())) {
      return 'Formato inválido (ej: 12A)';
    }
    return null;
  }
}
