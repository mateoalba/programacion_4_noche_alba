package com.shopapp.presentation.viewmodel;

@kotlin.Metadata(mv = {1, 9, 0}, k = 1, xi = 48, d1 = {"\u00000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0017\b\u0087\b\u0018\u00002\u00020\u0001BI\u0012\u000e\b\u0002\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003\u0012\b\b\u0002\u0010\u0005\u001a\u00020\u0006\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\b\u0012\b\b\u0002\u0010\t\u001a\u00020\n\u0012\b\b\u0002\u0010\u000b\u001a\u00020\b\u0012\b\b\u0002\u0010\f\u001a\u00020\r\u00a2\u0006\u0002\u0010\u000eJ\u000f\u0010\u0019\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003H\u00c6\u0003J\t\u0010\u001a\u001a\u00020\u0006H\u00c6\u0003J\u000b\u0010\u001b\u001a\u0004\u0018\u00010\bH\u00c6\u0003J\t\u0010\u001c\u001a\u00020\nH\u00c6\u0003J\t\u0010\u001d\u001a\u00020\bH\u00c6\u0003J\t\u0010\u001e\u001a\u00020\rH\u00c6\u0003JM\u0010\u001f\u001a\u00020\u00002\u000e\b\u0002\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u00062\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\b2\b\b\u0002\u0010\t\u001a\u00020\n2\b\b\u0002\u0010\u000b\u001a\u00020\b2\b\b\u0002\u0010\f\u001a\u00020\rH\u00c6\u0001J\u0013\u0010 \u001a\u00020\u00062\b\u0010!\u001a\u0004\u0018\u00010\u0001H\u00d6\u0003J\t\u0010\"\u001a\u00020\nH\u00d6\u0001J\t\u0010#\u001a\u00020\bH\u00d6\u0001R\u0013\u0010\u0007\u001a\u0004\u0018\u00010\b\u00a2\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u0010R\u0011\u0010\u0005\u001a\u00020\u0006\u00a2\u0006\b\n\u0000\u001a\u0004\b\u0005\u0010\u0011R\u0017\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003\u00a2\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0013R\u0011\u0010\u000b\u001a\u00020\b\u00a2\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0010R\u0011\u0010\f\u001a\u00020\r\u00a2\u0006\b\n\u0000\u001a\u0004\b\u0015\u0010\u0016R\u0011\u0010\t\u001a\u00020\n\u00a2\u0006\b\n\u0000\u001a\u0004\b\u0017\u0010\u0018\u00a8\u0006$"}, d2 = {"Lcom/shopapp/presentation/viewmodel/ProductsAdminUiState;", "", "products", "", "Lcom/shopapp/domain/model/Product;", "isLoading", "", "error", "", "total", "", "search", "stockFilter", "Lcom/shopapp/presentation/viewmodel/ProductStockFilter;", "(Ljava/util/List;ZLjava/lang/String;ILjava/lang/String;Lcom/shopapp/presentation/viewmodel/ProductStockFilter;)V", "getError", "()Ljava/lang/String;", "()Z", "getProducts", "()Ljava/util/List;", "getSearch", "getStockFilter", "()Lcom/shopapp/presentation/viewmodel/ProductStockFilter;", "getTotal", "()I", "component1", "component2", "component3", "component4", "component5", "component6", "copy", "equals", "other", "hashCode", "toString", "app_debug"})
public final class ProductsAdminUiState {
    @org.jetbrains.annotations.NotNull()
    private final java.util.List<com.shopapp.domain.model.Product> products = null;
    private final boolean isLoading = false;
    @org.jetbrains.annotations.Nullable()
    private final java.lang.String error = null;
    private final int total = 0;
    @org.jetbrains.annotations.NotNull()
    private final java.lang.String search = null;
    @org.jetbrains.annotations.NotNull()
    private final com.shopapp.presentation.viewmodel.ProductStockFilter stockFilter = null;
    
    public ProductsAdminUiState(@org.jetbrains.annotations.NotNull()
    java.util.List<com.shopapp.domain.model.Product> products, boolean isLoading, @org.jetbrains.annotations.Nullable()
    java.lang.String error, int total, @org.jetbrains.annotations.NotNull()
    java.lang.String search, @org.jetbrains.annotations.NotNull()
    com.shopapp.presentation.viewmodel.ProductStockFilter stockFilter) {
        super();
    }
    
    @org.jetbrains.annotations.NotNull()
    public final java.util.List<com.shopapp.domain.model.Product> getProducts() {
        return null;
    }
    
    public final boolean isLoading() {
        return false;
    }
    
    @org.jetbrains.annotations.Nullable()
    public final java.lang.String getError() {
        return null;
    }
    
    public final int getTotal() {
        return 0;
    }
    
    @org.jetbrains.annotations.NotNull()
    public final java.lang.String getSearch() {
        return null;
    }
    
    @org.jetbrains.annotations.NotNull()
    public final com.shopapp.presentation.viewmodel.ProductStockFilter getStockFilter() {
        return null;
    }
    
    public ProductsAdminUiState() {
        super();
    }
    
    @org.jetbrains.annotations.NotNull()
    public final java.util.List<com.shopapp.domain.model.Product> component1() {
        return null;
    }
    
    public final boolean component2() {
        return false;
    }
    
    @org.jetbrains.annotations.Nullable()
    public final java.lang.String component3() {
        return null;
    }
    
    public final int component4() {
        return 0;
    }
    
    @org.jetbrains.annotations.NotNull()
    public final java.lang.String component5() {
        return null;
    }
    
    @org.jetbrains.annotations.NotNull()
    public final com.shopapp.presentation.viewmodel.ProductStockFilter component6() {
        return null;
    }
    
    @org.jetbrains.annotations.NotNull()
    public final com.shopapp.presentation.viewmodel.ProductsAdminUiState copy(@org.jetbrains.annotations.NotNull()
    java.util.List<com.shopapp.domain.model.Product> products, boolean isLoading, @org.jetbrains.annotations.Nullable()
    java.lang.String error, int total, @org.jetbrains.annotations.NotNull()
    java.lang.String search, @org.jetbrains.annotations.NotNull()
    com.shopapp.presentation.viewmodel.ProductStockFilter stockFilter) {
        return null;
    }
    
    @java.lang.Override()
    public boolean equals(@org.jetbrains.annotations.Nullable()
    java.lang.Object other) {
        return false;
    }
    
    @java.lang.Override()
    public int hashCode() {
        return 0;
    }
    
    @java.lang.Override()
    @org.jetbrains.annotations.NotNull()
    public java.lang.String toString() {
        return null;
    }
}