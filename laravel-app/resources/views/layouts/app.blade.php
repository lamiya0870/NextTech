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
