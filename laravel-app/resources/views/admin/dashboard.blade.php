@extends('admin.layout')
@section('title','Overview')
@section('top-title','Overview')
@section('content')
<h1 class="title">Good day, {{ auth()->user()->name }}</h1><p class="muted">Here is what is happening with your store.</p>
<section class="cards"><article class="stat"><small>Total products</small><strong>{{ $totalProducts }}</strong></article><article class="stat"><small>Active products</small><strong>{{ $activeProducts }}</strong></article><article class="stat"><small>Low stock (5 or less)</small><strong>{{ $lowStock }}</strong></article></section>
<section class="panel"><div style="display:flex;justify-content:space-between;align-items:center;gap:10px;margin-bottom:15px"><div><h2 style="margin:0;font:500 21px Georgia,serif">Recent products</h2><p class="muted">Latest items in your catalogue</p></div><a class="btn gold" href="{{ route('admin.products.create') }}">+ Add product</a></div>
<div class="table-wrap"><table><thead><tr><th>Product</th><th>Category</th><th>Price</th><th>Stock</th><th>Status</th></tr></thead><tbody>
@forelse($recentProducts as $product)<tr><td>{{ $product->name }}</td><td>{{ $product->category }}</td><td>{{ $product->price ? '৳'.number_format((float)$product->price,2) : 'Not set' }}</td><td>{{ $product->stock }}</td><td>{{ $product->is_active ? 'Active' : 'Hidden' }}</td></tr>@empty<tr><td colspan="5">No products yet. Add your first product.</td></tr>@endforelse
</tbody></table></div></section>
@endsection
