package com.shopapp.presentation.ui.uipublic.cart;

@kotlin.Metadata(mv = {1, 9, 0}, k = 2, xi = 48, d1 = {"\u00008\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u000e\n\u0002\b\u0003\u001aH\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\f\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00010\u00072\f\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00010\u00072\u0012\u0010\t\u001a\u000e\u0012\u0004\u0012\u00020\u000b\u0012\u0004\u0012\u00020\u00010\nH\u0007\u001a:\u0010\f\u001a\u00020\u00012\u0006\u0010\r\u001a\u00020\u000e2\f\u0010\u000f\u001a\b\u0012\u0004\u0012\u00020\u00010\u00072\f\u0010\u0010\u001a\b\u0012\u0004\u0012\u00020\u00010\u00072\f\u0010\u0011\u001a\b\u0012\u0004\u0012\u00020\u00010\u0007H\u0003\u001a \u0010\u0012\u001a\u00020\u00012\u0006\u0010\u0013\u001a\u00020\u00142\u0006\u0010\u0015\u001a\u00020\u00142\u0006\u0010\u0016\u001a\u00020\u0005H\u0003\u00a8\u0006\u0017"}, d2 = {"CartBottomSheet", "", "cartViewModel", "Lcom/shopapp/presentation/viewmodel/CartViewModel;", "isAuthenticated", "", "onDismiss", "Lkotlin/Function0;", "onLoginRequired", "onOrderSuccess", "Lkotlin/Function1;", "", "CartItemRow", "item", "Lcom/shopapp/presentation/viewmodel/CartItem;", "onIncrease", "onDecrease", "onRemove", "TotalRow", "label", "", "value", "isFinal", "app_debug"})
public final class CartBottomSheetKt {
    
    @kotlin.OptIn(markerClass = {androidx.compose.material3.ExperimentalMaterial3Api.class})
    @androidx.compose.runtime.Composable()
    public static final void CartBottomSheet(@org.jetbrains.annotations.NotNull()
    com.shopapp.presentation.viewmodel.CartViewModel cartViewModel, boolean isAuthenticated, @org.jetbrains.annotations.NotNull()
    kotlin.jvm.functions.Function0<kotlin.Unit> onDismiss, @org.jetbrains.annotations.NotNull()
    kotlin.jvm.functions.Function0<kotlin.Unit> onLoginRequired, @org.jetbrains.annotations.NotNull()
    kotlin.jvm.functions.Function1<? super java.lang.Integer, kotlin.Unit> onOrderSuccess) {
    }
    
    @androidx.compose.runtime.Composable()
    private static final void CartItemRow(com.shopapp.presentation.viewmodel.CartItem item, kotlin.jvm.functions.Function0<kotlin.Unit> onIncrease, kotlin.jvm.functions.Function0<kotlin.Unit> onDecrease, kotlin.jvm.functions.Function0<kotlin.Unit> onRemove) {
    }
    
    @androidx.compose.runtime.Composable()
    private static final void TotalRow(java.lang.String label, java.lang.String value, boolean isFinal) {
    }
}