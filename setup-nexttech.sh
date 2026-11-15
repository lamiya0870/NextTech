#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")" && pwd)"
APP="$ROOT/laravel-app"

if [ ! -f "$APP/artisan" ]; then
  echo "Laravel app not found at: $APP"
  echo "Make sure the Laravel project is inside NextTech/laravel-app."
  exit 1
fi

mkdir -p "$APP/resources/views"

cat > "$APP/resources/views/welcome.blade.php" <<'BLADE'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="theme-color" content="#ffffff">
    <title>Next Tech | The Future, Solved.</title>
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; }
        body { font-family: Arial, sans-serif; background: #f6f8fb; color: #172033; padding-bottom: 84px; }
        a { color: inherit; text-decoration: none; }
        .site-header { height: 68px; background: #fff; border-bottom: 1px solid #e8edf3; display: flex; align-items: center; justify-content: space-between; padding: 0 18px; position: sticky; top: 0; z-index: 10; }
        .brand { position: absolute; left: 50%; transform: translateX(-50%); color: #1677d2; font-size: 23px; font-weight: 800; white-space: nowrap; letter-spacing: -.5px; }
        .icon-link { width: 34px; height: 38px; display: grid; place-items: center; }
        .icon { width: 25px; height: 25px; stroke: currentColor; fill: none; stroke-width: 1.9; stroke-linecap: round; stroke-linejoin: round; }
        .wishlist { margin-left: auto; color: #172033; }
        main { width: min(1100px, 100%); margin: auto; padding: 22px 17px; }
        .hero { min-height: 220px; padding: 32px 24px; border-radius: 18px; color: #fff; background: linear-gradient(130deg, #102b4e, #1677d2); display: flex; flex-direction: column; justify-content: center; gap: 12px; }
        .eyebrow { color: #c9e4ff; font-size: 11px; font-weight: 700; letter-spacing: 2px; }
        .hero h1 { font-size: clamp(28px, 6vw, 43px); line-height: 1.12; }
        .hero p { color: #e1efff; font-size: 14px; line-height: 1.6; }
        .search { margin: 21px 0 25px; padding: 14px 16px; border: 1px solid #e5eaf0; border-radius: 12px; background: #fff; color: #8b96a5; }
        .section-title { font-size: 19px; margin: 24px 0 14px; }
        .categories { display: flex; flex-wrap: wrap; gap: 9px; }
        .category { padding: 10px 15px; border: 1px solid #e5eaf0; border-radius: 22px; background: #fff; font-size: 13px; }
        .products { display: grid; grid-template-columns: repeat(2, minmax(0, 1fr)); gap: 12px; }
        .product { padding: 12px; background: #fff; border: 1px solid #e9edf2; border-radius: 13px; }
        .product-image { height: 115px; margin-bottom: 11px; border-radius: 9px; background: #edf4fb; display: grid; place-items: center; font-size: 36px; }
        .product h3 { font-size: 14px; margin-bottom: 7px; }
        .product p { color: #1677d2; font-size: 13px; font-weight: 700; }
        .bottom-nav { position: fixed; bottom: 0; left: 0; width: 100%; height: 72px; padding-bottom: env(safe-area-inset-bottom); background: #fff; border-top: 1px solid #e7ebf0; display: flex; justify-content: space-around; align-items: center; z-index: 20; }
        .nav-item { min-width: 62px; display: flex; flex-direction: column; align-items: center; gap: 4px; color: #7d8795; font-size: 11px; }
        .nav-item.active { color: #1677d2; }
        .nav-item .icon { width: 23px; height: 23px; }
        @media (min-width: 700px) {
            body { padding-bottom: 0; }
            .products { grid-template-columns: repeat(4, minmax(0, 1fr)); }
            .hero { padding: 50px; }
            .bottom-nav { position: static; border-top: 1px solid #e7ebf0; }
        }
    </style>
</head>
<body>
<header class="site-header">
    <a class="icon-link" href="#" aria-label="Open menu">
        <svg class="icon" viewBox="0 0 24 24"><path d="M4 6h16M4 12h16M4 18h16"/></svg>
    </a>
    <a class="brand" href="/">Next Tech</a>
    <a class="icon-link wishlist" href="#" aria-label="Wishlist">
        <svg class="icon" viewBox="0 0 24 24"><path d="M20.8 4.6a5.5 5.5 0 0 0-7.8 0L12 5.7l-1.1-1.1a5.5 5.5 0 0 0-7.8 7.8l1.1 1.1L12 21l7.8-7.5 1.1-1.1a5.5 5.5 0 0 0-.1-7.8Z"/></svg>
    </a>
</header>

<main>
    <section class="hero">
        <span class="eyebrow">WELCOME TO NEXT TECH</span>
        <h1>The Future, Solved.</h1>
        <p>Discover technology that makes life smarter.</p>
    </section>

    <div class="search">⌕ &nbsp; Search products...</div>

    <h2 class="section-title">Categories</h2>
    <div class="categories">
        <span class="category">Smartphones</span>
        <span class="category">Laptops</span>
        <span class="category">Accessories</span>
        <span class="category">Gadgets</span>
    </div>

    <h2 class="section-title">Featured Products</h2>
    <section class="products">
        <article class="product"><div class="product-image">📱</div><h3>Smartphone</h3><p>Coming soon</p></article>
        <article class="product"><div class="product-image">💻</div><h3>Laptop</h3><p>Coming soon</p></article>
        <article class="product"><div class="product-image">🎧</div><h3>Headphones</h3><p>Coming soon</p></article>
        <article class="product"><div class="product-image">⌚</div><h3>Smart Watch</h3><p>Coming soon</p></article>
    </section>
</main>

<nav class="bottom-nav" aria-label="Main navigation">
    <a class="nav-item active" href="#"><svg class="icon" viewBox="0 0 24 24"><path d="m3 10 9-7 9 7v10a1 1 0 0 1-1 1h-6v-7h-4v7H4a1 1 0 0 1-1-1z"/></svg><span>Home</span></a>
    <a class="nav-item" href="#"><svg class="icon" viewBox="0 0 24 24"><rect x="3" y="3" width="7" height="7" rx="1"/><rect x="14" y="3" width="7" height="7" rx="1"/><rect x="3" y="14" width="7" height="7" rx="1"/><rect x="14" y="14" width="7" height="7" rx="1"/></svg><span>Categories</span></a>
    <a class="nav-item" href="#"><svg class="icon" viewBox="0 0 24 24"><path d="M3 3h2l2.4 12.2a2 2 0 0 0 2 1.6h8.8a2 2 0 0 0 2-1.6L22 7H6"/><circle cx="10" cy="21" r="1"/><circle cx="18" cy="21" r="1"/></svg><span>Cart</span></a>
    <a class="nav-item" href="#"><svg class="icon" viewBox="0 0 24 24"><circle cx="12" cy="8" r="4"/><path d="M4 21a8 8 0 0 1 16 0"/></svg><span>Profile</span></a>
</nav>
</body>
</html>
BLADE

echo "Next Tech homepage file created: $APP/resources/views/welcome.blade.php"
echo "Next: cd laravel-app && php artisan serve --host=0.0.0.0 --port=8000"
