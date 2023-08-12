<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateQuotationDetailsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('quotation_details', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('quotation_id')->length(8);
            $table->unsignedBigInteger('product_id')->length(8)->nullable();
            $table->string('product_name')->length(50);
            $table->string('product_code')->length(4);
            $table->integer('quantity')->length(4);
            $table->integer('price')->length(11);
            $table->integer('unit_price')->length(11);
            $table->integer('sub_total')->length(11);
            $table->integer('product_discount_amount')->length(11);
            $table->string('product_discount_type')->length(50)->default('fixed');
            $table->integer('product_tax_amount')->length(11);
            $table->foreign('quotation_id')->references('id')
                ->on('quotations')->cascadeOnDelete();
            $table->foreign('product_id')->references('id')
                ->on('products')->nullOnDelete();
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
        Schema::dropIfExists('quotation_details');
    }
}
