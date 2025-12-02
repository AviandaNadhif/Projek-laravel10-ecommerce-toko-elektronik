<!-- Meta Tag -->
@yield('meta')
<!-- Title Tag  -->
<title>@yield('title')</title>
<!-- Favicon and app icons -->
<link rel="shortcut icon" href="{{ asset('favicon.png') }}" type="image/png" sizes="32x32">
<link rel="icon" type="image/png" href="{{ asset('images/favicon-32x32.png') }}" sizes="32x32">
<link rel="icon" type="image/png" href="{{ asset('images/favicon-16x16.png') }}" sizes="16x16">
<link rel="apple-touch-icon" sizes="180x180" href="{{ asset('images/apple-touch-icon.png') }}">
<link rel="manifest" href="{{ asset('manifest.json') }}">
<meta name="theme-color" content="#ffffff">
<meta name="msapplication-TileColor" content="#ffffff">
<meta name="msapplication-TileImage" content="{{ asset('images/ms-icon-144x144.png') }}">
<!-- Viewport for responsive scaling -->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<!-- Web Font -->
<link href="https://fonts.googleapis.com/css?family=Poppins:200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&display=swap" rel="stylesheet">

<!-- StyleSheet -->
<link rel="manifest" href="/manifest.json">
<!-- Bootstrap -->
<link rel="stylesheet" href="{{asset('frontend/css/bootstrap.css')}}">
<!-- Magnific Popup -->
<link rel="stylesheet" href="{{asset('frontend/css/magnific-popup.min.css')}}">
<!-- Font Awesome -->
<link rel="stylesheet" href="{{asset('frontend/css/font-awesome.css')}}">
<!-- Fancybox -->
<link rel="stylesheet" href="{{asset('frontend/css/jquery.fancybox.min.css')}}">
<!-- Themify Icons -->
<link rel="stylesheet" href="{{asset('frontend/css/themify-icons.css')}}">
<!-- Nice Select CSS -->
<link rel="stylesheet" href="{{asset('frontend/css/niceselect.css')}}">
<!-- Animate CSS -->
<link rel="stylesheet" href="{{asset('frontend/css/animate.css')}}">
<!-- Flex Slider CSS -->
<link rel="stylesheet" href="{{asset('frontend/css/flex-slider.min.css')}}">
<!-- Owl Carousel -->
<link rel="stylesheet" href="{{asset('frontend/css/owl-carousel.css')}}">
<!-- Slicknav -->
<link rel="stylesheet" href="{{asset('frontend/css/slicknav.min.css')}}">
<!-- Jquery Ui -->
<link rel="stylesheet" href="{{asset('frontend/css/jquery-ui.css')}}">

<!-- Eshop StyleSheet -->
<link rel="stylesheet" href="{{asset('frontend/css/reset.css')}}">
<link rel="stylesheet" href="{{asset('frontend/css/style.css')}}">
<link rel="stylesheet" href="{{asset('frontend/css/responsive.css')}}">
<!-- ShareThis script removed to prevent injected sticky share buttons -->
<style>
    /* Multilevel dropdown */
    .dropdown-submenu {
    position: relative;
    }

    .dropdown-submenu>a:after {
    content: "\f0da";
    float: right;
    border: none;
    font-family: 'FontAwesome';
    }

    .dropdown-submenu>.dropdown-menu {
    top: 0;
    left: 100%;
    margin-top: 0px;
    margin-left: 0px;
    }
</style>
<style>
    /* Global responsive helpers */
    img, .product-img img, .cart-img img, .logo img { max-width: 100%; height: auto; display: block; }
    iframe, embed, video { max-width: 100%; height: auto; }
    table { width: 100%; overflow-x: auto; display: block; }
    /* ensure dropdown submenu caret displays correctly */
    .dropdown-submenu > a:after { content: "\f0da"; float: right; border: none; font-family: 'FontAwesome'; }
