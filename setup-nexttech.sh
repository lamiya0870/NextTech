#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")" && pwd)"
APP="$ROOT/laravel-app"
if [ ! -f "$APP/artisan" ]; then
  echo "Laravel app not found: $APP"
  exit 1
fi

mkdir -p "$APP/resources/views/layouts" "$APP/resources/views/pages" "$APP/routes"

cat > "$APP/routes/web.php" <<'PHP'
<?php

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
PHP

cat > "$APP/resources/views/layouts/app.blade.php" <<'BLADE'
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="theme-color" content="#101b2d">
<title>@yield('title', 'Next Tech') | The Future, Solved.</title>
<style>
*{box-sizing:border-box}html{scroll-behavior:smooth}body{margin:0;font-family:Arial,sans-serif;background:#f5f6f8;color:#172033;padding-bottom:82px}a{color:inherit;text-decoration:none}button,input,textarea,select{font:inherit}.header{height:76px;background:#fff;border-bottom:1px solid #e9e5dc;display:flex;align-items:center;justify-content:space-between;padding:0 18px;position:sticky;top:0;z-index:10}.brand{position:absolute;left:50%;transform:translateX(-50%);display:flex;flex-direction:column;align-items:center;white-space:nowrap}.brand-main{font:700 25px Georgia,serif;letter-spacing:3px}.brand-main span{color:#b58b45}.brand-tag{margin-top:5px;color:#8a7657;font-size:8px;letter-spacing:2px}.head-link{font-size:23px;border:0;background:none;padding:8px}.wrap{width:min(1100px,100%);margin:auto;padding:22px 17px}.eyebrow{font-size:10px;letter-spacing:2.3px;font-weight:700;color:#c5a66f}.hero{min-height:260px;border-radius:20px;padding:34px 25px;color:white;background:radial-gradient(circle at 85% 20%,#49698b,transparent 35%),linear-gradient(125deg,#101b2d,#203e60);display:flex;flex-direction:column;justify-content:center;gap:12px}.hero h1{font:500 clamp(30px,6vw,46px) Georgia,serif;margin:0}.hero p{max-width:520px;color:#e4e9ef;line-height:1.65}.btn{display:inline-block;border:0;border-radius:9px;background:#17263b;color:#fff;padding:12px 17px;font-weight:700;font-size:13px;cursor:pointer}.btn.gold{background:#c5a66f;color:#142033}.section-title{font:700 23px Georgia,serif;margin:27px 0 15px}.brandbar{margin:22px 0;padding:20px;background:#fff;border:1px solid #ece9e2;border-radius:15px;overflow:hidden;text-align:center}.brand-track{display:flex;gap:35px;width:max-content;margin-top:18px;animation:marquee 25s linear infinite}.brand-track b{font-size:17px;color:#344258;white-space:nowrap}@keyframes marquee{to{transform:translateX(-50%)}}.cats{display:flex;flex-wrap:wrap;gap:9px}.chip{padding:10px 15px;border:1px solid #e5e1d8;border-radius:22px;background:#fff;font-size:13px}.grid{display:grid;grid-template-columns:repeat(2,minmax(0,1fr));gap:12px}.card{background:#fff;border:1px solid #e9e7e2;border-radius:14px;padding:12px;min-width:0}.visual{height:130px;background:#f0f2f5;border-radius:10px;display:grid;place-items:center;font-size:48px;margin-bottom:12px}.card h3{font-size:14px;margin:5px 0 8px}.muted{color:#788292;font-size:13px;line-height:1.6}.price{color:#a17b3e;font-weight:700}.actions{display:flex;gap:7px;margin-top:12px}.actions .btn{flex:1;text-align:center;padding:10px 5px;font-size:11px}.page-head{padding:22px 0 12px}.page-head h1{font:500 32px Georgia,serif;margin:0 0 8px}.panel{background:#fff;border:1px solid #e8e7e4;border-radius:15px;padding:17px;margin:14px 0}.field{display:block;width:100%;padding:13px;border:1px solid #dfe2e7;border-radius:9px;margin:7px 0 14px;background:#fff}.form-grid{display:grid;grid-template-columns:1fr 1fr;gap:10px}.bottom{position:fixed;bottom:0;left:0;right:0;height:72px;background:#fff;border-top:1px solid #e8e5df;display:flex;justify-content:space-around;align-items:center;z-index:20}.bottom a{display:flex;flex-direction:column;align-items:center;gap:4px;color:#89909a;font-size:11px}.bottom a.active{color:#a17b3e}.bottom span:first-child{font-size:22px}.cart-line{display:flex;align-items:center;gap:12px;border-bottom:1px solid #eee;padding:12px 0}.cart-line .visual{width:54px;height:54px;margin:0;font-size:25px;flex:none}.cart-line .grow{flex:1}.qty{display:flex;align-items:center;gap:8px}.qty button{border:1px solid #ddd;background:white;border-radius:6px;padding:4px 9px}.total{display:flex;justify-content:space-between;font-weight:700;margin:18px 0}.notice{padding:14px;border-radius:10px;background:#f7f2e8;color:#725b31;font-size:13px;line-height:1.5}@media(min-width:700px){body{padding-bottom:0}.grid{grid-template-columns:repeat(4,minmax(0,1fr))}.bottom{position:static}.hero{padding:50px}.wrap{padding:28px 22px}}@media(max-width:430px){.form-grid{grid-template-columns:1fr}}
</style>
</head>
<body>
<header class="header"><a class="head-link" href="{{ route('categories') }}" aria-label="Categories">☰</a><a class="brand" href="{{ route('home') }}"><span class="brand-main">NEXT <span>TECH</span></span><span class="brand-tag">THE FUTURE, SOLVED.</span></a><a class="head-link" href="{{ route('wishlist') }}" aria-label="Wishlist">♡</a></header>
@yield('content')
<nav class="bottom"><a class="{{ request()->routeIs('home')?'active':'' }}" href="{{ route('home') }}"><span>⌂</span>Home</a><a class="{{ request()->routeIs('categories')?'active':'' }}" href="{{ route('categories') }}"><span>▦</span>Categories</a><a class="{{ request()->routeIs('cart','checkout')?'active':'' }}" href="{{ route('cart') }}"><span>🛒</span>Cart</a><a class="{{ request()->routeIs('profile')?'active':'' }}" href="{{ route('profile') }}"><span>♙</span>Profile</a></nav>
<script>
const catalog=[
{id:'router-dual-band',name:'Dual Band Wi-Fi Router',cat:'Routers',emoji:'📡',price:0},
{id:'gpon-onu',name:'GPON ONU 1GE',cat:'ONU',emoji:'🌐',price:0},
{id:'mini-ups-12v',name:'12V Mini DC UPS',cat:'Mini UPS',emoji:'🔋',price:0},
{id:'fiber-drop-cable',name:'Fiber Optic Drop Cable',cat:'Fiber Optic',emoji:'🧵',price:0},
{id:'patch-cord',name:'SC-SC Fiber Patch Cord',cat:'Accessories',emoji:'🔌',price:0},
{id:'fast-connector',name:'SC Fast Connector',cat:'Accessories',emoji:'🧩',price:0},
{id:'poe-adapter',name:'PoE Power Adapter',cat:'Accessories',emoji:'⚡',price:0},
{id:'mikrotik-router',name:'MikroTik Router',cat:'Routers',emoji:'📶',price:0}
];
const read=(key,def)=>{try{return JSON.parse(localStorage.getItem(key)||JSON.stringify(def))}catch{return def}};
let cart=read('nt-cart',{}),wish=read('nt-wishlist',[]);
const persist=()=>{localStorage.setItem('nt-cart',JSON.stringify(cart));localStorage.setItem('nt-wishlist',JSON.stringify(wish))};
const money=n=>'৳'+Number(n).toLocaleString('en-BD');
function addCart(id){cart[id]=(cart[id]||0)+1;persist();alert('Added to cart')}
function productCard(p){return '<article class="card"><div class="visual">'+p.emoji+'</div><h3>'+p.name+'</h3><p class="muted">'+p.cat+'</p><p class="price">'+(p.price?money(p.price):'Price on request')+'</p><div class="actions"><a class="btn" href="/product/'+p.id+'">Details</a><button class="btn gold" onclick="addCart(\''+p.id+'\')">Add to Cart</button></div></article>'}
document.querySelectorAll('[data-add]').forEach(b=>b.addEventListener('click',()=>addCart(b.dataset.add)));
</script>
@stack('scripts')
</body></html>
BLADE

cat > "$APP/resources/views/pages/home.blade.php" <<'BLADE'
@extends('layouts.app')
@section('title','Home')
@section('content')
<main class="wrap">
<section class="hero"><span class="eyebrow">NETWORKING & FIBER OPTIC STORE</span><h1>The Future, Solved.</h1><p>Routers, ONU, Mini UPS, fiber optic products and networking essentials for a faster, more reliable connection.</p><a class="btn gold" href="{{ route('categories') }}">Explore Products →</a></section>
<section class="brandbar"><span class="eyebrow">POPULAR NETWORKING BRANDS</span><h2 class="section-title" style="margin:8px 0">Brands to Explore</h2><div style="overflow:hidden"><div class="brand-track">@foreach(['TP-Link','Tenda','Huawei','ZTE','MikroTik','D-Link','FiberHome','TP-Link','Tenda','Huawei','ZTE','MikroTik','D-Link','FiberHome'] as $brand)<b>{{ $brand }}</b>@endforeach</div></div><p class="muted">Brand availability depends on current stock.</p></section>
<h2 class="section-title">Shop by Category</h2><div class="cats">@foreach(['Routers','ONU','Mini UPS','Fiber Optic','Accessories'] as $cat)<a class="chip" href="{{ route('categories',['category'=>$cat]) }}">{{ $cat }}</a>@endforeach</div>
<h2 class="section-title">Featured Products</h2><section class="grid">@foreach([['Dual Band Wi-Fi Router','📡','router-dual-band'],['GPON ONU 1GE','🌐','gpon-onu'],['12V Mini DC UPS','🔋','mini-ups-12v'],['Fiber Optic Drop Cable','🧵','fiber-drop-cable']] as $p)<article class="card"><div class="visual">{{ $p[1] }}</div><h3>{{ $p[0] }}</h3><p class="price">Price on request</p><div class="actions"><a class="btn" href="{{ route('product',$p[2]) }}">Details</a><button class="btn gold" data-add="{{ $p[2] }}">Add to Cart</button></div></article>@endforeach</section>
</main>
@endsection
BLADE

cat > "$APP/resources/views/pages/categories.blade.php" <<'BLADE'
@extends('layouts.app')
@section('title','Categories')
@section('content')
<main class="wrap"><div class="page-head"><h1>Shop Categories</h1><p class="muted">Find the right equipment for your network.</p></div><div class="cats">@foreach(['Routers','ONU','Mini UPS','Fiber Optic','Accessories'] as $cat)<a class="chip" href="#{{ Str::slug($cat) }}">{{ $cat }}</a>@endforeach</div>
@foreach(['Routers'=>[['Dual Band Wi-Fi Router','📡','router-dual-band'],['MikroTik Router','📶','mikrotik-router']],'ONU'=>[['GPON ONU 1GE','🌐','gpon-onu']],'Mini UPS'=>[['12V Mini DC UPS','🔋','mini-ups-12v']],'Fiber Optic'=>[['Fiber Optic Drop Cable','🧵','fiber-drop-cable']],'Accessories'=>[['SC-SC Fiber Patch Cord','🔌','patch-cord'],['SC Fast Connector','🧩','fast-connector'],['PoE Power Adapter','⚡','poe-adapter']]] as $cat=>$items)
<h2 class="section-title" id="{{ Str::slug($cat) }}">{{ $cat }}</h2><section class="grid">@foreach($items as $p)<article class="card"><div class="visual">{{ $p[1] }}</div><h3>{{ $p[0] }}</h3><p class="price">Price on request</p><div class="actions"><a class="btn" href="{{ route('product',$p[2]) }}">Details</a><button class="btn gold" data-add="{{ $p[2] }}">Add to Cart</button></div></article>@endforeach</section>@endforeach</main>
@endsection
BLADE

cat > "$APP/resources/views/pages/product.blade.php" <<'BLADE'
@extends('layouts.app')
@section('title','Product Details')
@section('content')
@php($items=['router-dual-band'=>['Dual Band Wi-Fi Router','📡','Routers'],'gpon-onu'=>['GPON ONU 1GE','🌐','ONU'],'mini-ups-12v'=>['12V Mini DC UPS','🔋','Mini UPS'],'fiber-drop-cable'=>['Fiber Optic Drop Cable','🧵','Fiber Optic'],'patch-cord'=>['SC-SC Fiber Patch Cord','🔌','Accessories'],'fast-connector'=>['SC Fast Connector','🧩','Accessories'],'poe-adapter'=>['PoE Power Adapter','⚡','Accessories'],'mikrotik-router'=>['MikroTik Router','📶','Routers']])
@php($p=$items[$slug] ?? ['Networking Product','📦','Accessories'])
<main class="wrap"><div class="page-head"><p class="muted"><a href="{{ route('home') }}">Home</a> / <a href="{{ route('categories') }}">Products</a> / {{ $p[0] }}</p><h1>{{ $p[0] }}</h1></div><section class="panel"><div class="visual" style="height:220px;font-size:80px">{{ $p[1] }}</div><span class="eyebrow">{{ $p[2] }}</span><h2>{{ $p[0] }}</h2><p class="price">Price on request</p><p class="muted">Contact the store to confirm model, connector type, speed, power rating, compatibility and stock before ordering.</p><button class="btn gold" onclick="addCart('{{ $slug }}')">Add to Cart</button></section></main>
@endsection
BLADE

cat > "$APP/resources/views/pages/cart.blade.php" <<'BLADE'
@extends('layouts.app')
@section('title','Shopping Cart')
@section('content')
<main class="wrap"><div class="page-head"><h1>Your Shopping Cart</h1><p class="muted">Review your selected networking products.</p></div><section class="panel" id="cart-page"><p class="muted">Loading your cart…</p></section></main>
@endsection
@push('scripts')
<script>
const names={'router-dual-band':['Dual Band Wi-Fi Router','📡'],'gpon-onu':['GPON ONU 1GE','🌐'],'mini-ups-12v':['12V Mini DC UPS','🔋'],'fiber-drop-cable':['Fiber Optic Drop Cable','🧵'],'patch-cord':['SC-SC Fiber Patch Cord','🔌'],'fast-connector':['SC Fast Connector','🧩'],'poe-adapter':['PoE Power Adapter','⚡'],'mikrotik-router':['MikroTik Router','📶']};
function renderCart(){let box=document.getElementById('cart-page'),rows=Object.entries(cart).filter(([,q])=>q>0);if(!rows.length){box.innerHTML='<p>Your cart is empty.</p><a class="btn gold" href="/categories">Browse Products</a>';return}box.innerHTML=rows.map(([id,q])=>{let p=names[id]||['Product','📦'];return '<div class="cart-line"><div class="visual">'+p[1]+'</div><div class="grow"><b>'+p[0]+'</b><p class="muted">Price on request</p></div><div class="qty"><button onclick="changeQty(\''+id+'\',-1)">−</button><b>'+q+'</b><button onclick="changeQty(\''+id+'\',1)">+</button></div></div>'}).join('')+'<div class="total"><span>Estimated total</span><span>Price on request</span></div><p class="notice">Final product prices and compatibility will be confirmed by Next Tech before order confirmation.</p><a class="btn gold" href="/checkout">Proceed to Checkout →</a>'}
function changeQty(id,n){cart[id]=(cart[id]||0)+n;if(cart[id]<=0)delete cart[id];persist();renderCart()}renderCart();
</script>
@endpush
BLADE

cat > "$APP/resources/views/pages/checkout.blade.php" <<'BLADE'
@extends('layouts.app')
@section('title','Checkout')
@section('content')
<main class="wrap"><div class="page-head"><h1>Checkout</h1><p class="muted">Enter your delivery details to submit an order request.</p></div><div class="notice">Products currently show “Price on request”. Our team will confirm pricing, stock and delivery details before final confirmation.</div><form class="panel" id="checkout-form"><label>Full Name<input class="field" name="name" required autocomplete="name"></label><div class="form-grid"><label>Phone Number<input class="field" name="phone" type="tel" required autocomplete="tel"></label><label>Email (optional)<input class="field" name="email" type="email" autocomplete="email"></label></div><label>Delivery Address<textarea class="field" name="address" rows="3" required></textarea></label><label>Order Note (optional)<textarea class="field" name="note" rows="2"></textarea></label><div id="checkout-summary" class="panel"></div><button class="btn gold" type="submit">Submit Order Request</button></form><div id="checkout-result"></div></main>
@endsection
@push('scripts')
<script>
const summary=document.getElementById('checkout-summary');const names={'router-dual-band':['Dual Band Wi-Fi Router'],'gpon-onu':['GPON ONU 1GE'],'mini-ups-12v':['12V Mini DC UPS'],'fiber-drop-cable':['Fiber Optic Drop Cable'],'patch-cord':['SC-SC Fiber Patch Cord'],'fast-connector':['SC Fast Connector'],'poe-adapter':['PoE Power Adapter'],'mikrotik-router':['MikroTik Router']};function drawSummary(){let rows=Object.entries(cart).filter(([,q])=>q>0);summary.innerHTML='<b>Order Summary</b><p class="muted">'+(rows.length?rows.map(([id,q])=>(names[id]?.[0]||id)+' × '+q).join('<br>'):'Your cart is empty')+'</p>'}drawSummary();
document.getElementById('checkout-form').addEventListener('submit',e=>{e.preventDefault();if(!Object.keys(cart).length){alert('Your cart is empty.');return}let data=Object.fromEntries(new FormData(e.target));let order={...data,items:cart,createdAt:new Date().toISOString()};let orders=read('nt-order-requests',[]);orders.push(order);localStorage.setItem('nt-order-requests',JSON.stringify(orders));document.getElementById('checkout-result').innerHTML='<div class="panel"><h2>Order request saved on this device</h2><p class="muted">This is a front-end demo only. No order has been sent to the store yet.</p></div>';cart={};persist();e.target.reset();drawSummary()});
</script>
@endpush
BLADE

cat > "$APP/resources/views/pages/wishlist.blade.php" <<'BLADE'
@extends('layouts.app')
@section('title','Wishlist')
@section('content')
<main class="wrap"><div class="page-head"><h1>Your Wishlist</h1><p class="muted">Your saved networking essentials.</p></div><section class="grid" id="wishlist-page"></section></main>
@endsection
@push('scripts')
<script>
const wishNames={'router-dual-band':['Dual Band Wi-Fi Router','📡'],'gpon-onu':['GPON ONU 1GE','🌐'],'mini-ups-12v':['12V Mini DC UPS','🔋'],'fiber-drop-cable':['Fiber Optic Drop Cable','🧵'],'patch-cord':['SC-SC Fiber Patch Cord','🔌'],'fast-connector':['SC Fast Connector','🧩'],'poe-adapter':['PoE Power Adapter','⚡'],'mikrotik-router':['MikroTik Router','📶']};
const wb=document.getElementById('wishlist-page');wb.innerHTML=wish.length?wish.map(id=>{let p=wishNames[id]||['Product','📦'];return '<article class="card"><div class="visual">'+p[1]+'</div><h3>'+p[0]+'</h3><button class="btn gold" onclick="addCart(\''+id+'\')">Add to Cart</button></article>'}).join(''):'<div class="panel">Your wishlist is empty. Browse categories to save products.</div>';
</script>
@endpush
BLADE

cat > "$APP/resources/views/pages/profile.blade.php" <<'BLADE'
@extends('layouts.app')
@section('title','Profile')
@section('content')
<main class="wrap"><div class="page-head"><h1>My Account</h1><p class="muted">Customer account features will be connected in the authentication step.</p></div><section class="panel"><h2>Welcome to Next Tech</h2><p class="muted">Sign-in, order history, saved addresses and account settings will be added with the customer authentication system.</p></section></main>
@endsection
BLADE

echo "Next Tech separate pages installed: Home, Categories, Product Details, Cart, Checkout, Wishlist and Profile."
echo "Run: cd laravel-app && php artisan route:clear && php artisan view:clear && php artisan serve --host=0.0.0.0 --port=8000"
