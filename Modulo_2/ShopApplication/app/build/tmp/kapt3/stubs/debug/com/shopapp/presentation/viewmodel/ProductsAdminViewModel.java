package com.shopapp.presentation.viewmodel;

@kotlin.Metadata(mv = {1, 9, 0}, k = 1, xi = 48, d1 = {"\u0000z\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001B\u0017\b\u0007\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0002\u0010\u0006J\u000e\u0010\u001a\u001a\u00020\u001b2\u0006\u0010\u001c\u001a\u00020\u001dJ\u000e\u0010\u001e\u001a\u00020\u001b2\u0006\u0010\u001f\u001a\u00020 J\u0006\u0010!\u001a\u00020\u001bJ\b\u0010\"\u001a\u00020\u001bH\u0002J\u0006\u0010#\u001a\u00020\u001bJ*\u0010$\u001a\u00020\u001b2\u0006\u0010\u001f\u001a\u00020 2\u0006\u0010%\u001a\u00020 2\u0012\u0010&\u001a\u000e\u0012\u0004\u0012\u00020(\u0012\u0004\u0012\u00020\u001b0\'J\u000e\u0010)\u001a\u00020\u001b2\u0006\u0010*\u001a\u00020(J\u000e\u0010+\u001a\u00020\u001b2\u0006\u0010,\u001a\u00020-J\u0016\u0010.\u001a\u00020\u001b2\u0006\u0010\u001f\u001a\u00020 2\u0006\u0010/\u001a\u000200J\u0016\u00101\u001a\u00020\u001b2\u0006\u0010\u001f\u001a\u00020 2\u0006\u0010\u001c\u001a\u00020\u001dJ\u0016\u00102\u001a\u00020\u001b2\u0006\u00103\u001a\u00020 2\u0006\u00104\u001a\u000205R\u001a\u0010\u0007\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\n0\t0\bX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\f0\bX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u000e0\bX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001d\u0010\u000f\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\n0\t0\u0010\u00a2\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u0012R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001d\u0010\u0013\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00140\t0\u0010\u00a2\u0006\b\n\u0000\u001a\u0004\b\u0015\u0010\u0012R\u0017\u0010\u0016\u001a\b\u0012\u0004\u0012\u00020\f0\u0010\u00a2\u0006\b\n\u0000\u001a\u0004\b\u0017\u0010\u0012R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0017\u0010\u0018\u001a\b\u0012\u0004\u0012\u00020\u000e0\u0010\u00a2\u0006\b\n\u0000\u001a\u0004\b\u0019\u0010\u0012\u00a8\u00066"}, d2 = {"Lcom/shopapp/presentation/viewmodel/ProductsAdminViewModel;", "Landroidx/lifecycle/ViewModel;", "repository", "Lcom/shopapp/domain/repository/ProductRepository;", "categoryRepository", "Lcom/shopapp/domain/repository/CategoryRepository;", "(Lcom/shopapp/domain/repository/ProductRepository;Lcom/shopapp/domain/repository/CategoryRepository;)V", "_categories", "Lkotlinx/coroutines/flow/MutableStateFlow;", "", "Lcom/shopapp/domain/model/Category;", "_formState", "Lcom/shopapp/presentation/viewmodel/ProductFormState;", "_state", "Lcom/shopapp/presentation/viewmodel/ProductsAdminUiState;", "categories", "Lkotlinx/coroutines/flow/StateFlow;", "getCategories", "()Lkotlinx/coroutines/flow/StateFlow;", "filtered", "Lcom/shopapp/domain/model/Product;", "getFiltered", "formState", "getFormState", "state", "getState", "createProduct", "", "payload", "Lcom/shopapp/domain/model/ProductPayload;", "deleteProduct", "id", "", "load", "loadCategories", "resetFormState", "restock", "quantity", "onResult", "Lkotlin/Function1;", "", "setSearch", "query", "setStockFilter", "filter", "Lcom/shopapp/presentation/viewmodel/ProductStockFilter;", "toggleActive", "isActive", "", "updateProduct", "uploadProductImage", "productId", "uri", "Landroid/net/Uri;", "app_debug"})
@dagger.hilt.android.lifecycle.HiltViewModel()
public final class ProductsAdminViewModel extends androidx.lifecycle.ViewModel {
    @org.jetbrains.annotations.NotNull()
    private final com.shopapp.domain.repository.ProductRepository repository = null;
    @org.jetbrains.annotations.NotNull()
    private final com.shopapp.domain.repository.CategoryRepository categoryRepository = null;
    @org.jetbrains.annotations.NotNull()
    private final kotlinx.coroutines.flow.MutableStateFlow<com.shopapp.presentation.viewmodel.ProductsAdminUiState> _state = null;
    @org.jetbrains.annotations.NotNull()
    private final kotlinx.coroutines.flow.StateFlow<com.shopapp.presentation.viewmodel.ProductsAdminUiState> state = null;
    @org.jetbrains.annotations.NotNull()
    private final kotlinx.coroutines.flow.MutableStateFlow<com.shopapp.presentation.viewmodel.ProductFormState> _formState = null;
    @org.jetbrains.annotations.NotNull()
    private final kotlinx.coroutines.flow.StateFlow<com.shopapp.presentation.viewmodel.ProductFormState> formState = null;
    @org.jetbrains.annotations.NotNull()
    private final kotlinx.coroutines.flow.MutableStateFlow<java.util.List<com.shopapp.domain.model.Category>> _categories = null;
    @org.jetbrains.annotations.NotNull()
    private final kotlinx.coroutines.flow.StateFlow<java.util.List<com.shopapp.domain.model.Category>> categories = null;
    @org.jetbrains.annotations.NotNull()
    private final kotlinx.coroutines.flow.StateFlow<java.util.List<com.shopapp.domain.model.Product>> filtered = null;
    
