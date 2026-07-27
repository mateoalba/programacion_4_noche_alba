package com.shopapp.presentation.viewmodel;

@kotlin.Metadata(mv = {1, 9, 0}, k = 1, xi = 48, d1 = {"\u0000B\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001B\'\b\u0007\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\u0006\u0010\b\u001a\u00020\t\u00a2\u0006\u0002\u0010\nJ\u0006\u0010\u0016\u001a\u00020\u0017R\u0014\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\r0\fX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\u000f0\fX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0017\u0010\u0010\u001a\b\u0012\u0004\u0012\u00020\r0\u0011\u00a2\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0013R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0017\u0010\u0014\u001a\b\u0012\u0004\u0012\u00020\u000f0\u0011\u00a2\u0006\b\n\u0000\u001a\u0004\b\u0015\u0010\u0013R\u000e\u0010\b\u001a\u00020\tX\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0018"}, d2 = {"Lcom/shopapp/presentation/viewmodel/DashboardViewModel;", "Landroidx/lifecycle/ViewModel;", "productRepository", "Lcom/shopapp/domain/repository/ProductRepository;", "categoryRepository", "Lcom/shopapp/domain/repository/CategoryRepository;", "orderRepository", "Lcom/shopapp/domain/repository/OrderRepository;", "userRepository", "Lcom/shopapp/domain/repository/UserRepository;", "(Lcom/shopapp/domain/repository/ProductRepository;Lcom/shopapp/domain/repository/CategoryRepository;Lcom/shopapp/domain/repository/OrderRepository;Lcom/shopapp/domain/repository/UserRepository;)V", "_lastUpdated", "Lkotlinx/coroutines/flow/MutableStateFlow;", "", "_state", "Lcom/shopapp/presentation/viewmodel/DashboardUiState;", "lastUpdated", "Lkotlinx/coroutines/flow/StateFlow;", "getLastUpdated", "()Lkotlinx/coroutines/flow/StateFlow;", "state", "getState", "load", "", "app_debug"})
@dagger.hilt.android.lifecycle.HiltViewModel()
public final class DashboardViewModel extends androidx.lifecycle.ViewModel {
    @org.jetbrains.annotations.NotNull()
    private final com.shopapp.domain.repository.ProductRepository productRepository = null;
    @org.jetbrains.annotations.NotNull()
    private final com.shopapp.domain.repository.CategoryRepository categoryRepository = null;
    @org.jetbrains.annotations.NotNull()
    private final com.shopapp.domain.repository.OrderRepository orderRepository = null;
    @org.jetbrains.annotations.NotNull()
    private final com.shopapp.domain.repository.UserRepository userRepository = null;
    @org.jetbrains.annotations.NotNull()
    private final kotlinx.coroutines.flow.MutableStateFlow<com.shopapp.presentation.viewmodel.DashboardUiState> _state = null;
    @org.jetbrains.annotations.NotNull()
    private final kotlinx.coroutines.flow.StateFlow<com.shopapp.presentation.viewmodel.DashboardUiState> state = null;
    @org.jetbrains.annotations.NotNull()
    private final kotlinx.coroutines.flow.MutableStateFlow<java.lang.Long> _lastUpdated = null;
    @org.jetbrains.annotations.NotNull()
    private final kotlinx.coroutines.flow.StateFlow<java.lang.Long> lastUpdated = null;
    
    @javax.inject.Inject()
    public DashboardViewModel(@org.jetbrains.annotations.NotNull()
    com.shopapp.domain.repository.ProductRepository productRepository, @org.jetbrains.annotations.NotNull()
    com.shopapp.domain.repository.CategoryRepository categoryRepository, @org.jetbrains.annotations.NotNull()
    com.shopapp.domain.repository.OrderRepository orderRepository, @org.jetbrains.annotations.NotNull()
    com.shopapp.domain.repository.UserRepository userRepository) {
        super();
    }
    
    @org.jetbrains.annotations.NotNull()
    public final kotlinx.coroutines.flow.StateFlow<com.shopapp.presentation.viewmodel.DashboardUiState> getState() {
        return null;
    }
    
    @org.jetbrains.annotations.NotNull()
    public final kotlinx.coroutines.flow.StateFlow<java.lang.Long> getLastUpdated() {
        return null;
    }
    
    public final void load() {
    }
}