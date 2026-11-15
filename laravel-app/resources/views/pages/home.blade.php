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
