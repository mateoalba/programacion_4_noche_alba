package com.shopapp.data.remote.api;

@kotlin.Metadata(mv = {1, 9, 0}, k = 1, xi = 48, d1 = {"\u0000X\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010$\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0002\bf\u0018\u00002\u00020\u0001J\u001e\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u00032\b\b\u0001\u0010\u0005\u001a\u00020\u0006H\u00a7@\u00a2\u0006\u0002\u0010\u0007J\u001e\u0010\b\u001a\b\u0012\u0004\u0012\u00020\t0\u00032\b\b\u0001\u0010\n\u001a\u00020\u000bH\u00a7@\u00a2\u0006\u0002\u0010\fJ\u001a\u0010\r\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00040\u000e0\u0003H\u00a7@\u00a2\u0006\u0002\u0010\u000fJ\u001e\u0010\u0010\u001a\b\u0012\u0004\u0012\u00020\u00040\u00032\b\b\u0001\u0010\n\u001a\u00020\u000bH\u00a7@\u00a2\u0006\u0002\u0010\fJ0\u0010\u0011\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00040\u000e0\u00032\u0014\b\u0001\u0010\u0012\u001a\u000e\u0012\u0004\u0012\u00020\u0014\u0012\u0004\u0012\u00020\u00140\u0013H\u00a7@\u00a2\u0006\u0002\u0010\u0015J\u0014\u0010\u0016\u001a\b\u0012\u0004\u0012\u00020\u00170\u0003H\u00a7@\u00a2\u0006\u0002\u0010\u000fJ(\u0010\u0018\u001a\b\u0012\u0004\u0012\u00020\u00190\u00032\b\b\u0001\u0010\n\u001a\u00020\u000b2\b\b\u0001\u0010\u0005\u001a\u00020\u001aH\u00a7@\u00a2\u0006\u0002\u0010\u001bJ(\u0010\u001c\u001a\b\u0012\u0004\u0012\u00020\u00040\u00032\b\b\u0001\u0010\n\u001a\u00020\u000b2\b\b\u0001\u0010\u0005\u001a\u00020\u0006H\u00a7@\u00a2\u0006\u0002\u0010\u001dJ(\u0010\u001e\u001a\b\u0012\u0004\u0012\u00020\u00040\u00032\b\b\u0001\u0010\n\u001a\u00020\u000b2\b\b\u0001\u0010\u001f\u001a\u00020 H\u00a7@\u00a2\u0006\u0002\u0010!\u00a8\u0006\""}, d2 = {"Lcom/shopapp/data/remote/api/ProductApi;", "", "createProduct", "Lretrofit2/Response;", "Lcom/shopapp/data/remote/dto/ProductDto;", "body", "Lcom/shopapp/data/remote/dto/ProductRequestDto;", "(Lcom/shopapp/data/remote/dto/ProductRequestDto;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "deleteProduct", "", "id", "", "(ILkotlin/coroutines/Continuation;)Ljava/lang/Object;", "getAvailable", "Lcom/shopapp/data/remote/dto/PaginatedDto;", "(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "getProduct", "getProducts", "filters", "", "", "(Ljava/util/Map;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "getStats", "Lcom/shopapp/data/remote/dto/ProductStatsDto;", "restock", "Lcom/shopapp/data/remote/dto/RestockResponseDto;", "Lcom/shopapp/data/remote/dto/RestockRequestDto;", "(ILcom/shopapp/data/remote/dto/RestockRequestDto;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "updateProduct", "(ILcom/shopapp/data/remote/dto/ProductRequestDto;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "uploadProductImage", "image", "Lokhttp3/MultipartBody$Part;", "(ILokhttp3/MultipartBody$Part;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "app_debug"})
public abstract interface ProductApi {
    
    @retrofit2.http.GET(value = "products/")
    @org.jetbrains.annotations.Nullable()
    public abstract java.lang.Object getProducts(@retrofit2.http.QueryMap()
    @org.jetbrains.annotations.NotNull()
    java.util.Map<java.lang.String, java.lang.String> filters, @org.jetbrains.annotations.NotNull()
    kotlin.coroutines.Continuation<? super retrofit2.Response<com.shopapp.data.remote.dto.PaginatedDto<com.shopapp.data.remote.dto.ProductDto>>> $completion);
    
    @retrofit2.http.GET(value = "products/{id}/")
    @org.jetbrains.annotations.Nullable()
    public abstract java.lang.Object getProduct(@retrofit2.http.Path(value = "id")
    int id, @org.jetbrains.annotations.NotNull()
    kotlin.coroutines.Continuation<? super retrofit2.Response<com.shopapp.data.remote.dto.ProductDto>> $completion);
    
    @retrofit2.http.GET(value = "products/available/")
    @org.jetbrains.annotations.Nullable()
    public abstract java.lang.Object getAvailable(@org.jetbrains.annotations.NotNull()
    kotlin.coroutines.Continuation<? super retrofit2.Response<com.shopapp.data.remote.dto.PaginatedDto<com.shopapp.data.remote.dto.ProductDto>>> $completion);
    
    @retrofit2.http.POST(value = "products/")
    @org.jetbrains.annotations.Nullable()
    public abstract java.lang.Object createProduct(@retrofit2.http.Body()
    @org.jetbrains.annotations.NotNull()
    com.shopapp.data.remote.dto.ProductRequestDto body, @org.jetbrains.annotations.NotNull()
    kotlin.coroutines.Continuation<? super retrofit2.Response<com.shopapp.data.remote.dto.ProductDto>> $completion);
    
    @retrofit2.http.PATCH(value = "products/{id}/")
    @org.jetbrains.annotations.Nullable()
    public abstract java.lang.Object updateProduct(@retrofit2.http.Path(value = "id")
    int id, @retrofit2.http.Body()
    @org.jetbrains.annotations.NotNull()
    com.shopapp.data.remote.dto.ProductRequestDto body, @org.jetbrains.annotations.NotNull()
    kotlin.coroutines.Continuation<? super retrofit2.Response<com.shopapp.data.remote.dto.ProductDto>> $completion);
    
    @retrofit2.http.Multipart()
    @retrofit2.http.PATCH(value = "products/{id}/")
    @org.jetbrains.annotations.Nullable()
    public abstract java.lang.Object uploadProductImage(@retrofit2.http.Path(value = "id")
    int id, @retrofit2.http.Part()
    @org.jetbrains.annotations.NotNull()
    okhttp3.MultipartBody.Part image, @org.jetbrains.annotations.NotNull()
    kotlin.coroutines.Continuation<? super retrofit2.Response<com.shopapp.data.remote.dto.ProductDto>> $completion);
    
    @retrofit2.http.DELETE(value = "products/{id}/")
    @org.jetbrains.annotations.Nullable()
    public abstract java.lang.Object deleteProduct(@retrofit2.http.Path(value = "id")
    int id, @org.jetbrains.annotations.NotNull()
    kotlin.coroutines.Continuation<? super retrofit2.Response<kotlin.Unit>> $completion);
    
    @retrofit2.http.POST(value = "products/{id}/restock/")
    @org.jetbrains.annotations.Nullable()
    public abstract java.lang.Object restock(@retrofit2.http.Path(value = "id")
    int id, @retrofit2.http.Body()
    @org.jetbrains.annotations.NotNull()
    com.shopapp.data.remote.dto.RestockRequestDto body, @org.jetbrains.annotations.NotNull()
    kotlin.coroutines.Continuation<? super retrofit2.Response<com.shopapp.data.remote.dto.RestockResponseDto>> $completion);
    
    @retrofit2.http.GET(value = "products/stats/")
    @org.jetbrains.annotations.Nullable()
    public abstract java.lang.Object getStats(@org.jetbrains.annotations.NotNull()
    kotlin.coroutines.Continuation<? super retrofit2.Response<com.shopapp.data.remote.dto.ProductStatsDto>> $completion);
}