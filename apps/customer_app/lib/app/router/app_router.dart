import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/addresses/presentation/pages/addresses_page.dart';
import '../../features/auth/presentation/pages/forgot_password_page.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/register_page.dart';
import '../../features/cart/presentation/pages/cart_page.dart';
import '../../features/cart/presentation/pages/checkout_page.dart';
import '../../features/coupons/presentation/pages/coupons_page.dart';
import '../../features/favorites/presentation/pages/favorites_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/notifications/presentation/pages/notifications_page.dart';
import '../../features/onboarding/presentation/pages/onboarding_page.dart';
import '../../features/orders/presentation/pages/order_tracking_page.dart';
import '../../features/orders/presentation/pages/orders_page.dart';
import '../../features/profile/presentation/pages/profile_page.dart';
import '../../features/restaurants/presentation/pages/product_details_page.dart';
import '../../features/restaurants/presentation/pages/restaurant_details_page.dart';
import '../../features/restaurants/presentation/pages/restaurant_listing_page.dart';
import '../../features/reviews/presentation/pages/reviews_page.dart';
import '../../features/splash/presentation/pages/splash_page.dart';
import '../../features/support/presentation/pages/support_tickets_page.dart';
import 'route_names.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', name: RouteNames.splash, builder: (_, __) => const SplashPage()),
      GoRoute(path: '/onboarding', name: RouteNames.onboarding, builder: (_, __) => const OnboardingPage()),
      GoRoute(path: '/login', name: RouteNames.login, builder: (_, __) => const LoginPage()),
      GoRoute(path: '/register', name: RouteNames.register, builder: (_, __) => const RegisterPage()),
      GoRoute(path: '/forgot-password', name: RouteNames.forgotPassword, builder: (_, __) => const ForgotPasswordPage()),
      GoRoute(path: '/home', name: RouteNames.home, builder: (_, __) => const HomePage()),
      GoRoute(path: '/restaurants', name: RouteNames.restaurants, builder: (_, __) => const RestaurantListingPage()),
      GoRoute(path: '/restaurants/:id', name: RouteNames.restaurantDetails, builder: (_, state) => RestaurantDetailsPage(restaurantId: state.pathParameters['id']!)),
      GoRoute(path: '/products/:id', name: RouteNames.productDetails, builder: (_, state) => ProductDetailsPage(productId: state.pathParameters['id']!)),
      GoRoute(path: '/favorites', name: RouteNames.favorites, builder: (_, __) => const FavoritesPage()),
      GoRoute(path: '/cart', name: RouteNames.cart, builder: (_, __) => const CartPage()),
      GoRoute(path: '/checkout', name: RouteNames.checkout, builder: (_, __) => const CheckoutPage()),
      GoRoute(path: '/orders', name: RouteNames.orders, builder: (_, __) => const OrdersPage()),
      GoRoute(path: '/orders/:id/tracking', name: RouteNames.orderTracking, builder: (_, state) => OrderTrackingPage(orderId: state.pathParameters['id']!)),
      GoRoute(path: '/profile', name: RouteNames.profile, builder: (_, __) => const ProfilePage()),
      GoRoute(path: '/addresses', name: RouteNames.addresses, builder: (_, __) => const AddressesPage()),
      GoRoute(path: '/coupons', name: RouteNames.coupons, builder: (_, __) => const CouponsPage()),
      GoRoute(path: '/notifications', name: RouteNames.notifications, builder: (_, __) => const NotificationsPage()),
      GoRoute(path: '/reviews', name: RouteNames.reviews, builder: (_, __) => const ReviewsPage()),
      GoRoute(path: '/support', name: RouteNames.support, builder: (_, __) => const SupportTicketsPage()),
    ],
  );
});
