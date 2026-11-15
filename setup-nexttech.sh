#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")" && pwd)"
APP="$ROOT/laravel-app"

if [ ! -f "$APP/artisan" ]; then
  echo "Laravel app not found at: $APP"
  exit 1
fi

mkdir -p "$APP/resources/views"

cat > "$APP/resources/views/welcome.blade.php" <<'BLADE'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="theme-color" content="#101b2d">
    <title>Next Tech | The Future, Solved.</title>
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; }
        html { scroll-behavior: smooth; }
        body { font-family: Arial, sans-serif; background: #f6f7f9; color: #172033; padding-bottom: 82px; }
        a, button { color: inherit; font: inherit; }
        a { text-decoration: none; }
        button { cursor: pointer; }
        .site-header { height: 76px; background: #fff; border-bottom: 1px solid #e9e5dc; display: flex; align-items: center; justify-content: space-between; padding: 0 18px; position: sticky; top: 0; z-index: 10; }
        .icon-link { width: 40px; height: 42px; display: grid; place-items: center; border: 0; background: transparent; }
        .icon { width: 25px; height: 25px; stroke: currentColor; fill: none; stroke-width: 1.8; stroke-linecap: round; stroke-linejoin: round; }
        .brand { position: absolute; left: 50%; transform: translateX(-50%); display: flex; flex-direction: column; align-items: center; line-height: 1; white-space: nowrap; }
        .brand-main { color: #172033; font-family: Georgia, 'Times New Roman', serif; font-size: 25px; font-weight: 700; letter-spacing: 3px; }
        .brand-main span { color: #b58b45; }
        .brand-tag { margin-top: 5px; color: #8a7657; font-size: 8px; letter-spacing: 2.2px; text-transform: uppercase; }
        .wishlist { margin-left: auto; color: #172033; position: relative; }
        main { width: min(1100px, 100%); margin: auto; padding: 22px 17px; }
        .hero { min-height: 225px; padding: 34px 24px; border-radius: 18px; color: #fff; background: linear-gradient(130deg, #101b2d, #203e60); display: flex; flex-direction: column; justify-content: center; gap: 12px; }
        .eyebrow { color: #d7bd8b; font-size: 10px; font-weight: 700; letter-spacing: 2.5px; }
        .hero h1 { font-family: Georgia, serif; font-size: clamp(29px, 6vw, 44px); line-height: 1.12; font-weight: 500; }
        .hero p { color: #e2e7ed; font-size: 14px; line-height: 1.6; }
        .search { margin: 21px 0 25px; padding: 14px 16px; border: 1px solid #e7e8eb; border-radius: 12px; background: #fff; color: #8b96a5; }
        .section-title { font-family: Georgia, serif; font-size: 21px; font-weight: 600; margin: 24px 0 14px; }
        .categories { display: flex; flex-wrap: wrap; gap: 9px; }
        .category { padding: 10px 15px; border: 1px solid #e6e1d7; border-radius: 22px; background: #fff; font-size: 13px; }
        .products { display: grid; grid-template-columns: repeat(2, minmax(0, 1fr)); gap: 12px; }
        .product { padding: 12px; background: #fff; border: 1px solid #e9e7e2; border-radius: 13px; }
        .product-image { height: 115px; margin-bottom: 11px; border-radius: 9px; background: #f0f2f5; display: grid; place-items: center; font-size: 36px; }
        .product h3 { font-size: 14px; margin-bottom: 7px; }
        .product p { color: #a17b3e; font-size: 13px; font-weight: 700; }
        .bottom-nav { position: fixed; bottom: 0; left: 0; width: 100%; height: 72px; padding-bottom: env(safe-area-inset-bottom); background: #fff; border-top: 1px solid #e8e5df; display: flex; justify-content: space-around; align-items: center; z-index: 20; }
        .nav-item { min-width: 62px; border: 0; background: transparent; display: flex; flex-direction: column; align-items: center; gap: 4px; color: #89909a; font-size: 11px; }
        .nav-item.active { color: #a17b3e; }
        .nav-item .icon { width: 23px; height: 23px; }
        .nav-item.active .icon { stroke-width: 2.2; }
        .overlay { position: fixed; inset: 0; background: rgba(12, 20, 32, .48); display: none; align-items: flex-end; justify-content: center; z-index: 50; }
        .overlay.open { display: flex; }
        .sheet { width: min(100%, 520px); background: #fff; border-radius: 20px 20px 0 0; padding: 22px 20px calc(24px + env(safe-area-inset-bottom)); box-shadow: 0 -10px 40px rgba(0,0,0,.15); }
        .sheet-top { display: flex; justify-content: space-between; align-items: center; margin-bottom: 14px; }
        .sheet h2 { font-family: Georgia, serif; font-size: 22px; }
        .close-sheet { border: 0; background: #f1f2f4; width: 34px; height: 34px; border-radius: 50%; font-size: 20px; }
        .sheet p { color: #697386; line-height: 1.6; font-size: 14px; }
        .sheet-action { display: inline-block; margin-top: 16px; padding: 11px 17px; background: #172033; color: #fff; border: 0; border-radius: 9px; }
        @media (min-width: 700px) {
            body { padding-bottom: 0; }
            .products { grid-template-columns: repeat(4, minmax(0, 1fr)); }
            .hero { padding: 50px; }
            .bottom-nav { position: static; border-top: 1px solid #e8e5df; }
            .overlay { align-items: center; }
            .sheet { border-radius: 18px; }
        }
    </style>
</head>
<body>
<header class="site-header">
    <button class="icon-link" type="button" data-panel="menu" aria-label="Open menu">
        <svg class="icon" viewBox="0 0 24 24"><path d="M4 6h16M4 12h16M4 18h16"/></svg>
    </button>
    <a class="brand" href="/" aria-label="Next Tech home">
        <span class="brand-main">NEXT <span>TECH</span></span>
        <span class="brand-tag">The Future, Solved.</span>
    </a>
    <button class="icon-link wishlist" type="button" data-panel="wishlist" aria-label="Open wishlist">
        <svg class="icon" viewBox="0 0 24 24"><path d="M20.8 4.6a5.5 5.5 0 0 0-7.8 0L12 5.7l-1.1-1.1a5.5 5.5 0 0 0-7.8 7.8l1.1 1.1L12 21l7.8-7.5 1.1-1.1a5.5 5.5 0 0 0-.1-7.8Z"/></svg>
    </button>
</header>

<main id="home">
    <section class="hero">
        <span class="eyebrow">WELCOME TO NEXT TECH</span>
        <h1>The Future, Solved.</h1>
        <p>Discover technology that makes life smarter.</p>
    </section>
    <div class="search">⌕ &nbsp; Search products...</div>
    <h2 class="section-title" id="categories">Explore Categories</h2>
    <div class="categories">
        <span class="category">Smartphones</span><span class="category">Laptops</span>
        <span class="category">Accessories</span><span class="category">Gadgets</span>
    </div>
    <h2 class="section-title" id="featured">Featured Products</h2>
    <section class="products">
        <article class="product"><div class="product-image">📱</div><h3>Smartphone</h3><p>Coming soon</p></article>
        <article class="product"><div class="product-image">💻</div><h3>Laptop</h3><p>Coming soon</p></article>
        <article class="product"><div class="product-image">🎧</div><h3>Headphones</h3><p>Coming soon</p></article>
        <article class="product"><div class="product-image">⌚</div><h3>Smart Watch</h3><p>Coming soon</p></article>
    </section>
</main>

<nav class="bottom-nav" aria-label="Main navigation">
    <button class="nav-item active" type="button" data-action="home"><svg class="icon" viewBox="0 0 24 24"><path d="m3 10 9-7 9 7v10a1 1 0 0 1-1 1h-6v-7h-4v7H4a1 1 0 0 1-1-1z"/></svg><span>Home</span></button>
    <button class="nav-item" type="button" data-action="categories"><svg class="icon" viewBox="0 0 24 24"><rect x="3" y="3" width="7" height="7" rx="1"/><rect x="14" y="3" width="7" height="7" rx="1"/><rect x="3" y="14" width="7" height="7" rx="1"/><rect x="14" y="14" width="7" height="7" rx="1"/></svg><span>Categories</span></button>
    <button class="nav-item" type="button" data-action="cart"><svg class="icon" viewBox="0 0 24 24"><path d="M3 3h2l2.4 12.2a2 2 0 0 0 2 1.6h8.8a2 2 0 0 0 2-1.6L22 7H6"/><circle cx="10" cy="21" r="1"/><circle cx="18" cy="21" r="1"/></svg><span>Cart</span></button>
    <button class="nav-item" type="button" data-action="profile"><svg class="icon" viewBox="0 0 24 24"><circle cx="12" cy="8" r="4"/><path d="M4 21a8 8 0 0 1 16 0"/></svg><span>Profile</span></button>
</nav>

<div class="overlay" id="panel" role="dialog" aria-modal="true" aria-labelledby="panel-title">
    <section class="sheet">
        <div class="sheet-top"><h2 id="panel-title">Next Tech</h2><button class="close-sheet" type="button" aria-label="Close">×</button></div>
        <p id="panel-message">Welcome to Next Tech.</p>
        <button class="sheet-action" type="button" id="panel-action">Continue browsing</button>
    </section>
</div>

<script>
    const overlay = document.getElementById('panel');
    const panelTitle = document.getElementById('panel-title');
    const panelMessage = document.getElementById('panel-message');
    const panelAction = document.getElementById('panel-action');
    const panelCopy = {
        menu: ['Quick Menu', 'Explore our product categories and featured technology.'],
        wishlist: ['Your Wishlist', 'Your saved products will appear here once wishlist features are connected.'],
        cart: ['Your Shopping Cart', 'Your cart is currently empty. Product and checkout features will be added in the next development steps.'],
        profile: ['Your Account', 'Sign in and account management will be added when we build customer authentication.']
    };
    function openPanel(key) {
        const content = panelCopy[key];
        panelTitle.textContent = content[0];
        panelMessage.textContent = content[1];
        overlay.classList.add('open');
    }
    document.querySelectorAll('[data-panel]').forEach(button => {
        button.addEventListener('click', () => openPanel(button.dataset.panel));
    });
    document.querySelector('.close-sheet').addEventListener('click', () => overlay.classList.remove('open'));
    panelAction.addEventListener('click', () => overlay.classList.remove('open'));
    overlay.addEventListener('click', event => {
        if (event.target === overlay) overlay.classList.remove('open');
    });
    document.querySelectorAll('[data-action]').forEach(button => {
        button.addEventListener('click', () => {
            document.querySelectorAll('.nav-item').forEach(item => item.classList.remove('active'));
            button.classList.add('active');
            const action = button.dataset.action;
            if (action === 'home') window.scrollTo({ top: 0, behavior: 'smooth' });
            if (action === 'categories') document.getElementById('categories').scrollIntoView({ behavior: 'smooth' });
            if (action === 'cart' || action === 'profile') openPanel(action);
        });
    });
</script>
</body>
</html>
BLADE

echo "Next Tech luxury header and interactive navigation installed."
echo "Run: cd laravel-app && php artisan serve --host=0.0.0.0 --port=8000"
