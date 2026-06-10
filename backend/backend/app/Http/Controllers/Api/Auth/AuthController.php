<?php

namespace App\Http\Controllers\Api\Auth;

use App\DTOs\Auth\RegisterUserData;
use App\Http\Controllers\Controller;
use App\Http\Requests\Auth\LoginRequest;
use App\Http\Requests\Auth\RegisterRequest;
use App\Services\Auth\AuthService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Password;

class AuthController extends Controller
{
    public function __construct(private readonly AuthService $auth) {}

    public function register(RegisterRequest $request): JsonResponse
    {
        $validated = $request->validated();
        $result = $this->auth->register(new RegisterUserData(
            name: $validated['name'],
            email: $validated['email'] ?? null,
            phone: $validated['phone'] ?? null,
            password: $validated['password'],
            role: $validated['role'] ?? 'customer',
        ));

        return response()->json($result, 201);
    }

    public function login(LoginRequest $request): JsonResponse
    {
        return response()->json($this->auth->login($request->string('login'), $request->string('password')));
    }

    public function logout(Request $request): JsonResponse
    {
        $request->user()->currentAccessToken()?->delete();
        return response()->json(['message' => 'Logged out.']);
    }

    public function forgotPassword(Request $request): JsonResponse
    {
        $data = $request->validate(['email' => ['required_without:login', 'email'], 'login' => ['required_without:email', 'string']]);
        $email = $data['email'] ?? $data['login'];
        Password::sendResetLink(['email' => $email]);

        return response()->json(['message' => 'Password reset link queued when the account exists.']);
    }
}
