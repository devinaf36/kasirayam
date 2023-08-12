<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('category_id');
            $table->string('product_name')->length(50);
            $table->string('product_code')->length(7)->unique()->nullable();
            $table->string('product_barcode_symbology')->nullable();
            $table->integer('product_quantity')->length(4);
            $table->integer('product_cost')->length(11);
            $table->integer('product_price')->length(11);
            $table->string('product_unit')->length(4)->nullable();
            $table->integer('product_stock_alert')->length(2);
            $table->integer('product_order_tax')->nullable();
            $table->tinyInteger('product_tax_type')->nullable();
            $table->text('product_note')->nullable();
            $table->foreign('category_id')->references('id')->on('categories')->restrictOnDelete();
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
        Schema::dropIfExists('products');
    }
}
