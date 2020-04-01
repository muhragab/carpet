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
            $table->bigIncrements('id');
            $table->unsignedBigInteger('category_id')->index()->nullable();
            $table->unsignedBigInteger('sub_category_id')->index()->nullable();
            $table->unsignedBigInteger('type_id')->index()->nullable();
            $table->unsignedBigInteger('color_id')->index()->nullable();
            $table->unsignedBigInteger('plotter_id')->index()->nullable();
            $table->string('name');
            $table->string('image_path')->nullable();
            $table->float('sizes_length');
            $table->float('sizes_width');
            $table->integer('average_demand_limit')->nullable();
            $table->integer('maximum_demand_limit')->nullable();
            $table->decimal('price_meter', 8, 2)->nullable();
            $table->timestamps();
            $table->foreign('category_id')->references('id')->on('categories')->onDelete('set null');
            $table->foreign('sub_category_id')->references('id')->on('categories')->onDelete('set null');
            $table->foreign('type_id')->references('id')->on('product_types')->onDelete('set null');
            $table->foreign('color_id')->references('id')->on('product_colors')->onDelete('set null');
            $table->foreign('plotter_id')->references('id')->on('product_plotters')->onDelete('set null');
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
