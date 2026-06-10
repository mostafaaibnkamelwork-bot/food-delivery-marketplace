<?php

namespace App\Http\Controllers\Api\Customer;

use App\Http\Controllers\Controller;
use App\Models\FavoriteProduct;
use App\Models\FavoriteRestaurant;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class FavoriteController extends Controller
{
    public function restaurants(Request $request): JsonResponse
    {
        return response()->json(['data' => FavoriteRestaurant::query()->with('restaurant')->where('user_id', $request->user()->id)->latest()->paginate()]);
    }
    public function storeRestaurant(Request $request, int $restaurant): JsonResponse
    {
        $favorite = FavoriteRestaurant::query()->firstOrCreate(['user_id' => $request->user()->id, 'restaurant_id' => $restaurant]);
        return response()->json(['data' => $favorite->load('restaurant')], 201);
    }
    public function destroyRestaurant(Request $request, int $restaurant): JsonResponse
    {
        FavoriteRestaurant::query()->where('user_id', $request->user()->id)->where('restaurant_id', $restaurant)->delete();
        return response()->json(status: 204);
    }
    public function products(Request $request): JsonResponse
    {
        return response()->json(['data' => FavoriteProduct::query()->with('product')->where('user_id', $request->user()->id)->latest()->paginate()]);
    }
    public function storeProduct(Request $request, int $product): JsonResponse
    {
        $favorite = FavoriteProduct::query()->firstOrCreate(['user_id' => $request->user()->id, 'product_id' => $product]);
        return response()->json(['data' => $favorite->load('product')], 201);
    }
    public function destroyProduct(Request $request, int $product): JsonResponse
    {
        FavoriteProduct::query()->where('user_id', $request->user()->id)->where('product_id', $product)->delete();
        return response()->json(status: 204);
    }
}
