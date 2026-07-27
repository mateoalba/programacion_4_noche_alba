package com.shopapp.data.remote.api;

@kotlin.Metadata(mv = {1, 9, 0}, k = 1, xi = 48, d1 = {"\u0000P\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\bf\u0018\u00002\u00020\u0001J\u001e\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u00032\b\b\u0001\u0010\u0005\u001a\u00020\u0006H\u00a7@\u00a2\u0006\u0002\u0010\u0007J\u001e\u0010\b\u001a\b\u0012\u0004\u0012\u00020\t0\u00032\b\b\u0001\u0010\u0005\u001a\u00020\nH\u00a7@\u00a2\u0006\u0002\u0010\u000bJ\u001e\u0010\f\u001a\b\u0012\u0004\u0012\u00020\r0\u00032\b\b\u0001\u0010\u0005\u001a\u00020\u000eH\u00a7@\u00a2\u0006\u0002\u0010\u000fJ\u001e\u0010\u0010\u001a\b\u0012\u0004\u0012\u00020\u00110\u00032\b\b\u0001\u0010\u0005\u001a\u00020\u0012H\u00a7@\u00a2\u0006\u0002\u0010\u0013J\u001e\u0010\u0014\u001a\b\u0012\u0004\u0012\u00020\t0\u00032\b\b\u0001\u0010\u0005\u001a\u00020\u0015H\u00a7@\u00a2\u0006\u0002\u0010\u0016J\u001e\u0010\u0017\u001a\b\u0012\u0004\u0012\u00020\u00040\u00032\b\b\u0001\u0010\u0005\u001a\u00020\u0018H\u00a7@\u00a2\u0006\u0002\u0010\u0019\u00a8\u0006\u001a"}, d2 = {"Lcom/shopapp/data/remote/api/AuthApi;", "", "confirmPasswordReset", "Lretrofit2/Response;", "Lcom/shopapp/data/remote/dto/MessageDto;", "body", "Lcom/shopapp/data/remote/dto/PasswordResetConfirmDto;", "(Lcom/shopapp/data/remote/dto/PasswordResetConfirmDto;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "login", "Lcom/shopapp/data/remote/dto/AuthResponseDto;", "Lcom/shopapp/data/remote/dto/LoginRequest;", "(Lcom/shopapp/data/remote/dto/LoginRequest;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "logout", "", "Lcom/shopapp/data/remote/dto/LogoutRequest;", "(Lcom/shopapp/data/remote/dto/LogoutRequest;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "refreshToken", "Lcom/shopapp/data/remote/dto/TokenRefreshResponseDto;", "Lcom/shopapp/data/remote/dto/TokenRefreshRequest;", "(Lcom/shopapp/data/remote/dto/TokenRefreshRequest;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "register", "Lcom/shopapp/data/remote/dto/RegisterRequest;", "(Lcom/shopapp/data/remote/dto/RegisterRequest;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "requestPasswordReset", "Lcom/shopapp/data/remote/dto/PasswordResetRequestDto;", "(Lcom/shopapp/data/remote/dto/PasswordResetRequestDto;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "app_debug"})
public abstract interface AuthApi {
    
    @retrofit2.http.POST(value = "auth/login/")
    @org.jetbrains.annotations.Nullable()
    public abstract java.lang.Object login(@retrofit2.http.Body()
    @org.jetbrains.annotations.NotNull()
    com.shopapp.data.remote.dto.LoginRequest body, @org.jetbrains.annotations.NotNull()
    kotlin.coroutines.Continuation<? super retrofit2.Response<com.shopapp.data.remote.dto.AuthResponseDto>> $completion);
    
    @retrofit2.http.POST(value = "auth/register/")
    @org.jetbrains.annotations.Nullable()
    public abstract java.lang.Object register(@retrofit2.http.Body()
    @org.jetbrains.annotations.NotNull()
    com.shopapp.data.remote.dto.RegisterRequest body, @org.jetbrains.annotations.NotNull()
    kotlin.coroutines.Continuation<? super retrofit2.Response<com.shopapp.data.remote.dto.AuthResponseDto>> $completion);
    
    @retrofit2.http.POST(value = "auth/token/refresh/")
    @org.jetbrains.annotations.Nullable()
    public abstract java.lang.Object refreshToken(@retrofit2.http.Body()
    @org.jetbrains.annotations.NotNull()
    com.shopapp.data.remote.dto.TokenRefreshRequest body, @org.jetbrains.annotations.NotNull()
    kotlin.coroutines.Continuation<? super retrofit2.Response<com.shopapp.data.remote.dto.TokenRefreshResponseDto>> $completion);
    
    @retrofit2.http.POST(value = "auth/logout/")
    @org.jetbrains.annotations.Nullable()
    public abstract java.lang.Object logout(@retrofit2.http.Body()
    @org.jetbrains.annotations.NotNull()
    com.shopapp.data.remote.dto.LogoutRequest body, @org.jetbrains.annotations.NotNull()
    kotlin.coroutines.Continuation<? super retrofit2.Response<kotlin.Unit>> $completion);
    
    /**
     * Backend: POST /api/auth/password-reset/ — no requiere autenticación
     */
    @retrofit2.http.POST(value = "auth/password-reset/")
    @org.jetbrains.annotations.Nullable()
    public abstract java.lang.Object requestPasswordReset(@retrofit2.http.Body()
    @org.jetbrains.annotations.NotNull()
    com.shopapp.data.remote.dto.PasswordResetRequestDto body, @org.jetbrains.annotations.NotNull()
    kotlin.coroutines.Continuation<? super retrofit2.Response<com.shopapp.data.remote.dto.MessageDto>> $completion);
    
    /**
     * Backend: POST /api/auth/password-reset/confirm/
     */
    @retrofit2.http.POST(value = "auth/password-reset/confirm/")
    @org.jetbrains.annotations.Nullable()
    public abstract java.lang.Object confirmPasswordReset(@retrofit2.http.Body()
    @org.jetbrains.annotations.NotNull()
    com.shopapp.data.remote.dto.PasswordResetConfirmDto body, @org.jetbrains.annotations.NotNull()
    kotlin.coroutines.Continuation<? super retrofit2.Response<com.shopapp.data.remote.dto.MessageDto>> $completion);
}