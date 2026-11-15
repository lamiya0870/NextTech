@extends('admin.layout')
@section('title',$product->exists ? 'Edit product' : 'Add product')
@section('top-title','Product management')
@section('content')
<h1 class="title">{{ $product->exists ? 'Edit product' : 'Add product' }}</h1><p class="muted">Enter accurate product details. Price can be left blank until confirmed.</p>
@if($errors->any())<div class="alert" style="background:#fff0ef;color:#a12b22">@foreach($errors->all() as $error)<div>{{ $error }}</div>@endforeach</div>@endif
<section class="panel"><form method="POST" enctype="multipart/form-data" action="{{ $product->exists ? route('admin.products.update',$product) : route('admin.products.store') }}">@csrf @if($product->exists)@method('PUT')@endif
<div class="grid2"><div><label class="label">Product name *</label><input class="field" name="name" value="{{ old('name',$product->name) }}" required></div><div><label class="label">SKU</label><input class="field" name="sku" value="{{ old('sku',$product->sku) }}"></div><div><label class="label">Brand</label><input class="field" name="brand" value="{{ old('brand',$product->brand) }}" placeholder="e.g. TP-Link"></div><div><label class="label">Category *</label><select class="field" name="category" required>@foreach(['Routers','ONU','Mini UPS','Fiber Optic','Accessories'] as $category)<option value="{{ $category }}" @selected(old('category',$product->category)===$category)>{{ $category }}</option>@endforeach</select></div><div><label class="label">Price (BDT)</label><input class="field" type="number" min="0" step="0.01" name="price" value="{{ old('price',$product->price) }}"></div><div><label class="label">Stock quantity *</label><input class="field" type="number" min="0" name="stock" value="{{ old('stock',$product->stock ?? 0) }}" required></div></div>
<label class="label">Description</label><textarea class="field" name="description" rows="4">{{ old('description',$product->description) }}</textarea>
<label class="label">Product image (max 3 MB)</label><input class="field" type="file" name="image" accept="image/*">@if($product->image_path)<img src="{{ asset('storage/'.$product->image_path) }}" alt="Current product image" style="max-width:110px;border-radius:8px">@endif
<label class="label"><input type="checkbox" name="is_active" value="1" @checked(old('is_active',$product->is_active ?? true))> Visible in store</label><br><br>
<div class="actions"><button class="btn gold" type="submit">{{ $product->exists ? 'Save changes' : 'Create product' }}</button><a class="btn" href="{{ route('admin.products.index') }}">Cancel</a></div>
</form></section>
@endsection
