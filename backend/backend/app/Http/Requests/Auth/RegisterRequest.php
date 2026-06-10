<?php

namespace App\Http\Requests\Auth;

use Illuminate\Foundation\Http\FormRequest;

class RegisterRequest extends FormRequest
{
    public function authorize(): bool { return true; }
    public function rules(): array
    {
        return [
            'name' => ['required', 'string', 'max:150'],
            'email' => ['nullable', 'email', 'max:190', 'unique:users,email', 'required_without:phone'],
            'phone' => ['nullable', 'string', 'max:40', 'unique:users,phone', 'required_without:email'],
            'password' => ['required', 'string', 'min:8', 'confirmed'],
            'role' => ['nullable', 'in:customer,restaurant_owner,driver'],
        ];
    }
}
