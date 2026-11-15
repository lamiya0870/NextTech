<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="theme-color" content="#101b2d">
<title>@yield('title', 'Dashboard') · Next Tech Admin</title>
<style>
*{box-sizing:border-box}body{margin:0;background:#f3f5f8;color:#172033;font-family:Arial,sans-serif}a{text-decoration:none;color:inherit}button,input,textarea,select{font:inherit}.shell{min-height:100vh;display:grid;grid-template-columns:245px 1fr}.side{background:#101b2d;color:#e8edf5;padding:24px 16px}.logo{font:700 22px Georgia,serif;letter-spacing:2px;padding:8px 10px 28px}.logo span{color:#c5a66f}.nav-label{font-size:10px;letter-spacing:2px;color:#8996a8;padding:12px}.nav a{display:block;padding:13px 14px;border-radius:9px;color:#c6cfdb;margin:4px 0;font-size:14px}.nav a.active,.nav a:hover{background:#243750;color:#fff}.main{min-width:0}.top{height:70px;background:#fff;border-bottom:1px solid #e5e8ed;display:flex;align-items:center;justify-content:space-between;padding:0 26px}.content{padding:28px;max-width:1200px;margin:auto}.title{font:500 30px Georgia,serif;margin:0 0 7px}.muted{color:#788292;font-size:13px}.cards{display:grid;grid-template-columns:repeat(3,minmax(0,1fr));gap:15px;margin:22px 0}.stat,.panel{background:#fff;border:1px solid #e6e9ee;border-radius:14px;padding:19px}.stat small{color:#778397}.stat strong{display:block;font-size:28px;margin-top:9px}.btn{display:inline-block;border:0;border-radius:8px;background:#15263b;color:#fff;padding:11px 15px;font-size:13px;font-weight:700;cursor:pointer}.btn.gold{background:#c5a66f;color:#172033}.btn.red{background:#a83e3e}.table-wrap{overflow:auto}table{width:100%;border-collapse:collapse;min-width:570px}th,td{text-align:left;padding:13px 10px;border-bottom:1px solid #edf0f3;font-size:13px}th{color:#7c8797;font-weight:600}.field{display:block;width:100%;padding:12px;border:1px solid #dce1e8;border-radius:8px;margin:7px 0 15px;background:white}.label{font-size:12px;font-weight:700}.grid2{display:grid;grid-template-columns:1fr 1fr;gap:12px}.alert{padding:12px 15px;border-radius:9px;background:#eef7ef;color:#246536;margin-bottom:15px;font-size:13px}.error{color:#b42318;font-size:12px}.actions{display:flex;gap:8px;align-items:center}.pagination{padding-top:15px}.pagination nav{display:flex;justify-content:space-between}.thumb{width:42px;height:42px;border-radius:8px;object-fit:cover;background:#eef1f5}@media(max-width:760px){.shell{grid-template-columns:1fr}.side{padding:12px;position:static}.logo{padding:8px 10px 12px}.nav{display:flex;overflow:auto;gap:4px}.nav-label{display:none}.nav a{white-space:nowrap;padding:10px}.top{height:58px;padding:0 15px}.content{padding:18px 13px}.cards{grid-template-columns:1fr 1fr}.grid2{grid-template-columns:1fr}.title{font-size:25px}}@media(max-width:420px){.cards{grid-template-columns:1fr}}
</style>
</head>
<body><div class="shell">
<aside class="side"><div class="logo">NEXT <span>TECH</span></div><div class="nav-label">WORKSPACE</div><nav class="nav">
<a class="{{ request()->routeIs('admin.dashboard')?'active':'' }}" href="{{ route('admin.dashboard') }}">▦ &nbsp; Overview</a>
<a class="{{ request()->routeIs('admin.products.*')?'active':'' }}" href="{{ route('admin.products.index') }}">▣ &nbsp; Products</a>
<a href="#" onclick="alert('Category management is the next module.')">◈ &nbsp; Categories</a>
<a href="#" onclick="alert('Order management is the next module.')">▤ &nbsp; Orders</a>
</nav></aside>
<section class="main"><header class="top"><strong>@yield('top-title','Admin Dashboard')</strong><form method="POST" action="{{ route('admin.logout') }}">@csrf<button class="btn" type="submit">Sign out</button></form></header>
<main class="content">@if(session('success'))<div class="alert">{{ session('success') }}</div>@endif @yield('content')</main></section>
</div></body></html>
