package com.shopapp.data.remote.api;

@kotlin.Metadata(mv = {1, 9, 0}, k = 1, xi = 48, d1 = {"\u0000@\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\bf\u0018\u00002\u00020\u0001J(\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u00032\b\b\u0001\u0010\u0005\u001a\u00020\u00062\b\b\u0001\u0010\u0007\u001a\u00020\bH\u00a7@\u00a2\u0006\u0002\u0010\tJ\u001e\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u00040\u00032\b\b\u0001\u0010\u0005\u001a\u00020\u0006H\u00a7@\u00a2\u0006\u0002\u0010\u000bJ\u0014\u0010\f\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003H\u00a7@\u00a2\u0006\u0002\u0010\rJ\u001e\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\u00040\u00032\b\b\u0001\u0010\u0005\u001a\u00020\u0006H\u00a7@\u00a2\u0006\u0002\u0010\u000bJ2\u0010\u000f\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00040\u00100\u00032\n\b\u0003\u0010\u0011\u001a\u0004\u0018\u00010\u00062\n\b\u0003\u0010\u0012\u001a\u0004\u0018\u00010\u0013H\u00a7@\u00a2\u0006\u0002\u0010\u0014J\u0014\u0010\u0015\u001a\b\u0012\u0004\u0012\u00020\u00160\u0003H\u00a7@\u00a2\u0006\u0002\u0010\rJ(\u0010\u0017\u001a\b\u0012\u0004\u0012\u00020\u00040\u00032\b\b\u0001\u0010\u0005\u001a\u00020\u00062\b\b\u0001\u0010\u0007\u001a\u00020\u0018H\u00a7@\u00a2\u0006\u0002\u0010\u0019\u00a8\u0006\u001a"}, d2 = {"Lcom/shopapp/data/remote/api/OrderApi;", "", "addItem", "Lretrofit2/Response;", "Lcom/shopapp/data/remote/dto/OrderDto;", "id", "", "body", "Lcom/shopapp/data/remote/dto/AddItemRequestDto;", "(ILcom/shopapp/data/remote/dto/AddItemRequestDto;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "confirmOrder", "(ILkotlin/coroutines/Continuation;)Ljava/lang/Object;", "createOrder", "(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "getOrder", "getOrders", "Lcom/shopapp/data/remote/dto/PaginatedDto;", "page", "status", "", "(Ljava/lang/Integer;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "getStats", "Lcom/shopapp/data/remote/dto/OrderStatsDto;", "updateStatus", "Lcom/shopapp/data/remote/dto/UpdateStatusRequestDto;", "(ILcom/shopapp/data/remote/dto/UpdateStatusRequestDto;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "app_debug"})
public abstract interface OrderApi {
    
    @retrofit2.http.GET(value = "orders/")
    @org.jetbrains.annotations.Nullable()
    public abstract java.lang.Object getOrders(@retrofit2.http.Query(value = "page")
    @org.jetbrains.annotations.Nullable()
    java.lang.Integer page, @retrofit2.http.Query(value = "status")
    @org.jetbrains.annotations.Nullable()
    java.lang.String status, @org.jetbrains.annotations.NotNull()
    kotlin.coroutines.Continuation<? super retrofit2.Response<com.shopapp.data.remote.dto.PaginatedDto<com.shopapp.data.remote.dto.OrderDto>>> $completion);
    
    @retrofit2.http.GET(value = "orders/{id}/")
    @org.jetbrains.annotations.Nullable()
    public abstract java.lang.Object getOrder(@retrofit2.http.Path(value = "id")
    int id, @org.jetbrains.annotations.NotNull()
    kotlin.coroutines.Continuation<? super retrofit2.Response<com.shopapp.data.remote.dto.OrderDto>> $completion);
    
    @retrofit2.http.POST(value = "orders/")
    @org.jetbrains.annotations.Nullable()
    public abstract java.lang.Object createOrder(@org.jetbrains.annotations.NotNull()
    kotlin.coroutines.Continuation<? super retrofit2.Response<com.shopapp.data.remote.dto.OrderDto>> $completion);
    
    @retrofit2.http.POST(value = "orders/{id}/add-item/")
    @org.jetbrains.annotations.Nullable()
    public abstract java.lang.Object addItem(@retrofit2.http.Path(value = "id")
    int id, @retrofit2.http.Body()
    @org.jetbrains.annotations.NotNull()
    com.shopapp.data.remote.dto.AddItemRequestDto body, @org.jetbrains.annotations.NotNull()
    kotlin.coroutines.Continuation<? super retrofit2.Response<com.shopapp.data.remote.dto.OrderDto>> $completion);
    
    @retrofit2.http.POST(value = "orders/{id}/confirm/")
    @org.jetbrains.annotations.Nullable()
    public abstract java.lang.Object confirmOrder(@retrofit2.http.Path(value = "id")
    int id, @org.jetbrains.annotations.NotNull()
    kotlin.coroutines.Continuation<? super retrofit2.Response<com.shopapp.data.remote.dto.OrderDto>> $completion);
    
    @retrofit2.http.POST(value = "orders/{id}/update-status/")
    @org.jetbrains.annotations.Nullable()
    public abstract java.lang.Object updateStatus(@retrofit2.http.Path(value = "id")
    int id, @retrofit2.http.Body()
    @org.jetbrains.annotations.NotNull()
    com.shopapp.data.remote.dto.UpdateStatusRequestDto body, @org.jetbrains.annotations.NotNull()
    kotlin.coroutines.Continuation<? super retrofit2.Response<com.shopapp.data.remote.dto.OrderDto>> $completion);
    
    @retrofit2.http.GET(value = "orders/stats/")
    @org.jetbrains.annotations.Nullable()
    public abstract java.lang.Object getStats(@org.jetbrains.annotations.NotNull()
    kotlin.coroutines.Continuation<? super retrofit2.Response<com.shopapp.data.remote.dto.OrderStatsDto>> $completion);
    
    @kotlin.Metadata(mv = {1, 9, 0}, k = 3, xi = 48)
    public static final class DefaultImpls {
    }
}