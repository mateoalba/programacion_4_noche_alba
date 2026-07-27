import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/remote/api/auth_remote_datasource.dart';
import '../../domain/model/auth_models.dart';
import 'auth_provider.dart';

final forgotPasswordProvider =
    StateNotifierProvider<ForgotPasswordNotifier, ForgotPasswordState>((ref) {
  final datasource = ref.watch(authDatasourceProvider);
  return ForgotPasswordNotifier(datasource);
});

class ForgotPasswordState {
  final bool cargando;
  final bool enviado;
  final String? error;

  const ForgotPasswordState({
    this.cargando = false,
    this.enviado = false,
    this.error,
  });

  ForgotPasswordState copyWith({
    bool? cargando,
    bool? enviado,
    String? error,
    bool limpiarError = false,
  }) {
    return ForgotPasswordState(
      cargando: cargando ?? this.cargando,
      enviado: enviado ?? this.enviado,
      error: limpiarError ? null : (error ?? this.error),
    );
  }
}

class ForgotPasswordNotifier extends StateNotifier<ForgotPasswordState> {
  final AuthRemoteDatasource _datasource;

  ForgotPasswordNotifier(this._datasource)
      : super(const ForgotPasswordState());

  Future<bool> enviarCorreo(String email) async {
    state = state.copyWith(cargando: true, limpiarError: true);
    try {
      await _datasource.forgotPassword(
        ForgotPasswordRequest(email: email),
      );
      state = state.copyWith(cargando: false, enviado: true);
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
    state = const ForgotPasswordState();
  }
}
