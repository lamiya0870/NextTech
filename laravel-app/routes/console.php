<?php

use App\Models\User;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

Artisan::command('inspire', function () {
    $this->comment('The Future, Solved.');
})->purpose('Display the Next Tech motto');

Artisan::command('nexttech:make-admin', function () {
    $name = $this->ask('Administrator name');
    $email = $this->ask('Administrator email');
    $password = $this->secret('Administrator password (minimum 12 characters)');

    if (! $name || ! filter_var($email, FILTER_VALIDATE_EMAIL) || strlen((string) $password) < 12) {
        $this->error('Please provide a name, valid email, and password of at least 12 characters.');
        return 1;
    }

    $user = User::updateOrCreate(
        ['email' => Str::lower($email)],
        ['name' => $name, 'password' => Hash::make($password), 'is_admin' => true]
    );

    $this->info('Administrator account ready: '.$user->email);
    return 0;
})->purpose('Create or promote a Next Tech administrator account');
