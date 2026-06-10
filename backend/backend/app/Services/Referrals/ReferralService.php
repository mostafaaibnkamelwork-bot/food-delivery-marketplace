<?php

namespace App\Services\Referrals;

use App\Models\Referral;
use App\Models\ReferralReward;
use App\Models\User;

class ReferralService
{
    public function create(User $referrer, string $code): Referral
    {
        return Referral::query()->create(['referrer_id' => $referrer->id, 'code' => $code, 'status' => 'pending']);
    }
    public function qualify(Referral $referral, User $referred): ReferralReward
    {
        $referral->update(['referred_id' => $referred->id, 'status' => 'qualified', 'qualified_at' => now()]);
        return ReferralReward::query()->create(['referral_id' => $referral->id, 'user_id' => $referral->referrer_id, 'reward_type' => 'points', 'reward_value' => 100, 'status' => 'granted', 'granted_at' => now()]);
    }
}
