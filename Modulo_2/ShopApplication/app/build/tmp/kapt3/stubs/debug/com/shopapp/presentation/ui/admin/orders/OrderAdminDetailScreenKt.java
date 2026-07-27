package com.shopapp.presentation.ui.admin.orders;

@kotlin.Metadata(mv = {1, 9, 0}, k = 2, xi = 48, d1 = {"\u0000Z\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0006\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\u001a2\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00010\u00052\u0012\u0010\u0006\u001a\u000e\u0012\u0004\u0012\u00020\b\u0012\u0004\u0012\u00020\u00010\u0007H\u0003\u001a\u0010\u0010\t\u001a\u00020\u00012\u0006\u0010\n\u001a\u00020\u000bH\u0003\u001a \u0010\f\u001a\u00020\u00012\u0006\u0010\r\u001a\u00020\u000e2\u0006\u0010\u000f\u001a\u00020\u00102\u0006\u0010\u0011\u001a\u00020\u0012H\u0003\u001a\"\u0010\u0013\u001a\u00020\u00012\u0018\u0010\u0014\u001a\u0014\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u00020\u000e\u0012\u0004\u0012\u00020\u000e0\u00160\u0015H\u0003\u001aB\u0010\u0017\u001a\u00020\u00012\u0006\u0010\u0018\u001a\u00020\u00192\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00010\u00052\u0018\u0010\u0006\u001a\u0014\u0012\u0004\u0012\u00020\u0019\u0012\u0004\u0012\u00020\b\u0012\u0004\u0012\u00020\u00010\u001a2\b\b\u0002\u0010\u001b\u001a\u00020\u001cH\u0007\u001a\u0010\u0010\u001d\u001a\u00020\u00012\u0006\u0010\u001e\u001a\u00020\u000eH\u0003\u00a8\u0006\u001f"}, d2 = {"AdminOrderDetailContent", "", "order", "Lcom/shopapp/domain/model/Order;", "onBack", "Lkotlin/Function0;", "onStatusChange", "Lkotlin/Function1;", "Lcom/shopapp/domain/model/OrderStatus;", "AdminOrderItemRow", "item", "Lcom/shopapp/domain/model/OrderItem;", "FinancialRow", "label", "", "value", "", "isFinal", "", "InfoGrid", "items", "", "Lkotlin/Pair;", "OrderAdminDetailScreen", "orderId", "", "Lkotlin/Function2;", "viewModel", "Lcom/shopapp/presentation/viewmodel/OrderDetailViewModel;", "SectionLabel", "text", "app_debug"})
public final class OrderAdminDetailScreenKt {
    
    @kotlin.OptIn(markerClass = {androidx.compose.material3.ExperimentalMaterial3Api.class})
    @androidx.compose.runtime.Composable()
    public static final void OrderAdminDetailScreen(int orderId, @org.jetbrains.annotations.NotNull()
    kotlin.jvm.functions.Function0<kotlin.Unit> onBack, @org.jetbrains.annotations.NotNull()
    kotlin.jvm.functions.Function2<? super java.lang.Integer, ? super com.shopapp.domain.model.OrderStatus, kotlin.Unit> onStatusChange, @org.jetbrains.annotations.NotNull()
    com.shopapp.presentation.viewmodel.OrderDetailViewModel viewModel) {
    }
    
    @kotlin.OptIn(markerClass = {androidx.compose.material3.ExperimentalMaterial3Api.class})
    @androidx.compose.runtime.Composable()
    private static final void AdminOrderDetailContent(com.shopapp.domain.model.Order order, kotlin.jvm.functions.Function0<kotlin.Unit> onBack, kotlin.jvm.functions.Function1<? super com.shopapp.domain.model.OrderStatus, kotlin.Unit> onStatusChange) {
    }
    
    @androidx.compose.runtime.Composable()
    private static final void SectionLabel(java.lang.String text) {
    }
    
    @androidx.compose.runtime.Composable()
    private static final void InfoGrid(java.util.List<kotlin.Pair<java.lang.String, java.lang.String>> items) {
    }
    
    @androidx.compose.runtime.Composable()
    private static final void AdminOrderItemRow(com.shopapp.domain.model.OrderItem item) {
    }
    
    @androidx.compose.runtime.Composable()
    private static final void FinancialRow(java.lang.String label, double value, boolean isFinal) {
    }
}