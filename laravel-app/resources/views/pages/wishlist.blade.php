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
