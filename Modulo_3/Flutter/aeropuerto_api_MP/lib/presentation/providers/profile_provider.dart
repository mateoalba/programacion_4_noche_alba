import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/model/user.dart';
import '../../data/remote/api/auth_remote_datasource.dart';
import 'auth_provider.dart';

final profileProvider =
    StateNotifierProvider<ProfileNotifier, ProfileState>((ref) {
  final datasource = ref.watch(authDatasourceProvider);
  return ProfileNotifier(datasource);
});

class ProfileState {
  final LoggedUser? usuario;
  final bool cargando;
  final bool guardando;
  final String? error;
  final String? exito;

  const ProfileState({
    this.usuario,
    this.cargando = false,
    this.guardando = false,
    this.error,
    this.exito,
  });

  ProfileState copyWith({
    LoggedUser? usuario,
    bool? cargando,
    bool? guardando,
    String? error,
    String? exito,
    bool limpiarError = false,
    bool limpiarExito = false,
  }) {
    return ProfileState(
      usuario: usuario ?? this.usuario,
      cargando: cargando ?? this.cargando,
      guardando: guardando ?? this.guardando,
      error: limpiarError ? null : (error ?? this.error),
      exito: limpiarExito ? null : (exito ?? this.exito),
    );
  }
}

class ProfileNotifier extends StateNotifier<ProfileState> {
  final AuthRemoteDatasource _datasource;

  ProfileNotifier(this._datasource) : super(const ProfileState()) {
    cargarPerfil();
  }

  Future<void> cargarPerfil() async {
    state = state.copyWith(cargando: true, limpiarError: true);
    try {
      final user = await _datasource.obtenerPerfil();
      state = state.copyWith(usuario: user, cargando: false);
    } catch (e) {
      state = state.copyWith(
        cargando: false,
        error: e.toString().replaceFirst('Exception: ', ''),
      );
    }
  }

  Future<bool> actualizarPerfil(Map<String, dynamic> campos) async {
    state = state.copyWith(guardando: true, limpiarError: true, limpiarExito: true);
    try {
      final user = await _datasource.actualizarPerfil(campos);
      state = state.copyWith(
        usuario: user,
        guardando: false,
        exito: 'Perfil actualizado exitosamente',
      );
      return true;
    } catch (e) {
      state = state.copyWith(
        guardando: false,
        error: e.toString().replaceFirst('Exception: ', ''),
      );
      return false;
    }
  }
}
