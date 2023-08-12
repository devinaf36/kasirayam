<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateSalesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('sales', function (Blueprint $table) {
            $table->id();
            $table->date('date');
            $table->string('reference')->length(11);
            $table->unsignedBigInteger('customer_id')->length(8)->nullable();
            $table->string('customer_name')->length(50);
            $table->integer('tax_percentage')->length(3)->default(0);
            $table->integer('tax_amount')->length(11)->default(0);
            $table->integer('discount_percentage')->length(3)->default(0);
            $table->integer('discount_amount')->length(11)->default(0);
            $table->integer('shipping_amount')->length(11)->default(0);
            $table->integer('total_amount')->length(11);
            $table->integer('paid_amount')->length(11);
            $table->integer('due_amount')->length(11);
            $table->string('status')->length(10);
            $table->string('payment_status')->length(15);
            $table->string('payment_method')->length(15);
            $table->text('note')->nullable();
            $table->foreign('customer_id')->references('id')->on('customers')->nullOnDelete();
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
        Schema::dropIfExists('sales');
    }
}
