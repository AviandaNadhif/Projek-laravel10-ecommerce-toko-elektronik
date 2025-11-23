<!DOCTYPE html>
<html lang="en">
  <link rel="shortcut icon" href="{{ asset('favicon.png') }}" type="image/png">
  <link rel="icon" type="image/png" href="{{ asset('images/favicon-32x32.png') }}" sizes="32x32">
  <link rel="icon" type="image/png" href="{{ asset('images/favicon-16x16.png') }}" sizes="16x16">
  <link rel="apple-touch-icon" sizes="180x180" href="{{ asset('images/apple-touch-icon.png') }}">
  <meta name="msapplication-TileColor" content="#ffffff">
  <meta name="msapplication-TileImage" content="{{ asset('images/ms-icon-144x144.png') }}">
@include('backend.layouts.head')

<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
    @include('backend.layouts.sidebar')
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
        @include('backend.layouts.header')
        <!-- End of Topbar -->

        <!-- Begin Page Content -->
        @yield('main-content')
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->
      @include('backend.layouts.footer')

</body>

</html>
