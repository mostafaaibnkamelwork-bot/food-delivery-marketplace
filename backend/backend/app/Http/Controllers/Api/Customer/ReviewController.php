<?php

namespace App\Http\Controllers\Api\Customer;

use App\Http\Controllers\Controller;
use App\Models\Review;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class ReviewController extends Controller
{
    public function index(Request $request): JsonResponse
    {
        return response()->json(['data' => Review::query()->with('images')->where('user_id', $request->user()->id)->latest()->paginate()]);
    }
    public function store(Request $request): JsonResponse
    {
        $data = $request->validate([
            'order_id' => ['nullable','exists:orders,id'],
            'restaurant_id' => ['nullable','exists:restaurants,id'],
            'product_id' => ['nullable','exists:products,id'],
            'driver_id' => ['nullable','exists:drivers,id'],
            'rating' => ['required','integer','min:1','max:5'],
            'comment' => ['nullable','string','max:2000'],
        ]);
        $review = Review::query()->create($data + ['user_id' => $request->user()->id]);
        return response()->json(['data' => $review], 201);
    }
}
