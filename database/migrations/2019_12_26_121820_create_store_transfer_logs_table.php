<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateStoreTransferLogsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('store_transfer_logs', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('store_from_id')->index()->nullable();
            $table->unsignedBigInteger('store_to_id')->index()->nullable();
            $table->unsignedBigInteger('product_id')->index()->nullable();
            $table->integer('number')->default(0);
            $table->enum('acceptance', ['pending', 'yes', 'no'])->default('pending');
            $table->date('transfer_date')->nullable();
            $table->timestamps();

            $table->foreign('store_from_id')
                ->references('id')
                ->on('stores')
                ->onDelete('cascade');

            $table->foreign('store_to_id')
                ->references('id')
                ->on('stores')
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
        Schema::dropIfExists('store_transfer_logs');
    }
}
