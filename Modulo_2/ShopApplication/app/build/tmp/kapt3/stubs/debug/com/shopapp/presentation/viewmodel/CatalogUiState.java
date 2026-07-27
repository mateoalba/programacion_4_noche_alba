package com.shopapp.presentation.viewmodel;

@kotlin.Metadata(mv = {1, 9, 0}, k = 1, xi = 48, d1 = {"\u00000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\b\n\u0002\b\'\b\u0087\b\u0018\u00002\u00020\u0001B\u0083\u0001\u0012\u000e\b\u0002\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003\u0012\u000e\b\u0002\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00060\u0003\u0012\b\b\u0002\u0010\u0007\u001a\u00020\b\u0012\b\b\u0002\u0010\t\u001a\u00020\b\u0012\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u000b\u0012\b\b\u0002\u0010\f\u001a\u00020\r\u0012\b\b\u0002\u0010\u000e\u001a\u00020\b\u0012\b\b\u0002\u0010\u000f\u001a\u00020\u000b\u0012\n\b\u0002\u0010\u0010\u001a\u0004\u0018\u00010\r\u0012\b\b\u0002\u0010\u0011\u001a\u00020\u000b\u0012\b\b\u0002\u0010\u0012\u001a\u00020\r\u00a2\u0006\u0002\u0010\u0013J\u000f\u0010#\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003H\u00c6\u0003J\t\u0010$\u001a\u00020\u000bH\u00c6\u0003J\t\u0010%\u001a\u00020\rH\u00c6\u0003J\u000f\u0010&\u001a\b\u0012\u0004\u0012\u00020\u00060\u0003H\u00c6\u0003J\t\u0010\'\u001a\u00020\bH\u00c6\u0003J\t\u0010(\u001a\u00020\bH\u00c6\u0003J\u000b\u0010)\u001a\u0004\u0018\u00010\u000bH\u00c6\u0003J\t\u0010*\u001a\u00020\rH\u00c6\u0003J\t\u0010+\u001a\u00020\bH\u00c6\u0003J\t\u0010,\u001a\u00020\u000bH\u00c6\u0003J\u0010\u0010-\u001a\u0004\u0018\u00010\rH\u00c6\u0003\u00a2\u0006\u0002\u0010 J\u008c\u0001\u0010.\u001a\u00020\u00002\u000e\b\u0002\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u00032\u000e\b\u0002\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00060\u00032\b\b\u0002\u0010\u0007\u001a\u00020\b2\b\b\u0002\u0010\t\u001a\u00020\b2\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u000b2\b\b\u0002\u0010\f\u001a\u00020\r2\b\b\u0002\u0010\u000e\u001a\u00020\b2\b\b\u0002\u0010\u000f\u001a\u00020\u000b2\n\b\u0002\u0010\u0010\u001a\u0004\u0018\u00010\r2\b\b\u0002\u0010\u0011\u001a\u00020\u000b2\b\b\u0002\u0010\u0012\u001a\u00020\rH\u00c6\u0001\u00a2\u0006\u0002\u0010/J\u0013\u00100\u001a\u00020\b2\b\u00101\u001a\u0004\u0018\u00010\u0001H\u00d6\u0003J\t\u00102\u001a\u00020\rH\u00d6\u0001J\t\u00103\u001a\u00020\u000bH\u00d6\u0001R\u0017\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00060\u0003\u00a2\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0015R\u0013\u0010\n\u001a\u0004\u0018\u00010\u000b\u00a2\u0006\b\n\u0000\u001a\u0004\b\u0016\u0010\u0017R\u0011\u0010\u000e\u001a\u00020\b\u00a2\u0006\b\n\u0000\u001a\u0004\b\u0018\u0010\u0019R\u0011\u0010\u0007\u001a\u00020\b\u00a2\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\u0019R\u0011\u0010\t\u001a\u00020\b\u00a2\u0006\b\n\u0000\u001a\u0004\b\t\u0010\u0019R\u0011\u0010\u0011\u001a\u00020\u000b\u00a2\u0006\b\n\u0000\u001a\u0004\b\u001a\u0010\u0017R\u0011\u0010\u0012\u001a\u00020\r\u00a2\u0006\b\n\u0000\u001a\u0004\b\u001b\u0010\u001cR\u0017\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003\u00a2\u0006\b\n\u0000\u001a\u0004\b\u001d\u0010\u0015R\u0011\u0010\u000f\u001a\u00020\u000b\u00a2\u0006\b\n\u0000\u001a\u0004\b\u001e\u0010\u0017R\u0015\u0010\u0010\u001a\u0004\u0018\u00010\r\u00a2\u0006\n\n\u0002\u0010!\u001a\u0004\b\u001f\u0010 R\u0011\u0010\f\u001a\u00020\r\u00a2\u0006\b\n\u0000\u001a\u0004\b\"\u0010\u001c\u00a8\u00064"}, d2 = {"Lcom/shopapp/presentation/viewmodel/CatalogUiState;", "", "products", "", "Lcom/shopapp/domain/model/Product;", "categories", "Lcom/shopapp/domain/model/Category;", "isLoading", "", "isLoadingMore", "error", "", "total", "", "hasMore", "search", "selectedCategory", "ordering", "page", "(Ljava/util/List;Ljava/util/List;ZZLjava/lang/String;IZLjava/lang/String;Ljava/lang/Integer;Ljava/lang/String;I)V", "getCategories", "()Ljava/util/List;", "getError", "()Ljava/lang/String;", "getHasMore", "()Z", "getOrdering", "getPage", "()I", "getProducts", "getSearch", "getSelectedCategory", "()Ljava/lang/Integer;", "Ljava/lang/Integer;", "getTotal", "component1", "component10", "component11", "component2", "component3", "component4", "component5", "component6", "component7", "component8", "component9", "copy", "(Ljava/util/List;Ljava/util/List;ZZLjava/lang/String;IZLjava/lang/String;Ljava/lang/Integer;Ljava/lang/String;I)Lcom/shopapp/presentation/viewmodel/CatalogUiState;", "equals", "other", "hashCode", "toString", "app_debug"})
public final class CatalogUiState {
    @org.jetbrains.annotations.NotNull()
    private final java.util.List<com.shopapp.domain.model.Product> products = null;
    @org.jetbrains.annotations.NotNull()
    private final java.util.List<com.shopapp.domain.model.Category> categories = null;
    private final boolean isLoading = false;
    private final boolean isLoadingMore = false;
    @org.jetbrains.annotations.Nullable()
    private final java.lang.String error = null;
    private final int total = 0;
    private final boolean hasMore = false;
    @org.jetbrains.annotations.NotNull()
    private final java.lang.String search = null;
    @org.jetbrains.annotations.Nullable()
    private final java.lang.Integer selectedCategory = null;
    @org.jetbrains.annotations.NotNull()
    private final java.lang.String ordering = null;
    private final int page = 0;
    
