@extends('frontend.layouts.master')

@section('title', 'Zyntech Enterprises || Tentang Kami')

@section('main-content')

	<!-- Breadcrumbs -->
	<div class="breadcrumbs">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="bread-inner">
						<ul class="bread-list">
							<li><a href="index1.html">Home<i class="ti-arrow-right"></i></a></li>
							<li class="active"><a href="blog-single.html">Tentang Kami</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Breadcrumbs -->

	<!-- About Us -->
	<section class="about-us section">
			<div class="container">
				<div class="row">
					<div class="col-lg-6 col-12">
						<div class="about-content">
							@php
								$setting = DB::table('settings')->first();
							@endphp
							<h3>Selamat Datang di <span>{{ $setting->company_name ?? 'Zyntech Enterprises' }}</span></h3>
									@if(!empty($setting->short_des))
										<p>{!! $setting->short_des !!}</p>
									@endif
									@if(!empty($setting->description))
										<p>{!! $setting->description !!}</p>
									@endif
									<div class="button"></div>
						</div>
					</div>
					<div class="col-lg-6 col-12">
						<div class="about-img overlay">
							{{-- <div class="button">
								<a href="https://www.youtube.com/watch?v=nh2aYrGMrIE" class="video video-popup mfp-iframe"><i class="fa fa-play"></i></a>
							</div> --}}
							@if(!empty($setting->photo))
								<img src="{{ $setting->photo }}" alt="About image">
							@else
								<img src="{{asset('backend/img/logo3.jpg')}}" alt="About image">
							@endif
						</div>
					</div>
				</div>
			</div>
	</section>
	<!-- End About Us -->


	<!-- Start Shop Services Area -->

					<!-- End Single Service -->
				</div>
			</div>
		</div>
	</section>
	<!-- End Shop Services Area -->


@endsection
