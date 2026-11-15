<?php

use Illuminate\Support\Facades\Route;

Route::view('/', 'pages.home')->name('home');
Route::view('/categories', 'pages.categories')->name('categories');
Route::view('/cart', 'pages.cart')->name('cart');
Route::view('/checkout', 'pages.checkout')->name('checkout');
Route::view('/wishlist', 'pages.wishlist')->name('wishlist');
Route::view('/profile', 'pages.profile')->name('profile');
Route::get('/product/{slug}', function (string $slug) {
    return view('pages.product', ['slug' => $slug]);
})->name('product');
