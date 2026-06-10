<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Product;
use App\Models\Restaurant;
use App\Models\RestaurantBranch;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class CatalogController extends Controller
{
    public function restaurants(Request $request): JsonResponse
    {
        $query = Restaurant::query()
            ->with(['branches', 'categories'])
            ->where('status', 'approved')
            ->latest('id');

        if ($search = $request->query('search')) {
            $query->where('name', 'ilike', "%{$search}%");
        }

        return response()->json(['data' => $query->paginate((int) $request->integer('per_page', 20))]);
    }

    public function restaurant(int $restaurant): JsonResponse
    {
        return response()->json([
            'data' => Restaurant::query()->with(['branches.menus.sections.products.sizes', 'branches.products.images', 'categories'])->findOrFail($restaurant),
        ]);
    }

    public function branchMenu(int $branch): JsonResponse
    {
        return response()->json([
            'data' => RestaurantBranch::query()->with(['menus.sections.products.sizes', 'products.images', 'products.options.values'])->findOrFail($branch),
        ]);
    }

    public function product(int $product): JsonResponse
    {
        return response()->json([
            'data' => Product::query()->with(['images', 'sizes', 'options.values', 'reviews.images'])->findOrFail($product),
        ]);
    }
}
