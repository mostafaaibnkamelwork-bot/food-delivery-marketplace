<?php

namespace App\Http\Controllers\Api\Customer;

use App\Http\Controllers\Controller;
use App\Models\Complaint;
use App\Models\SupportTicket;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class SupportController extends Controller
{
    public function tickets(Request $request): JsonResponse
    {
        return response()->json(['data' => SupportTicket::query()->with('messages')->where('user_id', $request->user()->id)->latest()->paginate()]);
    }
    public function storeTicket(Request $request): JsonResponse
    {
        $ticket = SupportTicket::query()->create($request->validate([
            'order_id' => ['nullable','exists:orders,id'],
            'subject' => ['required','string','max:190'],
            'category' => ['required','string','max:80'],
            'priority' => ['nullable','in:low,normal,high,urgent'],
        ]) + ['user_id' => $request->user()->id, 'status' => 'open']);
        return response()->json(['data' => $ticket], 201);
    }
    public function storeMessage(Request $request, int $ticket): JsonResponse
    {
        $supportTicket = SupportTicket::query()->where('user_id', $request->user()->id)->findOrFail($ticket);
        $message = $supportTicket->messages()->create($request->validate(['message' => ['required','string'], 'attachments' => ['nullable','array']]) + ['sender_id' => $request->user()->id]);
        return response()->json(['data' => $message], 201);
    }
    public function storeComplaint(Request $request): JsonResponse
    {
        $complaint = Complaint::query()->create($request->validate([
            'order_id' => ['nullable','exists:orders,id'],
            'restaurant_id' => ['nullable','exists:restaurants,id'],
            'driver_id' => ['nullable','exists:drivers,id'],
            'complaint_type' => ['required','string','max:80'],
            'description' => ['required','string'],
        ]) + ['user_id' => $request->user()->id, 'status' => 'open']);
        return response()->json(['data' => $complaint], 201);
    }
}
