<?php

namespace App\Events\Orders;

use App\Models\Order;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

class OrderCreated implements ShouldBroadcast
{
    use Dispatchable, SerializesModels;
    public function __construct(public Order $order) {}
    public function broadcastOn(): array { return [new PrivateChannel('branch.' . $this->order->branch_id)]; }
    public function broadcastAs(): string { return 'order.created'; }
}
