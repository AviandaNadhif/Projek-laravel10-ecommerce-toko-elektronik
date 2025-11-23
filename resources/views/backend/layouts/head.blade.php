<head>
    <link rel="shortcut icon" href="{{ asset('favicon.png') }}" type="image/png">
    <link rel="icon" type="image/png" href="{{ asset('images/backend-favicon-32x32.png') }}" sizes="32x32">
    <link rel="icon" type="image/png" href="{{ asset('images/backend-favicon-16x16.png') }}" sizes="16x16">
    <link rel="apple-touch-icon" sizes="180x180" href="{{ asset('images/backend-apple-touch-icon.png') }}">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="msapplication-TileImage" content="{{ asset('images/backend-ms-icon-144x144.png') }}">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>Dasbor</title>
  
    <!-- Custom fonts for this template-->
    <link href="{{asset('backend/vendor/fontawesome-free/css/all.min.css')}}" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
  
    <!-- Custom styles for this template-->
    <link href="{{asset('backend/css/sb-admin-2.min.css')}}" rel="stylesheet">
        <style>
        /* Pagination sizing override to prevent oversized arrows from theme or icon fonts */
        .pagination .page-link {
            padding: .375rem .55rem;
            font-size: .9rem;
            line-height: 1.25;
        }
        .pagination .page-item .page-link .fa,
        .pagination .page-item .page-link i {
            font-size: 1rem; /* normalize font-awesome icon size inside links */
            vertical-align: middle;
        }
        .pagination .page-link svg {
            width: 1em;
            height: 1em;
            vertical-align: middle;
        }
        /* Ensure container alignment */
        .pagination {
            display: inline-flex;
            margin: 0;
        }
        /* Hide DataTables length menu ("Show entries") globally in backend */
        div.dataTables_wrapper div.dataTables_length,
        .dataTables_length {
            display: none !important;
        }
        </style>
    <script>
        // Backend: convert USD prices to IDR for display only
        document.addEventListener('DOMContentLoaded', function () {
            try {
                var USD_TO_IDR = window.USD_TO_IDR || 15000; // set your rate here
                var idrFormatter = new Intl.NumberFormat('id-ID', { style: 'currency', currency: 'IDR' });

                var walker = document.createTreeWalker(document.body, NodeFilter.SHOW_TEXT, null, false);
                var node;
                var textNodes = [];
                while (node = walker.nextNode()) {
                    // skip text nodes inside script, style, code, pre, textarea
                    var parent = node.parentElement;
                    if (!parent) continue;
                    var tag = parent.tagName.toLowerCase();
                    if (['script','style','code','pre','textarea'].indexOf(tag) !== -1) continue;
                    if (!node.nodeValue || !node.nodeValue.trim()) continue;
                    textNodes.push(node);
                }

                textNodes.forEach(function(tn){
                    var text = tn.nodeValue;
                    var newText = text.replace(/\$\s*([0-9\.,]+)/g, function(match, num){
                        var parsed = parseFloat(num.replace(/,/g, ''));
                        if (isNaN(parsed)) return match;
                        return idrFormatter.format(parsed * USD_TO_IDR);
                    });
                    if (newText !== text) tn.nodeValue = newText;
                });

                // placeholders
                document.querySelectorAll('input[placeholder], textarea[placeholder]').forEach(function(el){
                    var ph = el.getAttribute('placeholder');
                    if (!ph) return;
                    ph = ph.replace(/\$\s*([0-9\.,]+)/g, function(match, num){
                        var parsed = parseFloat(num.replace(/,/g, ''));
                        if (isNaN(parsed)) return match;
                        return idrFormatter.format(parsed * USD_TO_IDR);
                    });
                    el.setAttribute('placeholder', ph);
                });

            } catch (e) {
                console.error('Backend currency script error:', e);
            }
        });
    </script>
    @stack('styles')
  
</head>