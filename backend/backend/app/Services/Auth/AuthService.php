<?php

namespace App\Services\Auth;

use App\DTOs\Auth\RegisterUserData;
use App\Models\User;
use Illuminate\Support\Facades\Hash;

class AuthService
{
    public function register(RegisterUserData $data): array
    {
        $user = User::query()->create([
            'name' => $data->name,
            'email' => $data->email,
            'phone' => $data->phone,
            'password' => Hash::make($data->password),
        ]);

        $user->assignRole($data->role);
        $token = $user->createToken('api')->plainTextToken;

        return compact('user', 'token');
    }

    public function login(string $login, string $password): array
    {
        $user = User::query()
            ->where('email', $login)
            ->orWhere('phone', $login)
            ->firstOrFail();

        abort_unless(Hash::check($password, $user->password), 422, 'Invalid credentials.');

        $token = $user->createToken('api')->plainTextToken;
        return compact('user', 'token');
    }
}