</style>
</style>
<script>
    // Client-side quick translation and currency replacer
    document.addEventListener('DOMContentLoaded', function () {
        try {
            var translations = {
                'Shop Now': 'Belanja Sekarang',
                'Discover Now': 'Temukan Sekarang',
                'All Products': 'Semua Produk',
                'Add to cart': 'Masukkan Keranjang',
                'Add to Wishlist': 'Tambah ke Daftar Keinginan',
                'Quick Shop': 'Lihat Cepat',
                'Trending Item': 'Produk Tren',
                'Hot Item': 'Produk Terpopuler',
                'Latest Items': 'Produk Terbaru',
                'Free shiping': 'Gratis Ongkir',
                'Free Return': 'Pengembalian Gratis',
                'Sucure Payment': 'Pembayaran Aman',
                'Secure Payment': 'Pembayaran Aman',
                'Best Peice': 'Harga Terbaik',
                'Sale out': 'Habis',
                'New': 'Baru',
                'Hot': 'Hot',
                'Items': 'Item',
                'Total': 'Total',
                'Checkout': 'Bayar',
                'View Cart': 'Lihat Keranjang',
                'View Wishlist': 'Lihat Daftar Keinginan',
                'Search here...': 'Cari di sini...',
                'Quick Shop': 'Belanja Cepat',
                'Discover Now': 'Temukan Sekarang'
            };

            // Currency formatter for Indonesian Rupiah
            var USD_TO_IDR = window.USD_TO_IDR || 15000; // adjust rate here if needed
            var idrFormatter = new Intl.NumberFormat('id-ID', { style: 'currency', currency: 'IDR' });

            // Walk text nodes and replace text
            var walker = document.createTreeWalker(document.body, NodeFilter.SHOW_TEXT, null, false);
            var node;
            var textNodes = [];
            while (node = walker.nextNode()) {
                // ignore empty or whitespace-only
                if (!node.nodeValue || !node.nodeValue.trim()) continue;
                textNodes.push(node);
            }

            textNodes.forEach(function(tn){
                var text = tn.nodeValue;

                // Replace currency patterns like $123, $ 1,234.56
                var newText = text.replace(/\$\s*([0-9\.,]+)/g, function(match, num){
                    // remove thousand separators
                    var parsed = parseFloat(num.replace(/,/g, ''));
                    if (isNaN(parsed)) return match;
                    return idrFormatter.format(parsed * USD_TO_IDR);
                });

                // Replace specific phrases (case-sensitive simple replace)
                Object.keys(translations).forEach(function(key){
                    // replace all occurrences
                    var re = new RegExp(key.replace(/[.*+?^${}()|[\]\\]/g, '\\$&'), 'g');
                    newText = newText.replace(re, translations[key]);
                });

                if (newText !== text) tn.nodeValue = newText;
            });

            // Also update attributes for buttons/inputs/placeholders
            // Placeholder
            document.querySelectorAll('input[placeholder], textarea[placeholder]').forEach(function(el){
                var ph = el.getAttribute('placeholder');
                if (!ph) return;
                Object.keys(translations).forEach(function(key){
                    if (ph.indexOf(key) !== -1) ph = ph.split(key).join(translations[key]);
                });
                el.setAttribute('placeholder', ph);
            });

            // Buttons and anchors
            document.querySelectorAll('button, a, span, h1, h2, h3, h4, h5, p, label').forEach(function(el){
                if (!el.childNodes || el.childNodes.length !== 1 || el.childNodes[0].nodeType !== Node.TEXT_NODE) return;
                var txt = el.textContent.trim();
                if (!txt) return;

                // currency in text
                var replaced = txt.replace(/\$\s*([0-9\.,]+)/g, function(match, num){
                    var parsed = parseFloat(num.replace(/,/g, ''));
                    if (isNaN(parsed)) return match;
                    return idrFormatter.format(parsed);
                });

                Object.keys(translations).forEach(function(key){
                    if (replaced.indexOf(key) !== -1) replaced = replaced.split(key).join(translations[key]);
                });

                if (replaced !== txt) el.textContent = replaced;
            });

        } catch (e) {
            // fail silently — do not break the page
            console.error('Translation/currency script error:', e);
        }
    });
</script>
@stack('styles')
