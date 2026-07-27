package com.shopapp.presentation.viewmodel;

@kotlin.Metadata(mv = {1, 9, 0}, k = 1, xi = 48, d1 = {"\u0000L\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0006\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0004\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\b\b\u0007\u0018\u00002\u00020\u0001B\u000f\b\u0007\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0004J\u0018\u0010\u0019\u001a\u00020\u001a2\u0006\u0010\u001b\u001a\u00020\u001c2\b\b\u0002\u0010\u001d\u001a\u00020\u0015J\u0006\u0010\u001e\u001a\u00020\u001aJ\u0006\u0010\u001f\u001a\u00020\u001aJ\u000e\u0010 \u001a\u00020\u001a2\u0006\u0010!\u001a\u00020\u0015J\u0006\u0010\"\u001a\u00020\u001aJ\u0016\u0010#\u001a\u00020\u001a2\u0006\u0010!\u001a\u00020\u00152\u0006\u0010\u001d\u001a\u00020\u0015R\u0014\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00070\u0006X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001a\u0010\b\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\n0\t0\u0006X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0017\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\u00070\f\u00a2\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u001d\u0010\u000f\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\n0\t0\f\u00a2\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u000eR\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0017\u0010\u0011\u001a\b\u0012\u0004\u0012\u00020\u00120\f\u00a2\u0006\b\n\u0000\u001a\u0004\b\u0013\u0010\u000eR\u0017\u0010\u0014\u001a\b\u0012\u0004\u0012\u00020\u00150\f\u00a2\u0006\b\n\u0000\u001a\u0004\b\u0016\u0010\u000eR\u0017\u0010\u0017\u001a\b\u0012\u0004\u0012\u00020\u00120\f\u00a2\u0006\b\n\u0000\u001a\u0004\b\u0018\u0010\u000e\u00a8\u0006$"}, d2 = {"Lcom/shopapp/presentation/viewmodel/CartViewModel;", "Landroidx/lifecycle/ViewModel;", "orderRepository", "Lcom/shopapp/domain/repository/OrderRepository;", "(Lcom/shopapp/domain/repository/OrderRepository;)V", "_checkoutState", "Lkotlinx/coroutines/flow/MutableStateFlow;", "Lcom/shopapp/presentation/viewmodel/CheckoutState;", "_items", "", "Lcom/shopapp/presentation/viewmodel/CartItem;", "checkoutState", "Lkotlinx/coroutines/flow/StateFlow;", "getCheckoutState", "()Lkotlinx/coroutines/flow/StateFlow;", "items", "getItems", "subtotal", "", "getSubtotal", "totalItems", "", "getTotalItems", "totalWithTax", "getTotalWithTax", "addItem", "", "product", "Lcom/shopapp/domain/model/Product;", "quantity", "checkout", "clearCart", "removeItem", "productId", "resetCheckout", "updateQuantity", "app_debug"})
@dagger.hilt.android.lifecycle.HiltViewModel()
public final class CartViewModel extends androidx.lifecycle.ViewModel {
    @org.jetbrains.annotations.NotNull()
    private final com.shopapp.domain.repository.OrderRepository orderRepository = null;
    @org.jetbrains.annotations.NotNull()
    private final kotlinx.coroutines.flow.MutableStateFlow<java.util.List<com.shopapp.presentation.viewmodel.CartItem>> _items = null;
    @org.jetbrains.annotations.NotNull()
    private final kotlinx.coroutines.flow.StateFlow<java.util.List<com.shopapp.presentation.viewmodel.CartItem>> items = null;
    @org.jetbrains.annotations.NotNull()
    private final kotlinx.coroutines.flow.StateFlow<java.lang.Integer> totalItems = null;
    @org.jetbrains.annotations.NotNull()
    private final kotlinx.coroutines.flow.StateFlow<java.lang.Double> subtotal = null;
    @org.jetbrains.annotations.NotNull()
    private final kotlinx.coroutines.flow.StateFlow<java.lang.Double> totalWithTax = null;
    @org.jetbrains.annotations.NotNull()
    private final kotlinx.coroutines.flow.MutableStateFlow<com.shopapp.presentation.viewmodel.CheckoutState> _checkoutState = null;
    @org.jetbrains.annotations.NotNull()
    private final kotlinx.coroutines.flow.StateFlow<com.shopapp.presentation.viewmodel.CheckoutState> checkoutState = null;
    
    @javax.inject.Inject()
    public CartViewModel(@org.jetbrains.annotations.NotNull()
    com.shopapp.domain.repository.OrderRepository orderRepository) {
        super();
    }
    
    @org.jetbrains.annotations.NotNull()
    public final kotlinx.coroutines.flow.StateFlow<java.util.List<com.shopapp.presentation.viewmodel.CartItem>> getItems() {
        return null;
    }
    
    @org.jetbrains.annotations.NotNull()
    public final kotlinx.coroutines.flow.StateFlow<java.lang.Integer> getTotalItems() {
        return null;
    }
    
    @org.jetbrains.annotations.NotNull()
    public final kotlinx.coroutines.flow.StateFlow<java.lang.Double> getSubtotal() {
        return null;
    }
    
    @org.jetbrains.annotations.NotNull()
    public final kotlinx.coroutines.flow.StateFlow<java.lang.Double> getTotalWithTax() {
        return null;
    }
    
    @org.jetbrains.annotations.NotNull()
    public final kotlinx.coroutines.flow.StateFlow<com.shopapp.presentation.viewmodel.CheckoutState> getCheckoutState() {
        return null;
    }
    
    public final void addItem(@org.jetbrains.annotations.NotNull()
    com.shopapp.domain.model.Product product, int quantity) {
    }
    
    public final void updateQuantity(int productId, int quantity) {
    }
    
    public final void removeItem(int productId) {
    }
    
    public final void clearCart() {
    }
    
    public final void resetCheckout() {
    }
    
    public final void checkout() {
    }
}