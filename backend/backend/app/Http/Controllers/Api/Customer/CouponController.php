<?php

namespace App\Http\Controllers\Api\Customer;

use App\Http\Controllers\Controller;
use App\Models\Coupon;
use App\Models\CouponUsage;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class CouponController extends Controller
{
    public function validateCoupon(Request $request): JsonResponse
    {
        $data = $request->validate(['code' => ['required','string'], 'subtotal' => ['required','numeric','min:0']]);
        $coupon = Coupon::query()->where('code', $data['code'])->where('status', 'active')->firstOrFail();
        abort_if($coupon->starts_at && now()->lt($coupon->starts_at), 422, 'Coupon is not active yet.');
        abort_if($coupon->ends_at && now()->gt($coupon->ends_at), 422, 'Coupon has expired.');
        abort_if((float) $data['subtotal'] < (float) $coupon->min_order_amount, 422, 'Minimum order amount not reached.');
        $discount = $coupon->discount_type === 'percentage'
            ? ((float) $data['subtotal'] * (float) $coupon->discount_value) / 100
            : (float) $coupon->discount_value;
        if ($coupon->max_discount_amount) { $discount = min($discount, (float) $coupon->max_discount_amount); }
        return response()->json(['data' => ['coupon' => $coupon, 'discount_amount' => round($discount, 2)]]);
    }
    public function usages(Request $request): JsonResponse
    {
        return response()->json(['data' => CouponUsage::query()->with('coupon','order')->where('user_id', $request->user()->id)->latest()->paginate()]);
    }
}
