#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")" && pwd)"
APP="$ROOT/laravel-app"
if [ ! -f "$APP/artisan" ]; then
  echo "Laravel app not found at $APP"
  exit 1
fi

mkdir -p "$APP/app/Models" "$APP/database/migrations" "$APP/database/seeders"

cat > "$APP/app/Models/Product.php" <<'PHP'
<?php

namespace App\\Models;

use Illuminate\\Database\\Eloquent\\Model;
use Illuminate\\Database\\Eloquent\\Factories\\HasFactory;

class Product extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'slug',
        'sku',
        'brand',
        'category',
        'description',
        'price',
        'stock',
        'image_path',
        'is_active',
    ];

    protected function casts(): array
    {
        return [
            'price' => 'decimal:2',
            'stock' => 'integer',
            'is_active' => 'boolean',
        ];
    }
}
PHP

cat > "$APP/database/migrations/2026_11_16_000000_create_products_table.php" <<'PHP'
<?php

use Illuminate\\Database\\Migrations\\Migration;
use Illuminate\\Database\\Schema\\Blueprint;
use Illuminate\\Support\\Facades\\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('slug')->unique();
            $table->string('sku')->nullable()->unique();
            $table->string('brand')->nullable();
            $table->string('category', 100);
            $table->text('description')->nullable();
            $table->decimal('price', 12, 2)->nullable();
            $table->unsignedInteger('stock')->default(0);
            $table->string('image_path')->nullable();
            $table->boolean('is_active')->default(true);
            $table->timestamps();

            $table->index(['category', 'is_active']);
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('products');
    }
};
PHP

cat > "$APP/database/seeders/ProductSeeder.php" <<'PHP'
<?php

namespace Database\\Seeders;

use App\\Models\\Product;
use Illuminate\\Database\\Seeder;

class ProductSeeder extends Seeder
{
    public function run(): void
    {
        $products = [
            ['name' => 'Dual Band Wi-Fi Router', 'slug' => 'router-dual-band', 'sku' => 'NT-ROUTER-001', 'brand' => 'TP-Link', 'category' => 'Routers', 'description' => 'Dual-band wireless router. Confirm exact model and specifications before purchase.', 'price' => null, 'stock' => 0],
            ['name' => 'GPON ONU 1GE', 'slug' => 'gpon-onu', 'sku' => 'NT-ONU-001', 'brand' => null, 'category' => 'ONU', 'description' => 'GPON optical network terminal. Confirm ISP compatibility before purchase.', 'price' => null, 'stock' => 0],
            ['name' => '12V Mini DC UPS', 'slug' => 'mini-ups-12v', 'sku' => 'NT-UPS-001', 'brand' => null, 'category' => 'Mini UPS', 'description' => 'Mini DC backup power unit. Confirm voltage, connector and device compatibility.', 'price' => null, 'stock' => 0],
            ['name' => 'Fiber Optic Drop Cable', 'slug' => 'fiber-drop-cable', 'sku' => 'NT-FIBER-001', 'brand' => null, 'category' => 'Fiber Optic', 'description' => 'Fiber optic drop cable. Confirm fiber type and length before ordering.', 'price' => null, 'stock' => 0],
            ['name' => 'SC-SC Fiber Patch Cord', 'slug' => 'patch-cord', 'sku' => 'NT-ACC-001', 'brand' => null, 'category' => 'Accessories', 'description' => 'Fiber patch cord. Confirm connector polish and cable length.', 'price' => null, 'stock' => 0],
            ['name' => 'SC Fast Connector', 'slug' => 'fast-connector', 'sku' => 'NT-ACC-002', 'brand' => null, 'category' => 'Accessories', 'description' => 'Fiber fast connector. Confirm connector type before purchase.', 'price' => null, 'stock' => 0],
            ['name' => 'PoE Power Adapter', 'slug' => 'poe-adapter', 'sku' => 'NT-POWER-001', 'brand' => null, 'category' => 'Accessories', 'description' => 'PoE power accessory. Confirm voltage, wattage and pinout compatibility.', 'price' => null, 'stock' => 0],
            ['name' => 'MikroTik Router', 'slug' => 'mikrotik-router', 'sku' => 'NT-ROUTER-002', 'brand' => 'MikroTik', 'category' => 'Routers', 'description' => 'MikroTik networking router. Confirm exact model and license level.', 'price' => null, 'stock' => 0],
        ];

        foreach ($products as $product) {
            Product::updateOrCreate(['slug' => $product['slug']], $product);
        }
    }
}
PHP

cat > "$APP/database/seeders/DatabaseSeeder.php" <<'PHP'
<?php

namespace Database\\Seeders;

use Illuminate\\Database\\Seeder;

class DatabaseSeeder extends Seeder
{
    public function run(): void
    {
        $this->call(ProductSeeder::class);
    }
}
PHP

echo "Product database files are ready."
echo "Next run from the Laravel app directory:"
echo "php artisan migrate --seed"
