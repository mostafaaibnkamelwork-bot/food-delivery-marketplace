<?php

namespace App\Http\Requests\Orders;

use Illuminate\Foundation\Http\FormRequest;

class CreateOrderRequest extends FormRequest
{
    public function authorize(): bool { return $this->user()->can('orders.create'); }
    public function rules(): array
    {
        return [
            'branch_id' => ['required', 'integer', 'exists:restaurant_branches,id'],
            'address_id' => ['nullable', 'integer', 'exists:customer_addresses,id'],
            'payment_method' => ['required', 'in:cash,card,wallet'],
            'notes' => ['nullable', 'string', 'max:1000'],
            'coupon_code' => ['nullable', 'string', 'max:80'],
            'items' => ['required', 'array', 'min:1'],
            'items.*.product_id' => ['required', 'integer', 'exists:products,id'],
            'items.*.product_name' => ['required', 'string', 'max:180'],
            'items.*.quantity' => ['required', 'integer', 'min:1'],
            'items.*.unit_price' => ['required', 'numeric', 'min:0'],
            'items.*.total_price' => ['required', 'numeric', 'min:0'],
            'items.*.options' => ['nullable', 'array'],
        ];
    }
}
