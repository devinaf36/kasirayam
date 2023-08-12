<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateSettingsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('settings', function (Blueprint $table) {
            $table->id();
            $table->string('company_name')->length(50);
            $table->string('company_email')->length(50);
            $table->string('company_phone')->length(15);
            $table->string('site_logo')->nullable();
            $table->integer('default_currency_id')->length(3);
            $table->string('default_currency_position')->length(10);
            $table->string('notification_email')->length(50);
            $table->text('footer_text')->length(225);
            $table->text('company_address')->length(225);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('settings');
    }
}
