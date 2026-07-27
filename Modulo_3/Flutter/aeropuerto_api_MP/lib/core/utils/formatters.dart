import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Formatters {
  static String formatCodigoVuelo(String codigo) {
    if (codigo.length >= 2) {
      return '${codigo.substring(0, 2)} ${codigo.substring(2)}';
    }
    return codigo;
  }

  static String formatFechaHora(DateTime fecha) {
    return DateFormat('dd/MM/yyyy HH:mm').format(fecha);
  }

  static String formatFecha(DateTime fecha) {
    return DateFormat('dd/MM/yyyy').format(fecha);
  }

  static String formatHora(DateTime fecha) {
    return DateFormat('HH:mm').format(fecha);
  }

  static String formatEstadoVuelo(String estado) {
    switch (estado) {
      case 'programado':
        return 'Programado';
      case 'abordando':
        return 'Abordando';
      case 'en_vuelo':
        return 'En Vuelo';
      case 'retrasado':
        return 'Retrasado';
      case 'cancelado':
        return 'Cancelado';
      case 'aterrizado':
        return 'Aterrizado';
      case 'embarque':
        return 'Embarque';
      default:
        return estado;
    }
  }

  static Color estadoVueloColor(String estado) {
    switch (estado) {
      case 'programado':
        return const Color(0xFF42A5F5);
      case 'abordando':
        return const Color(0xFF66BB6A);
      case 'en_vuelo':
        return const Color(0xFF26A69A);
      case 'retrasado':
        return const Color(0xFFFFA726);
      case 'cancelado':
        return const Color(0xFFEF5350);
      case 'aterrizado':
        return const Color(0xFF78909C);
      case 'embarque':
        return const Color(0xFFAB47BC);
      default:
        return const Color(0xFF9E9E9E);
    }
  }

  static IconData estadoVueloIcon(String estado) {
    switch (estado) {
      case 'programado':
        return Icons.schedule;
      case 'abordando':
        return Icons.person_add;
      case 'en_vuelo':
        return Icons.flight;
      case 'retrasado':
        return Icons.access_time_filled;
      case 'cancelado':
        return Icons.cancel;
      case 'aterrizado':
        return Icons.flight_land;
      case 'embarque':
        return Icons.airline_seat_recline_normal;
      default:
        return Icons.help_outline;
    }
  }

  static String formatOcupacion(double porcentaje) {
    return '${(porcentaje * 100).toStringAsFixed(1)}%';
  }

  static String formatNumero(int numero) {
    return NumberFormat('#,##0').format(numero);
  }

  static String formatTipoDocumento(String tipo) {
    switch (tipo) {
      case 'CC':
        return 'Cédula de Ciudadanía';
      case 'CE':
        return 'Cédula de Extranjería';
      case 'Pasaporte':
        return 'Pasaporte';
      case 'TI':
        return 'Tarjeta de Identidad';
      default:
        return tipo;
    }
  }

  static String formatEstadoEmbarque(String estado) {
    switch (estado) {
      case 'pendiente':
        return 'Pendiente';
      case 'abordado':
        return 'Abordado';
      case 'ausente':
        return 'Ausente';
      default:
        return estado;
    }
  }
}
