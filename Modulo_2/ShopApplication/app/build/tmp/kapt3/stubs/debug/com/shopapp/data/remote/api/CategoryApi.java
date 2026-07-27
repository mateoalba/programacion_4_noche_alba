package com.shopapp.data.remote.api;

@kotlin.Metadata(mv = {1, 9, 0}, k = 1, xi = 48, d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\bf\u0018\u00002\u00020\u0001J\u001e\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u00032\b\b\u0001\u0010\u0005\u001a\u00020\u0006H\u00a7@\u00a2\u0006\u0002\u0010\u0007J\u001e\u0010\b\u001a\b\u0012\u0004\u0012\u00020\t0\u00032\b\b\u0001\u0010\n\u001a\u00020\u000bH\u00a7@\u00a2\u0006\u0002\u0010\fJ\u001a\u0010\r\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00040\u000e0\u0003H\u00a7@\u00a2\u0006\u0002\u0010\u000fJ\u001e\u0010\u0010\u001a\b\u0012\u0004\u0012\u00020\u00040\u00032\b\b\u0001\u0010\n\u001a\u00020\u000bH\u00a7@\u00a2\u0006\u0002\u0010\fJ\u0014\u0010\u0011\u001a\b\u0012\u0004\u0012\u00020\u00120\u0003H\u00a7@\u00a2\u0006\u0002\u0010\u000fJ(\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00040\u00032\b\b\u0001\u0010\n\u001a\u00020\u000b2\b\b\u0001\u0010\u0005\u001a\u00020\u0006H\u00a7@\u00a2\u0006\u0002\u0010\u0014\u00a8\u0006\u0015"}, d2 = {"Lcom/shopapp/data/remote/api/CategoryApi;", "", "createCategory", "Lretrofit2/Response;", "Lcom/shopapp/data/remote/dto/CategoryDto;", "body", "Lcom/shopapp/data/remote/dto/CategoryRequestDto;", "(Lcom/shopapp/data/remote/dto/CategoryRequestDto;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "deleteCategory", "", "id", "", "(ILkotlin/coroutines/Continuation;)Ljava/lang/Object;", "getCategories", "Lcom/shopapp/data/remote/dto/PaginatedDto;", "(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "getCategory", "getStats", "Lcom/shopapp/data/remote/dto/CategoryStatsDto;", "updateCategory", "(ILcom/shopapp/data/remote/dto/CategoryRequestDto;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "app_debug"})
public abstract interface CategoryApi {
    
    @retrofit2.http.GET(value = "categories/")
    @org.jetbrains.annotations.Nullable()
    public abstract java.lang.Object getCategories(@org.jetbrains.annotations.NotNull()
    kotlin.coroutines.Continuation<? super retrofit2.Response<com.shopapp.data.remote.dto.PaginatedDto<com.shopapp.data.remote.dto.CategoryDto>>> $completion);
    
    @retrofit2.http.GET(value = "categories/{id}/")
    @org.jetbrains.annotations.Nullable()
    public abstract java.lang.Object getCategory(@retrofit2.http.Path(value = "id")
    int id, @org.jetbrains.annotations.NotNull()
    kotlin.coroutines.Continuation<? super retrofit2.Response<com.shopapp.data.remote.dto.CategoryDto>> $completion);
    
    @retrofit2.http.POST(value = "categories/")
    @org.jetbrains.annotations.Nullable()
    public abstract java.lang.Object createCategory(@retrofit2.http.Body()
    @org.jetbrains.annotations.NotNull()
    com.shopapp.data.remote.dto.CategoryRequestDto body, @org.jetbrains.annotations.NotNull()
    kotlin.coroutines.Continuation<? super retrofit2.Response<com.shopapp.data.remote.dto.CategoryDto>> $completion);
    
    @retrofit2.http.PATCH(value = "categories/{id}/")
    @org.jetbrains.annotations.Nullable()
    public abstract java.lang.Object updateCategory(@retrofit2.http.Path(value = "id")
    int id, @retrofit2.http.Body()
    @org.jetbrains.annotations.NotNull()
    com.shopapp.data.remote.dto.CategoryRequestDto body, @org.jetbrains.annotations.NotNull()
    kotlin.coroutines.Continuation<? super retrofit2.Response<com.shopapp.data.remote.dto.CategoryDto>> $completion);
    
    @retrofit2.http.DELETE(value = "categories/{id}/")
    @org.jetbrains.annotations.Nullable()
    public abstract java.lang.Object deleteCategory(@retrofit2.http.Path(value = "id")
    int id, @org.jetbrains.annotations.NotNull()
    kotlin.coroutines.Continuation<? super retrofit2.Response<kotlin.Unit>> $completion);
    
    @retrofit2.http.GET(value = "categories/stats/")
    @org.jetbrains.annotations.Nullable()
    public abstract java.lang.Object getStats(@org.jetbrains.annotations.NotNull()
    kotlin.coroutines.Continuation<? super retrofit2.Response<com.shopapp.data.remote.dto.CategoryStatsDto>> $completion);
}