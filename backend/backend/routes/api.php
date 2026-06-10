<?php

use App\Http\Controllers\Api\Auth\AuthController;
use App\Http\Controllers\Api\CatalogController;
use App\Http\Controllers\Api\Backoffice\AdminUserController;
use App\Http\Controllers\Api\Backoffice\BranchController;
use App\Http\Controllers\Api\Backoffice\CategoryController;
use App\Http\Controllers\Api\Backoffice\CommissionRuleController;
use App\Http\Controllers\Api\Backoffice\ComplaintController;
use App\Http\Controllers\Api\Backoffice\CouponController as BackofficeCouponController;
use App\Http\Controllers\Api\Backoffice\ProductController;
use App\Http\Controllers\Api\Backoffice\ProductSizeController;
use App\Http\Controllers\Api\Backoffice\RestaurantController;
use App\Http\Controllers\Api\Backoffice\RestaurantSubscriptionController;
use App\Http\Controllers\Api\Backoffice\ReviewController as BackofficeReviewController;
use App\Http\Controllers\Api\Backoffice\SettlementController;
use App\Http\Controllers\Api\Backoffice\SubscriptionPlanController;
use App\Http\Controllers\Api\Backoffice\SupportTicketController;
use App\Http\Controllers\Api\Customer\CouponController;
use App\Http\Controllers\Api\Customer\CartController;
use App\Http\Controllers\Api\Customer\FavoriteController;
use App\Http\Controllers\Api\Customer\NotificationController;
use App\Http\Controllers\Api\Customer\OrderController;
use App\Http\Controllers\Api\Customer\ReviewController;
use App\Http\Controllers\Api\Customer\SupportController;
use Illuminate\Support\Facades\Route;

Route::prefix('auth')->group(function () {
    Route::post('register', [AuthController::class, 'register']);
    Route::post('login', [AuthController::class, 'login']);
    Route::post('forgot-password', [AuthController::class, 'forgotPassword']);
    Route::middleware('auth:sanctum')->post('logout', [AuthController::class, 'logout']);
});

Route::get('restaurants', [CatalogController::class, 'restaurants']);
Route::get('restaurants/{restaurant}', [CatalogController::class, 'restaurant']);
Route::get('branches/{branch}/menu', [CatalogController::class, 'branchMenu']);
Route::get('products/{product}', [CatalogController::class, 'product']);

Route::middleware(['auth:sanctum', 'audit.context'])->group(function () {
    Route::get('me', fn (\Illuminate\Http\Request $request) => $request->user()->load('roles', 'permissions'));
    Route::post('orders', [OrderController::class, 'store'])->middleware('permission:orders.create');
    Route::get('cart', [CartController::class, 'show']);
    Route::post('cart/items', [CartController::class, 'addItem']);
    Route::put('cart/items/{item}', [CartController::class, 'updateItem']);
    Route::delete('cart/items/{item}', [CartController::class, 'removeItem']);
    Route::delete('cart', [CartController::class, 'clear']);

    Route::prefix('favorites')->middleware('permission:favorites.manage')->group(function () {
        Route::get('restaurants', [FavoriteController::class, 'restaurants']);
        Route::post('restaurants/{restaurant}', [FavoriteController::class, 'storeRestaurant']);
        Route::delete('restaurants/{restaurant}', [FavoriteController::class, 'destroyRestaurant']);
        Route::get('products', [FavoriteController::class, 'products']);
        Route::post('products/{product}', [FavoriteController::class, 'storeProduct']);
        Route::delete('products/{product}', [FavoriteController::class, 'destroyProduct']);
    });

    Route::post('coupons/validate', [CouponController::class, 'validateCoupon'])->middleware('permission:orders.create');
    Route::get('coupons/usages', [CouponController::class, 'usages'])->middleware('permission:orders.view_own');
    Route::get('notifications', [NotificationController::class, 'index']);
    Route::post('notifications/{notification}/read', [NotificationController::class, 'markAsRead']);
    Route::post('device-tokens', [NotificationController::class, 'storeDeviceToken']);
    Route::apiResource('reviews', ReviewController::class)->only(['index','store'])->middleware('permission:reviews.create');

    Route::prefix('support')->middleware('permission:support.create')->group(function () {
        Route::get('tickets', [SupportController::class, 'tickets']);
        Route::post('tickets', [SupportController::class, 'storeTicket']);
        Route::post('tickets/{ticket}/messages', [SupportController::class, 'storeMessage']);
        Route::post('complaints', [SupportController::class, 'storeComplaint']);
    });

    Route::middleware('permission:admin.access')->prefix('admin')->group(function () {
        Route::apiResource('users', AdminUserController::class);
        Route::apiResource('restaurants', RestaurantController::class);
        Route::apiResource('branches', BranchController::class);
        Route::apiResource('categories', CategoryController::class);
        Route::apiResource('products', ProductController::class);
        Route::apiResource('product-sizes', ProductSizeController::class);
        Route::apiResource('coupons', BackofficeCouponController::class);
        Route::apiResource('reviews', BackofficeReviewController::class);
        Route::apiResource('support-tickets', SupportTicketController::class);
        Route::apiResource('complaints', ComplaintController::class);
        Route::apiResource('subscription-plans', SubscriptionPlanController::class);
        Route::apiResource('restaurant-subscriptions', RestaurantSubscriptionController::class);
        Route::apiResource('commission-rules', CommissionRuleController::class);
        Route::apiResource('settlements', SettlementController::class);
    });
});
