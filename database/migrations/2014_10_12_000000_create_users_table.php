<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('name');
            $table->double('longitude')->default(0);
            $table->double('latitude')->default(0);
            $table->tinyInteger('is_block')->default(0);
            $table->tinyInteger('is_login')->default(0);
            $table->tinyInteger('is_agree')->default(0);
            $table->tinyInteger('type')->default(1);
            $table->unsignedBigInteger('country_id')->nullable();
            $table->string('phone')->nullable();
            $table->string('phone_code')->nullable();
            $table->string('image')->nullable();
            $table->text('address')->nullable();
            $table->string('banner')->nullable();
            $table->string('id_image')->nullable();
            $table->string('national_id')->nullable();
            $table->string('email')->unique()->nullable();
            $table->timestamp('email_verified_at')->nullable();
            $table->string('password');
            $table->rememberToken();
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
        Schema::dropIfExists('users');
    }
}
