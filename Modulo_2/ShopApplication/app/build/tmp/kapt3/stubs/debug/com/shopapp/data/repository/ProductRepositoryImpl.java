package com.shopapp.data.repository;

@javax.inject.Singleton()
@kotlin.Metadata(mv = {1, 9, 0}, k = 1, xi = 48, d1 = {"\u0000h\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\u0010 \n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010$\n\u0002\u0010\u000e\n\u0002\u0010\u0000\n\u0002\b\f\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001B\u0019\b\u0007\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\b\u0001\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0002\u0010\u0006J$\u0010\u0007\u001a\b\u0012\u0004\u0012\u00020\t0\b2\u0006\u0010\n\u001a\u00020\u000bH\u0096@\u00f8\u0001\u0000\u00f8\u0001\u0001\u00a2\u0006\u0004\b\f\u0010\rJ$\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\u000f0\b2\u0006\u0010\u0010\u001a\u00020\u0011H\u0096@\u00f8\u0001\u0000\u00f8\u0001\u0001\u00a2\u0006\u0004\b\u0012\u0010\u0013J$\u0010\u0014\u001a\b\u0012\u0004\u0012\u00020\t0\b2\u0006\u0010\u0010\u001a\u00020\u0011H\u0096@\u00f8\u0001\u0000\u00f8\u0001\u0001\u00a2\u0006\u0004\b\u0015\u0010\u0013J6\u0010\u0016\u001a\u001a\u0012\u0016\u0012\u0014\u0012\n\u0012\b\u0012\u0004\u0012\u00020\t0\u0018\u0012\u0004\u0012\u00020\u00110\u00170\b2\u0006\u0010\u0019\u001a\u00020\u001aH\u0096@\u00f8\u0001\u0000\u00f8\u0001\u0001\u00a2\u0006\u0004\b\u001b\u0010\u001cJ(\u0010\u001d\u001a\u0014\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u00020\u001f\u0012\u0004\u0012\u00020 0\u001e0\bH\u0096@\u00f8\u0001\u0000\u00f8\u0001\u0001\u00a2\u0006\u0004\b!\u0010\"J,\u0010#\u001a\b\u0012\u0004\u0012\u00020\u00110\b2\u0006\u0010\u0010\u001a\u00020\u00112\u0006\u0010$\u001a\u00020\u0011H\u0096@\u00f8\u0001\u0000\u00f8\u0001\u0001\u00a2\u0006\u0004\b%\u0010&J,\u0010\'\u001a\b\u0012\u0004\u0012\u00020\t0\b2\u0006\u0010\u0010\u001a\u00020\u00112\u0006\u0010\n\u001a\u00020\u000bH\u0096@\u00f8\u0001\u0000\u00f8\u0001\u0001\u00a2\u0006\u0004\b(\u0010)J,\u0010*\u001a\b\u0012\u0004\u0012\u00020\u001f0\b2\u0006\u0010+\u001a\u00020\u00112\u0006\u0010,\u001a\u00020-H\u0096@\u00f8\u0001\u0000\u00f8\u0001\u0001\u00a2\u0006\u0004\b.\u0010/J\u0010\u00100\u001a\u0002012\u0006\u0010,\u001a\u00020-H\u0002R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u0082\u0002\u000b\n\u0002\b!\n\u0005\b\u00a1\u001e0\u0001\u00a8\u00062"}, d2 = {"Lcom/shopapp/data/repository/ProductRepositoryImpl;", "Lcom/shopapp/domain/repository/ProductRepository;", "api", "Lcom/shopapp/data/remote/api/ProductApi;", "context", "Landroid/content/Context;", "(Lcom/shopapp/data/remote/api/ProductApi;Landroid/content/Context;)V", "createProduct", "Lkotlin/Result;", "Lcom/shopapp/domain/model/Product;", "payload", "Lcom/shopapp/domain/model/ProductPayload;", "createProduct-gIAlu-s", "(Lcom/shopapp/domain/model/ProductPayload;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "deleteProduct", "", "id", "", "deleteProduct-gIAlu-s", "(ILkotlin/coroutines/Continuation;)Ljava/lang/Object;", "getProduct", "getProduct-gIAlu-s", "getProducts", "Lkotlin/Pair;", "", "filters", "Lcom/shopapp/domain/model/ProductFilters;", "getProducts-gIAlu-s", "(Lcom/shopapp/domain/model/ProductFilters;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "getStats", "", "", "", "getStats-IoAF18A", "(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "restock", "quantity", "restock-0E7RQCE", "(IILkotlin/coroutines/Continuation;)Ljava/lang/Object;", "updateProduct", "updateProduct-0E7RQCE", "(ILcom/shopapp/domain/model/ProductPayload;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "uploadProductImage", "productId", "uri", "Landroid/net/Uri;", "uploadProductImage-0E7RQCE", "(ILandroid/net/Uri;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "uriToFile", "Ljava/io/File;", "app_debug"})
public final class ProductRepositoryImpl implements com.shopapp.domain.repository.ProductRepository {
    @org.jetbrains.annotations.NotNull()
    private final com.shopapp.data.remote.api.ProductApi api = null;
    @org.jetbrains.annotations.NotNull()
    private final android.content.Context context = null;
    
    @javax.inject.Inject()
    public ProductRepositoryImpl(@org.jetbrains.annotations.NotNull()
    com.shopapp.data.remote.api.ProductApi api, @dagger.hilt.android.qualifiers.ApplicationContext()
    @org.jetbrains.annotations.NotNull()
    android.content.Context context) {
        super();
    }
    
    /**
     * Copia el contenido del Uri (content://...) a un archivo temporal
     * en el caché de la app, porque Retrofit/OkHttp necesita un File real
     * para construir el MultipartBody.Part.
     */
    private final java.io.File uriToFile(android.net.Uri uri) {
        return null;
    }
}