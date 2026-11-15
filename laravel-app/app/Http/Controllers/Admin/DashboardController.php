<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Product;

class DashboardController extends Controller
{
    public function index()
    {
        abort_unless(auth()->user()?->is_admin, 403);

        return view('admin.dashboard', [
            'totalProducts' => Product::count(),
            'activeProducts' => Product::where('is_active', true)->count(),
            'lowStock' => Product::where('stock', '<=', 5)->count(),
            'recentProducts' => Product::latest()->take(6)->get(),
        ]);
    }
}