    public CatalogUiState(@org.jetbrains.annotations.NotNull()
    java.util.List<com.shopapp.domain.model.Product> products, @org.jetbrains.annotations.NotNull()
    java.util.List<com.shopapp.domain.model.Category> categories, boolean isLoading, boolean isLoadingMore, @org.jetbrains.annotations.Nullable()
    java.lang.String error, int total, boolean hasMore, @org.jetbrains.annotations.NotNull()
    java.lang.String search, @org.jetbrains.annotations.Nullable()
    java.lang.Integer selectedCategory, @org.jetbrains.annotations.NotNull()
    java.lang.String ordering, int page) {
        super();
    }
    
    @org.jetbrains.annotations.NotNull()
    public final java.util.List<com.shopapp.domain.model.Product> getProducts() {
        return null;
    }
    
    @org.jetbrains.annotations.NotNull()
    public final java.util.List<com.shopapp.domain.model.Category> getCategories() {
        return null;
    }
    
    public final boolean isLoading() {
        return false;
    }
    
    public final boolean isLoadingMore() {
        return false;
    }
    
    @org.jetbrains.annotations.Nullable()
    public final java.lang.String getError() {
        return null;
    }
    
    public final int getTotal() {
        return 0;
    }
    
    public final boolean getHasMore() {
        return false;
    }
    
    @org.jetbrains.annotations.NotNull()
    public final java.lang.String getSearch() {
        return null;
    }
    
    @org.jetbrains.annotations.Nullable()
    public final java.lang.Integer getSelectedCategory() {
        return null;
    }
    
    @org.jetbrains.annotations.NotNull()
    public final java.lang.String getOrdering() {
        return null;
    }
    
    public final int getPage() {
        return 0;
    }
    
    public CatalogUiState() {
        super();
    }
    
    @org.jetbrains.annotations.NotNull()
    public final java.util.List<com.shopapp.domain.model.Product> component1() {
        return null;
    }
    
    @org.jetbrains.annotations.NotNull()
    public final java.lang.String component10() {
        return null;
    }
    
    public final int component11() {
        return 0;
    }
    
    @org.jetbrains.annotations.NotNull()
    public final java.util.List<com.shopapp.domain.model.Category> component2() {
        return null;
    }
    
    public final boolean component3() {
        return false;
    }
    
    public final boolean component4() {
        return false;
    }
    
    @org.jetbrains.annotations.Nullable()
    public final java.lang.String component5() {
        return null;
    }
    
    public final int component6() {
        return 0;
    }
    
    public final boolean component7() {
        return false;
    }
    
    @org.jetbrains.annotations.NotNull()
    public final java.lang.String component8() {
        return null;
    }
    
    @org.jetbrains.annotations.Nullable()
    public final java.lang.Integer component9() {
        return null;
    }
    
    @org.jetbrains.annotations.NotNull()
    public final com.shopapp.presentation.viewmodel.CatalogUiState copy(@org.jetbrains.annotations.NotNull()
    java.util.List<com.shopapp.domain.model.Product> products, @org.jetbrains.annotations.NotNull()
    java.util.List<com.shopapp.domain.model.Category> categories, boolean isLoading, boolean isLoadingMore, @org.jetbrains.annotations.Nullable()
    java.lang.String error, int total, boolean hasMore, @org.jetbrains.annotations.NotNull()
    java.lang.String search, @org.jetbrains.annotations.Nullable()
    java.lang.Integer selectedCategory, @org.jetbrains.annotations.NotNull()
    java.lang.String ordering, int page) {
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