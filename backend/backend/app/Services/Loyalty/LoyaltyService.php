<?php

namespace App\Services\Loyalty;

use App\Models\RewardPoint;
use App\Models\RewardTransaction;
use App\Models\User;

class LoyaltyService
{
    public function addPoints(User $user, int $points, string $reason, ?int $orderId = null): RewardTransaction
    {
        $wallet = RewardPoint::query()->firstOrCreate(['user_id' => $user->id]);
        $wallet->increment('balance', $points);
        $wallet->increment('lifetime_earned', $points);

        return RewardTransaction::query()->create([
            'user_id' => $user->id,
            'order_id' => $orderId,
            'type' => 'earn',
            'points' => $points,
            'balance_after' => $wallet->fresh()->balance,
            'reason' => $reason,
        ]);
    }
}
