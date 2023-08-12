<?php

namespace App\Providers;

use Dompdf\Dompdf;
use Illuminate\Support\ServiceProvider;

class DompdfServiceProvider extends ServiceProvider
{
    /**
     * Register services.
     *
     * @return void
     */
    public function register()
    {
        $this->app->bind(Dompdf::class, function ($app) {
            $dompdf = new Dompdf();
            // Add any configuration or customization here if needed
            return $dompdf;
        });
    }

    /**
     * Bootstrap services.
     *
     * @return void
     */
    public function boot()
    {
        //
    }
}
