package com.shopapp.presentation.viewmodel;

@kotlin.Metadata(mv = {1, 9, 0}, k = 1, xi = 48, d1 = {"\u0000F\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\u0004\n\u0002\u0010\u000e\n\u0000\b\u0007\u0018\u00002\u00020\u0001B\u000f\b\u0007\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0004J\u0016\u0010\f\u001a\u00020\r2\u0006\u0010\u000e\u001a\u00020\u000f2\u0006\u0010\u0010\u001a\u00020\u0011J\u0010\u0010\u0012\u001a\u00020\r2\b\b\u0002\u0010\u0013\u001a\u00020\u0014J\u0006\u0010\u0015\u001a\u00020\rJ\u0006\u0010\u0016\u001a\u00020\rJ\u000e\u0010\u0017\u001a\u00020\r2\u0006\u0010\u0018\u001a\u00020\u0019R\u0014\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00070\u0006X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0017\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00070\t\u00a2\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b\u00a8\u0006\u001a"}, d2 = {"Lcom/shopapp/presentation/viewmodel/OrdersAdminViewModel;", "Landroidx/lifecycle/ViewModel;", "repository", "Lcom/shopapp/domain/repository/OrderRepository;", "(Lcom/shopapp/domain/repository/OrderRepository;)V", "_state", "Lkotlinx/coroutines/flow/MutableStateFlow;", "Lcom/shopapp/presentation/viewmodel/OrdersAdminUiState;", "state", "Lkotlinx/coroutines/flow/StateFlow;", "getState", "()Lkotlinx/coroutines/flow/StateFlow;", "changeStatus", "", "orderId", "", "newStatus", "Lcom/shopapp/domain/model/OrderStatus;", "load", "reset", "", "loadMore", "refresh", "setStatusFilter", "status", "", "app_debug"})
@dagger.hilt.android.lifecycle.HiltViewModel()
public final class OrdersAdminViewModel extends androidx.lifecycle.ViewModel {
    @org.jetbrains.annotations.NotNull()
    private final com.shopapp.domain.repository.OrderRepository repository = null;
    @org.jetbrains.annotations.NotNull()
    private final kotlinx.coroutines.flow.MutableStateFlow<com.shopapp.presentation.viewmodel.OrdersAdminUiState> _state = null;
    @org.jetbrains.annotations.NotNull()
    private final kotlinx.coroutines.flow.StateFlow<com.shopapp.presentation.viewmodel.OrdersAdminUiState> state = null;
    
    @javax.inject.Inject()
    public OrdersAdminViewModel(@org.jetbrains.annotations.NotNull()
    com.shopapp.domain.repository.OrderRepository repository) {
        super();
    }
    
    @org.jetbrains.annotations.NotNull()
    public final kotlinx.coroutines.flow.StateFlow<com.shopapp.presentation.viewmodel.OrdersAdminUiState> getState() {
        return null;
    }
    
    public final void load(boolean reset) {
    }
    
    public final void setStatusFilter(@org.jetbrains.annotations.NotNull()
    java.lang.String status) {
    }
    
    public final void loadMore() {
    }
    
    public final void refresh() {
    }
    
    public final void changeStatus(int orderId, @org.jetbrains.annotations.NotNull()
    com.shopapp.domain.model.OrderStatus newStatus) {
    }
}