<head>

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
    @stack('styles')
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
        /* Global responsive helpers for user dashboard */
        img, .img-profile, .table img { max-width: 100%; height: auto; display: block; }
        iframe, embed, video { max-width: 100%; height: auto; }
        table { width: 100%; display: block; overflow-x: auto; }
        </style>
</head>