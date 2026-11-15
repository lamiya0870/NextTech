@extends('layouts.app')
@section('title','Categories')
@section('content')
<main class="wrap"><div class="page-head"><h1>Shop Categories</h1><p class="muted">Find the right equipment for your network.</p></div><div class="cats">@foreach(['Routers','ONU','Mini UPS','Fiber Optic','Accessories'] as $cat)<a class="chip" href="#{{ Str::slug($cat) }}">{{ $cat }}</a>@endforeach</div>
@foreach(['Routers'=>[['Dual Band Wi-Fi Router','📡','router-dual-band'],['MikroTik Router','📶','mikrotik-router']],'ONU'=>[['GPON ONU 1GE','🌐','gpon-onu']],'Mini UPS'=>[['12V Mini DC UPS','🔋','mini-ups-12v']],'Fiber Optic'=>[['Fiber Optic Drop Cable','🧵','fiber-drop-cable']],'Accessories'=>[['SC-SC Fiber Patch Cord','🔌','patch-cord'],['SC Fast Connector','🧩','fast-connector'],['PoE Power Adapter','⚡','poe-adapter']]] as $cat=>$items)
<h2 class="section-title" id="{{ Str::slug($cat) }}">{{ $cat }}</h2><section class="grid">@foreach($items as $p)<article class="card"><div class="visual">{{ $p[1] }}</div><h3>{{ $p[0] }}</h3><p class="price">Price on request</p><div class="actions"><a class="btn" href="{{ route('product',$p[2]) }}">Details</a><button class="btn gold" data-add="{{ $p[2] }}">Add to Cart</button></div></article>@endforeach</section>@endforeach</main>
@endsection
