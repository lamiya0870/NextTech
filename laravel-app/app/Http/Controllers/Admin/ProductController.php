<?php

namespace App\\Http\\Controllers\\Admin;

use App\\Http\\Controllers\\Controller;
use App\\Models\\Product;
use Illuminate\\Http\\Request;
use Illuminate\\Support\\Str;

class ProductController extends Controller
{
    private function guardAdmin(): void
    {
        abort_unless(auth()->user()?->is_admin, 403);
    }

    public function index()
    {
        $this->guardAdmin();

        return view('admin.products.index', [
            'products' => Product::latest()->paginate(12),
        ]);
    }

    public function create()
    {
        $this->guardAdmin();

        return view('admin.products.form', ['product' => new Product()]);
    }

    public function store(Request $request)
    {
        $this->guardAdmin();
        $data = $this->validated($request);
        $data['slug'] = Str::slug($data['name']).'-'.Str::lower(Str::random(5));
        $data['image_path'] = $request->file('image')?->store('products', 'public');
        unset($data['image']);

        Product::create($data);

        return redirect()->route('admin.products.index')->with('success', 'Product created successfully.');
    }

    public function edit(Product $product)
    {
        $this->guardAdmin();

        return view('admin.products.form', compact('product'));
    }

    public function update(Request $request, Product $product)
    {
        $this->guardAdmin();
        $data = $this->validated($request, $product);
        $data['slug'] = $product->slug;
        if ($request->hasFile('image')) {
            $data['image_path'] = $request->file('image')->store('products', 'public');
        }
        unset($data['image']);

        $product->update($data);

        return redirect()->route('admin.products.index')->with('success', 'Product updated successfully.');
    }

    public function destroy(Product $product)
    {
        $this->guardAdmin();
        $product->delete();

        return redirect()->route('admin.products.index')->with('success', 'Product deleted.');
    }

    private function validated(Request $request, ?Product $product = null): array
    {
        return $request->validate([
            'name' => ['required', 'string', 'max:255'],
            'sku' => ['nullable', 'string', 'max:255', 'unique:products,sku,'.($product?->id ?? 'NULL').',id'],
            'brand' => ['nullable', 'string', 'max:255'],
            'category' => ['required', 'string', 'max:100'],
            'description' => ['nullable', 'string', 'max:5000'],
            'price' => ['nullable', 'numeric', 'min:0'],
            'stock' => ['required', 'integer', 'min:0'],
            'is_active' => ['nullable', 'boolean'],
            'image' => ['nullable', 'image', 'max:3072'],
        ]) + ['is_active' => $request->boolean('is_active')];
    }
}
