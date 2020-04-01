<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSaleItemsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('sale_items', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('sale_id')->index()->nullable();
            $table->unsignedBigInteger('product_id')->index()->nullable();
            $table->integer('number');
            $table->decimal('price', 8, 2)->nullable();
            $table->decimal('total_price', 8, 2)->nullable();
            $table->timestamps();

            $table->foreign('sale_id')
                ->references('id')
                ->on('sales')
                ->onDelete('cascade');

            $table->foreign('product_id')
                ->references('id')
                ->on('products')
                ->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('sale_items');
    }
}
