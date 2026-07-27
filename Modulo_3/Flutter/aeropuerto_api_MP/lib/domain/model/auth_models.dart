import 'user.dart';

class AuthTokens {
  final String accessToken;
  final String refreshToken;
  final DateTime? expiresAt;

  const AuthTokens({
    required this.accessToken,
    required this.refreshToken,
    this.expiresAt,
  });

  factory AuthTokens.fromJson(Map<String, dynamic> json) {
    return AuthTokens(
      accessToken: json['access'] as String? ??
          json['accessToken'] as String? ??
          json['access_token'] as String? ??
          '',
      refreshToken: json['refresh'] as String? ??
          json['refreshToken'] as String? ??
          json['refresh_token'] as String? ??
          '',
      expiresAt: json['expiresAt'] != null
          ? DateTime.tryParse(json['expiresAt'] as String)
          : json['expires_at'] != null
              ? DateTime.tryParse(json['expires_at'] as String)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'access': accessToken,
      'refresh': refreshToken,
    };
  }

  bool get esValido {
    if (expiresAt == null) return true;
    return DateTime.now().isBefore(expiresAt!);
  }
}

class LoginRequest {
  final String username;
  final String password;

  const LoginRequest({
    required this.username,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
    };
  }
}

class RegisterRequest {
  final String username;
  final String email;
  final String password;
  final String passwordConfirm;

  const RegisterRequest({
    required this.username,
    required this.email,
    required this.password,
    required this.passwordConfirm,
  });

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'password': password,
      'password_confirm': passwordConfirm,
    };
  }
}

class ForgotPasswordRequest {
  final String email;

  const ForgotPasswordRequest({required this.email});

  Map<String, dynamic> toJson() => {'email': email};
}

class ResetPasswordRequest {
  final String token;
  final String password;

  const ResetPasswordRequest({
    required this.token,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        'token': token,
        'password': password,
      };
}

class AuthResponse {
  final LoggedUser usuario;
  final AuthTokens tokens;

  const AuthResponse({
    required this.usuario,
    required this.tokens,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      usuario: LoggedUser.fromJson(
        json['usuario'] as Map<String, dynamic>? ??
            json['user'] as Map<String, dynamic>? ??
            {},
      ),
      tokens: AuthTokens.fromJson(json),
    );
  }
}