    @javax.inject.Inject()
    public ProductsAdminViewModel(@org.jetbrains.annotations.NotNull()
    com.shopapp.domain.repository.ProductRepository repository, @org.jetbrains.annotations.NotNull()
    com.shopapp.domain.repository.CategoryRepository categoryRepository) {
        super();
    }
    
    @org.jetbrains.annotations.NotNull()
    public final kotlinx.coroutines.flow.StateFlow<com.shopapp.presentation.viewmodel.ProductsAdminUiState> getState() {
        return null;
    }
    
    @org.jetbrains.annotations.NotNull()
    public final kotlinx.coroutines.flow.StateFlow<com.shopapp.presentation.viewmodel.ProductFormState> getFormState() {
        return null;
    }
    
    @org.jetbrains.annotations.NotNull()
    public final kotlinx.coroutines.flow.StateFlow<java.util.List<com.shopapp.domain.model.Category>> getCategories() {
        return null;
    }
    
    @org.jetbrains.annotations.NotNull()
    public final kotlinx.coroutines.flow.StateFlow<java.util.List<com.shopapp.domain.model.Product>> getFiltered() {
        return null;
    }
    
    public final void load() {
    }
    
    private final void loadCategories() {
    }
    
    public final void setSearch(@org.jetbrains.annotations.NotNull()
    java.lang.String query) {
    }
    
    public final void setStockFilter(@org.jetbrains.annotations.NotNull()
    com.shopapp.presentation.viewmodel.ProductStockFilter filter) {
    }
    
    public final void toggleActive(int id, boolean isActive) {
    }
    
    public final void createProduct(@org.jetbrains.annotations.NotNull()
    com.shopapp.domain.model.ProductPayload payload) {
    }
    
    public final void updateProduct(int id, @org.jetbrains.annotations.NotNull()
    com.shopapp.domain.model.ProductPayload payload) {
    }
    
    public final void uploadProductImage(int productId, @org.jetbrains.annotations.NotNull()
    android.net.Uri uri) {
    }
    
    public final void restock(int id, int quantity, @org.jetbrains.annotations.NotNull()
    kotlin.jvm.functions.Function1<? super java.lang.String, kotlin.Unit> onResult) {
    }
    
    public final void deleteProduct(int id) {
    }
    
    public final void resetFormState() {
    }
}