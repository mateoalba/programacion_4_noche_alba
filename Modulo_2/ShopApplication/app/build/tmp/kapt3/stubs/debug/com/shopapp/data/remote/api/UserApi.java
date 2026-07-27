package com.shopapp.data.remote.api;

@kotlin.Metadata(mv = {1, 9, 0}, k = 1, xi = 48, d1 = {"\u0000h\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\bf\u0018\u00002\u00020\u0001J\u001e\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u00032\b\b\u0001\u0010\u0005\u001a\u00020\u0006H\u00a7@\u00a2\u0006\u0002\u0010\u0007J\u001e\u0010\b\u001a\b\u0012\u0004\u0012\u00020\t0\u00032\b\b\u0001\u0010\n\u001a\u00020\u000bH\u00a7@\u00a2\u0006\u0002\u0010\fJ\u0014\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003H\u00a7@\u00a2\u0006\u0002\u0010\u000eJ\u0014\u0010\u000f\u001a\b\u0012\u0004\u0012\u00020\u00100\u0003H\u00a7@\u00a2\u0006\u0002\u0010\u000eJ\u001e\u0010\u0011\u001a\b\u0012\u0004\u0012\u00020\u00040\u00032\b\b\u0001\u0010\n\u001a\u00020\u000bH\u00a7@\u00a2\u0006\u0002\u0010\fJJ\u0010\u0012\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00040\u00130\u00032\n\b\u0003\u0010\u0014\u001a\u0004\u0018\u00010\u00152\n\b\u0003\u0010\u0016\u001a\u0004\u0018\u00010\u00172\n\b\u0003\u0010\u0018\u001a\u0004\u0018\u00010\u00172\n\b\u0003\u0010\u0019\u001a\u0004\u0018\u00010\u000bH\u00a7@\u00a2\u0006\u0002\u0010\u001aJ\u001e\u0010\u001b\u001a\b\u0012\u0004\u0012\u00020\u001c0\u00032\b\b\u0001\u0010\u0005\u001a\u00020\u001dH\u00a7@\u00a2\u0006\u0002\u0010\u001eJ\u001e\u0010\u001f\u001a\b\u0012\u0004\u0012\u00020 0\u00032\b\b\u0001\u0010\n\u001a\u00020\u000bH\u00a7@\u00a2\u0006\u0002\u0010\fJ(\u0010!\u001a\b\u0012\u0004\u0012\u00020\u00040\u00032\b\b\u0001\u0010\n\u001a\u00020\u000b2\b\b\u0001\u0010\u0005\u001a\u00020\u0006H\u00a7@\u00a2\u0006\u0002\u0010\"J\u001e\u0010#\u001a\b\u0012\u0004\u0012\u00020$0\u00032\b\b\u0001\u0010%\u001a\u00020&H\u00a7@\u00a2\u0006\u0002\u0010\'\u00a8\u0006("}, d2 = {"Lcom/shopapp/data/remote/api/UserApi;", "", "createUser", "Lretrofit2/Response;", "Lcom/shopapp/data/remote/dto/UserDto;", "body", "Lcom/shopapp/data/remote/dto/UserRequestDto;", "(Lcom/shopapp/data/remote/dto/UserRequestDto;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "deleteUser", "", "id", "", "(ILkotlin/coroutines/Continuation;)Ljava/lang/Object;", "getProfile", "(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "getStats", "Lcom/shopapp/data/remote/dto/UserStatsDto;", "getUser", "getUsers", "Lcom/shopapp/data/remote/dto/PaginatedDto;", "search", "", "isStaff", "", "isActive", "page", "(Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Integer;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "sendNotification", "Lcom/shopapp/data/remote/dto/NotificationResultDto;", "Lcom/shopapp/data/remote/dto/SendNotificationDto;", "(Lcom/shopapp/data/remote/dto/SendNotificationDto;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "toggleActive", "Lcom/shopapp/data/remote/dto/ToggleActiveResponseDto;", "updateUser", "(ILcom/shopapp/data/remote/dto/UserRequestDto;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "uploadAvatar", "Lcom/shopapp/data/remote/dto/AvatarUploadResponseDto;", "avatar", "Lokhttp3/MultipartBody$Part;", "(Lokhttp3/MultipartBody$Part;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "app_debug"})
public abstract interface UserApi {
    
    @retrofit2.http.GET(value = "users/")
    @org.jetbrains.annotations.Nullable()
    public abstract java.lang.Object getUsers(@retrofit2.http.Query(value = "search")
    @org.jetbrains.annotations.Nullable()
    java.lang.String search, @retrofit2.http.Query(value = "is_staff")
    @org.jetbrains.annotations.Nullable()
    java.lang.Boolean isStaff, @retrofit2.http.Query(value = "is_active")
    @org.jetbrains.annotations.Nullable()
    java.lang.Boolean isActive, @retrofit2.http.Query(value = "page")
    @org.jetbrains.annotations.Nullable()
    java.lang.Integer page, @org.jetbrains.annotations.NotNull()
    kotlin.coroutines.Continuation<? super retrofit2.Response<com.shopapp.data.remote.dto.PaginatedDto<com.shopapp.data.remote.dto.UserDto>>> $completion);
    
    @retrofit2.http.GET(value = "users/{id}/")
    @org.jetbrains.annotations.Nullable()
    public abstract java.lang.Object getUser(@retrofit2.http.Path(value = "id")
    int id, @org.jetbrains.annotations.NotNull()
    kotlin.coroutines.Continuation<? super retrofit2.Response<com.shopapp.data.remote.dto.UserDto>> $completion);
    
    @retrofit2.http.POST(value = "users/")
    @org.jetbrains.annotations.Nullable()
    public abstract java.lang.Object createUser(@retrofit2.http.Body()
    @org.jetbrains.annotations.NotNull()
    com.shopapp.data.remote.dto.UserRequestDto body, @org.jetbrains.annotations.NotNull()
    kotlin.coroutines.Continuation<? super retrofit2.Response<com.shopapp.data.remote.dto.UserDto>> $completion);
    
    @retrofit2.http.PATCH(value = "users/{id}/")
    @org.jetbrains.annotations.Nullable()
    public abstract java.lang.Object updateUser(@retrofit2.http.Path(value = "id")
    int id, @retrofit2.http.Body()
    @org.jetbrains.annotations.NotNull()
    com.shopapp.data.remote.dto.UserRequestDto body, @org.jetbrains.annotations.NotNull()
    kotlin.coroutines.Continuation<? super retrofit2.Response<com.shopapp.data.remote.dto.UserDto>> $completion);
    
    @retrofit2.http.DELETE(value = "users/{id}/")
    @org.jetbrains.annotations.Nullable()
    public abstract java.lang.Object deleteUser(@retrofit2.http.Path(value = "id")
    int id, @org.jetbrains.annotations.NotNull()
    kotlin.coroutines.Continuation<? super retrofit2.Response<kotlin.Unit>> $completion);
    
    @retrofit2.http.POST(value = "users/{id}/toggle-active/")
    @org.jetbrains.annotations.Nullable()
    public abstract java.lang.Object toggleActive(@retrofit2.http.Path(value = "id")
    int id, @org.jetbrains.annotations.NotNull()
    kotlin.coroutines.Continuation<? super retrofit2.Response<com.shopapp.data.remote.dto.ToggleActiveResponseDto>> $completion);
    
    @retrofit2.http.GET(value = "users/profile/")
    @org.jetbrains.annotations.Nullable()
    public abstract java.lang.Object getProfile(@org.jetbrains.annotations.NotNull()
    kotlin.coroutines.Continuation<? super retrofit2.Response<com.shopapp.data.remote.dto.UserDto>> $completion);
    
    @retrofit2.http.GET(value = "users/stats/")
    @org.jetbrains.annotations.Nullable()
    public abstract java.lang.Object getStats(@org.jetbrains.annotations.NotNull()
    kotlin.coroutines.Continuation<? super retrofit2.Response<com.shopapp.data.remote.dto.UserStatsDto>> $completion);
    
    @retrofit2.http.Multipart()
    @retrofit2.http.PATCH(value = "users/profile/")
    @org.jetbrains.annotations.Nullable()
    public abstract java.lang.Object uploadAvatar(@retrofit2.http.Part()
    @org.jetbrains.annotations.NotNull()
    okhttp3.MultipartBody.Part avatar, @org.jetbrains.annotations.NotNull()
    kotlin.coroutines.Continuation<? super retrofit2.Response<com.shopapp.data.remote.dto.AvatarUploadResponseDto>> $completion);
    
    @retrofit2.http.POST(value = "emails/send/")
    @org.jetbrains.annotations.Nullable()
    public abstract java.lang.Object sendNotification(@retrofit2.http.Body()
    @org.jetbrains.annotations.NotNull()
    com.shopapp.data.remote.dto.SendNotificationDto body, @org.jetbrains.annotations.NotNull()
    kotlin.coroutines.Continuation<? super retrofit2.Response<com.shopapp.data.remote.dto.NotificationResultDto>> $completion);
    
    @kotlin.Metadata(mv = {1, 9, 0}, k = 3, xi = 48)
    public static final class DefaultImpls {
    }
}