<?php

namespace App\Http\Controllers\Api\Customer;

use App\DTOs\Orders\CreateOrderData;
use App\Http\Controllers\Controller;
use App\Http\Requests\Orders\CreateOrderRequest;
use App\Services\Orders\OrderService;
use Illuminate\Http\JsonResponse;

class OrderController extends Controller
{
    public function __construct(private readonly OrderService $orders) {}

    public function store(CreateOrderRequest $request): JsonResponse
    {
        $order = $this->orders->create(new CreateOrderData(
            customerId: $request->user()->id,
            branchId: $request->integer('branch_id'),
            addressId: $request->input('address_id'),
            paymentMethod: $request->string('payment_method'),
            items: $request->array('items'),
            notes: $request->input('notes'),
            couponCode: $request->input('coupon_code'),
        ));

        return response()->json(['data' => $order->load('items')], 201);
    }
}
