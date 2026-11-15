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
