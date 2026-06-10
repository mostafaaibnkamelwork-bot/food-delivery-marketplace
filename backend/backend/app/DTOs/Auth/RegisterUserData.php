<?php

namespace App\DTOs\Auth;

final readonly class RegisterUserData
{
    public function __construct(
        public string $name,
        public ?string $email,
        public ?string $phone,
        public string $password,
        public string $role = 'customer',
    ) {}
}
