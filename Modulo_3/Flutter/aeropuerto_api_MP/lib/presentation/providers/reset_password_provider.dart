import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/remote/api/auth_remote_datasource.dart';
import '../../domain/model/auth_models.dart';
import 'auth_provider.dart';

final resetPasswordProvider =
    StateNotifierProvider<ResetPasswordNotifier, ResetPasswordState>((ref) {
  final datasource = ref.watch(authDatasourceProvider);
  return ResetPasswordNotifier(datasource);
});

class ResetPasswordState {
  final bool cargando;
  final bool restablecido;
  final String? error;

  const ResetPasswordState({
    this.cargando = false,
    this.restablecido = false,
    this.error,
  });

  ResetPasswordState copyWith({
    bool? cargando,
    bool? restablecido,
    String? error,
    bool limpiarError = false,
  }) {
    return ResetPasswordState(
      cargando: cargando ?? this.cargando,
      restablecido: restablecido ?? this.restablecido,
      error: limpiarError ? null : (error ?? this.error),
    );
  }
}

class ResetPasswordNotifier extends StateNotifier<ResetPasswordState> {
  final AuthRemoteDatasource _datasource;

  ResetPasswordNotifier(this._datasource)
      : super(const ResetPasswordState());

  Future<bool> restablecerContrasena(String token, String password) async {
    state = state.copyWith(cargando: true, limpiarError: true);
    try {
      await _datasource.resetPassword(
        ResetPasswordRequest(token: token, password: password),
      );
      state = state.copyWith(cargando: false, restablecido: true);
      return true;
    } catch (e) {
      state = state.copyWith(
        cargando: false,
        error: e.toString().replaceFirst('Exception: ', ''),
      );
      return false;
    }
  }

  void reset() {
    state = const ResetPasswordState();
  }
}
