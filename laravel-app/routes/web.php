<?php

use App\\Http\\Controllers\\Admin\\AdminAuthController;
use App\\Http\\Controllers\\Admin\\DashboardController;
use App\\Http\\Controllers\\Admin\\ProductController;
use Illuminate\\Support\\Facades\\Route;

Route::view('/', 'pages.home')->name('home');
Route::view('/categories', 'pages.categories')->name('categories');
Route::view('/cart', 'pages.cart')->name('cart');
Route::view('/checkout', 'pages.checkout')->name('checkout');
Route::view('/wishlist', 'pages.wishlist')->name('wishlist');
Route::view('/profile', 'pages.profile')->name('profile');
Route::get('/product/{slug}', function (string $slug) {
    return view('pages.product', ['slug' => $slug]);
})->name('product');

Route::prefix('admin')->name('admin.')->group(function () {
    Route::get('/login', [AdminAuthController::class, 'showLogin'])->name('login');
    Route::post('/login', [AdminAuthController::class, 'login'])->name('login.submit');
    Route::post('/logout', [AdminAuthController::class, 'logout'])->middleware('auth')->name('logout');

    Route::middleware('auth')->group(function () {
        Route::get('/', [DashboardController::class, 'index'])->name('dashboard');
        Route::resource('/products', ProductController::class)->except(['show']);
    });
});
