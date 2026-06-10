<?php

namespace App\Services\Orders;

use App\DTOs\Orders\CreateOrderData;
use App\Events\Orders\OrderCreated;
use App\Models\Order;
use Illuminate\Support\Facades\DB;

class OrderService
{
    public function create(CreateOrderData $data): Order
    {
        return DB::transaction(function () use ($data) {
            $subtotal = collect($data->items)->sum(fn (array $item) => $item['unit_price'] * $item['quantity']);
            $order = Order::query()->create([
                'order_number' => 'ORD-' . now()->format('YmdHis') . random_int(1000, 9999),
                'customer_id' => $data->customerId,
                'branch_id' => $data->branchId,
                'address_id' => $data->addressId,
                'status' => 'pending',
                'subtotal' => $subtotal,
                'delivery_fee' => 0,
                'discount_amount' => 0,
                'tax_amount' => 0,
                'total_amount' => $subtotal,
                'payment_method' => $data->paymentMethod,
                'notes' => $data->notes,
                'placed_at' => now(),
            ]);

            foreach ($data->items as $item) {
                $order->items()->create($item);
            }

            event(new OrderCreated($order));
            return $order;
        });
    }
}
