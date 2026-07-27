package com.shopapp.presentation.ui.client.orders;

@kotlin.Metadata(mv = {1, 9, 0}, k = 2, xi = 48, d1 = {"\u0000\\\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0006\n\u0000\n\u0002\u0010\u000b\n\u0000\u001a\u001e\u0010\u0003\u001a\u00020\u00042\u0006\u0010\u0005\u001a\u00020\u00062\f\u0010\u0007\u001a\b\u0012\u0004\u0012\u00020\u00040\bH\u0003\u001a(\u0010\t\u001a\u00020\u00042\u0006\u0010\n\u001a\u00020\u000b2\f\u0010\u0007\u001a\b\u0012\u0004\u0012\u00020\u00040\b2\b\b\u0002\u0010\f\u001a\u00020\rH\u0007\u001a\u0010\u0010\u000e\u001a\u00020\u00042\u0006\u0010\u000f\u001a\u00020\u0010H\u0003\u001a\u001e\u0010\u0011\u001a\u00020\u00042\f\u0010\u0012\u001a\b\u0012\u0004\u0012\u00020\u00020\u00012\u0006\u0010\u0013\u001a\u00020\u000bH\u0003\u001a.\u0010\u0014\u001a\u00020\u00042\u0006\u0010\u0015\u001a\u00020\u00162\u001c\u0010\u0017\u001a\u0018\u0012\u0004\u0012\u00020\u0019\u0012\u0004\u0012\u00020\u00040\u0018\u00a2\u0006\u0002\b\u001a\u00a2\u0006\u0002\b\u001bH\u0003\u001a \u0010\u001c\u001a\u00020\u00042\u0006\u0010\u001d\u001a\u00020\u00162\u0006\u0010\u001e\u001a\u00020\u001f2\u0006\u0010 \u001a\u00020!H\u0003\"\u0014\u0010\u0000\u001a\b\u0012\u0004\u0012\u00020\u00020\u0001X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\""}, d2 = {"PROGRESS_STEPS", "", "Lcom/shopapp/domain/model/OrderStatus;", "OrderDetailContent", "", "order", "Lcom/shopapp/domain/model/Order;", "onBack", "Lkotlin/Function0;", "OrderDetailScreen", "orderId", "", "viewModel", "Lcom/shopapp/presentation/viewmodel/OrderDetailViewModel;", "OrderItemRow", "item", "Lcom/shopapp/domain/model/OrderItem;", "OrderProgressBar", "steps", "currentStep", "SectionCard", "title", "", "content", "Lkotlin/Function1;", "Landroidx/compose/foundation/layout/ColumnScope;", "Landroidx/compose/runtime/Composable;", "Lkotlin/ExtensionFunctionType;", "TotalLine", "label", "value", "", "isFinal", "", "app_debug"})
public final class OrderDetailScreenKt {
    @org.jetbrains.annotations.NotNull()
    private static final java.util.List<com.shopapp.domain.model.OrderStatus> PROGRESS_STEPS = null;
    
    @kotlin.OptIn(markerClass = {androidx.compose.material3.ExperimentalMaterial3Api.class})
    @androidx.compose.runtime.Composable()
    public static final void OrderDetailScreen(int orderId, @org.jetbrains.annotations.NotNull()
    kotlin.jvm.functions.Function0<kotlin.Unit> onBack, @org.jetbrains.annotations.NotNull()
    com.shopapp.presentation.viewmodel.OrderDetailViewModel viewModel) {
    }
    
    @kotlin.OptIn(markerClass = {androidx.compose.material3.ExperimentalMaterial3Api.class})
    @androidx.compose.runtime.Composable()
    private static final void OrderDetailContent(com.shopapp.domain.model.Order order, kotlin.jvm.functions.Function0<kotlin.Unit> onBack) {
    }
    
    @androidx.compose.runtime.Composable()
    private static final void OrderProgressBar(java.util.List<? extends com.shopapp.domain.model.OrderStatus> steps, int currentStep) {
    }
    
    @androidx.compose.runtime.Composable()
    private static final void SectionCard(java.lang.String title, kotlin.jvm.functions.Function1<? super androidx.compose.foundation.layout.ColumnScope, kotlin.Unit> content) {
    }
    
    @androidx.compose.runtime.Composable()
    private static final void OrderItemRow(com.shopapp.domain.model.OrderItem item) {
    }
    
    @androidx.compose.runtime.Composable()
    private static final void TotalLine(java.lang.String label, double value, boolean isFinal) {
    }
}