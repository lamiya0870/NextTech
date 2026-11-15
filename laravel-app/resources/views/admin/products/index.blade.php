@extends('admin.layout')
@section('title','Products')
@section('top-title','Product management')
@section('content')
<div style="display:flex;justify-content:space-between;align-items:center;gap:10px;flex-wrap:wrap"><div><h1 class="title">Products</h1><p class="muted">Manage your networking and fiber optic catalogue.</p></div><a class="btn gold" href="{{ route('admin.products.create') }}">+ Add product</a></div>
<section class="panel"><div class="table-wrap"><table><thead><tr><th>Product</th><th>SKU</th><th>Category</th><th>Price</th><th>Stock</th><th>Status</th><th>Actions</th></tr></thead><tbody>
@forelse($products as $product)<tr><td>{{ $product->name }}</td><td>{{ $product->sku ?: '—' }}</td><td>{{ $product->category }}</td><td>{{ $product->price ? '৳'.number_format((float)$product->price,2) : 'Not set' }}</td><td>{{ $product->stock }}</td><td>{{ $product->is_active ? 'Active' : 'Hidden' }}</td><td><div class="actions"><a class="btn" href="{{ route('admin.products.edit',$product) }}">Edit</a><form method="POST" action="{{ route('admin.products.destroy',$product) }}" onsubmit="return confirm('Delete this product?')">@csrf @method('DELETE')<button class="btn red" type="submit">Delete</button></form></div></td></tr>@empty<tr><td colspan="7">No products found.</td></tr>@endforelse
</tbody></table></div><div class="pagination">{{ $products->links() }}</div></section>
@endsection
