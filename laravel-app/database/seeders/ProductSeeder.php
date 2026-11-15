<?php

namespace Database\Seeders;

use App\Models\Product;
use Illuminate\Database\Seeder;

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
