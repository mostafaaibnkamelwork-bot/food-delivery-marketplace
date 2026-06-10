<?php

namespace App\DTOs\Orders;

final readonly class CreateOrderData
{
    public function __construct(
        public int $customerId,
        public int $branchId,
        public ?int $addressId,
        public string $paymentMethod,
        public array $items,
        public ?string $notes = null,
        public ?string $couponCode = null,
    ) {}
}
