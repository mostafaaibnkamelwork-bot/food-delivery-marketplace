<?php

namespace App\Http\Controllers\Api\Customer;

use App\Http\Controllers\Controller;
use App\Models\DeviceToken;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class NotificationController extends Controller
{
    public function index(Request $request): JsonResponse
    {
        return response()->json(['data' => $request->user()->notifications()->latest()->paginate()]);
    }
    public function markAsRead(Request $request, string $notification): JsonResponse
    {
        $item = $request->user()->notifications()->whereKey($notification)->firstOrFail();
        $item->markAsRead();
        return response()->json(['data' => $item]);
    }
    public function storeDeviceToken(Request $request): JsonResponse
    {
        $data = $request->validate(['token' => ['required','string'], 'platform' => ['required','in:ios,android,web'], 'device_name' => ['nullable','string']]);
        $token = DeviceToken::query()->updateOrCreate(['user_id' => $request->user()->id, 'token' => $data['token']], $data + ['last_used_at' => now()]);
        return response()->json(['data' => $token], 201);
    }
}
