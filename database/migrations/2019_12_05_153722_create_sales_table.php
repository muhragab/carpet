<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

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
            $table->bigIncrements('id');
            $table->integer('sale_man')->nullable();
            $table->unsignedBigInteger('supplier_id')->index()->nullable();
            $table->unsignedBigInteger('inventorie_id')->index()->nullable();
            $table->integer('permission_number')->nullable();
            $table->decimal('price', 8, 2)->nullable();
            $table->integer('taxes')->nullable();
            $table->integer('discount')->nullable();
            $table->string('date');
            $table->string('allMeters');
            $table->decimal('priceFinal', 8, 2)->nullable();
            $table->decimal('finalPrice', 8, 2)->nullable();
            $table->timestamps();

            $table->foreign('supplier_id')
                ->references('id')
                ->on('suppliers')
                ->onDelete('cascade');

            $table->foreign('inventorie_id')
                ->references('id')
                ->on('inventories')
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
        Schema::dropIfExists('sales');
    }
}
