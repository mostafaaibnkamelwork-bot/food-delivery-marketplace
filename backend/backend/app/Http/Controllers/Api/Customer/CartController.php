<?php

namespace App\Http\Controllers\Api\Customer;

use App\Http\Controllers\Controller;
use App\Models\Cart;
use App\Models\Product;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class CartController extends Controller
{
    public function show(Request $request): JsonResponse
    {
        return response()->json([
            'data' => Cart::query()->with('items.product')->where('user_id', $request->user()->id)->latest()->get(),
        ]);
    }

    public function addItem(Request $request): JsonResponse
    {
        $data = $request->validate([
            'product_id' => ['required', 'exists:products,id'],
            'quantity' => ['required', 'integer', 'min:1'],
            'unit_price' => ['required', 'numeric', 'min:0'],
            'options' => ['nullable', 'array'],
            'notes' => ['nullable', 'string'],
        ]);

        $product = Product::query()->findOrFail($data['product_id']);
        $cart = Cart::query()->firstOrCreate([
            'user_id' => $request->user()->id,
            'branch_id' => $product->branch_id,
        ]);

        $item = $cart->items()->create($data);

        return response()->json(['data' => $item->load('product')], 201);
    }

    public function updateItem(Request $request, int $item): JsonResponse
    {
        $data = $request->validate(['quantity' => ['required', 'integer', 'min:1']]);
        $cartItem = $request->user()->carts()->with('items')->get()->flatMap->items->firstWhere('id', $item);
        abort_unless($cartItem, 404);
        $cartItem->update($data);

        return response()->json(['data' => $cartItem]);
    }

    public function removeItem(Request $request, int $item): JsonResponse
    {
        $cartItem = $request->user()->carts()->with('items')->get()->flatMap->items->firstWhere('id', $item);
        abort_unless($cartItem, 404);
        $cartItem->delete();

        return response()->json(status: 204);
    }

    public function clear(Request $request): JsonResponse
    {
        Cart::query()->where('user_id', $request->user()->id)->delete();
        return response()->json(status: 204);
    }
}
