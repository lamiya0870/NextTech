@extends('layouts.app')
@section('title','Product Details')
@section('content')
@php($items=['router-dual-band'=>['Dual Band Wi-Fi Router','📡','Routers'],'gpon-onu'=>['GPON ONU 1GE','🌐','ONU'],'mini-ups-12v'=>['12V Mini DC UPS','🔋','Mini UPS'],'fiber-drop-cable'=>['Fiber Optic Drop Cable','🧵','Fiber Optic'],'patch-cord'=>['SC-SC Fiber Patch Cord','🔌','Accessories'],'fast-connector'=>['SC Fast Connector','🧩','Accessories'],'poe-adapter'=>['PoE Power Adapter','⚡','Accessories'],'mikrotik-router'=>['MikroTik Router','📶','Routers']])
@php($p=$items[$slug] ?? ['Networking Product','📦','Accessories'])
<main class="wrap"><div class="page-head"><p class="muted"><a href="{{ route('home') }}">Home</a> / <a href="{{ route('categories') }}">Products</a> / {{ $p[0] }}</p><h1>{{ $p[0] }}</h1></div><section class="panel"><div class="visual" style="height:220px;font-size:80px">{{ $p[1] }}</div><span class="eyebrow">{{ $p[2] }}</span><h2>{{ $p[0] }}</h2><p class="price">Price on request</p><p class="muted">Contact the store to confirm model, connector type, speed, power rating, compatibility and stock before ordering.</p><button class="btn gold" onclick="addCart('{{ $slug }}')">Add to Cart</button></section></main>
@endsection
