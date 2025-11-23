<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\Schema;
class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        Schema::defaultStringLength(191);
            // Global helper for formatting currency to Indonesian Rupiah
            if (! function_exists('formatRupiah')) {
                function formatRupiah($value)
                {
                    if ($value === null || $value === '') return '-';
                    return 'Rp '.number_format($value, 0, ',', '.');
                }
            }

    }
}
