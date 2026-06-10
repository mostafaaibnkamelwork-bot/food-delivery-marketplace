<?php

namespace Tests\Feature;

use App\Models\Coupon;
use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Laravel\Sanctum\Sanctum;
use Tests\TestCase;

class CouponTest extends TestCase
{
    use RefreshDatabase;

    public function test_coupon_can_be_validated(): void
    {
        $user = User::factory()->create();
        $user->givePermissionTo('orders.create');
        Sanctum::actingAs($user);
        Coupon::query()->create(['code' => 'SAVE10', 'name' => 'Save', 'discount_type' => 'percentage', 'discount_value' => 10, 'status' => 'active']);
        $this->postJson('/api/coupons/validate', ['code' => 'SAVE10', 'subtotal' => 100])->assertOk()->assertJsonPath('data.discount_amount', 10);
    }
}
