<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

class UpdateOrdersPaymentMethods extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        // Add new enum values and a bank column. Use raw statements to avoid DBAL dependency.
        // Adjust enum values to include additional gateways: bank, dana, gopay
        DB::statement("ALTER TABLE `orders` MODIFY `payment_method` ENUM('cod','paypal','bank','dana','gopay') NOT NULL DEFAULT 'cod'");
        // Ensure payment_status enum uses lowercase 'paid'/'unpaid'
        DB::statement("ALTER TABLE `orders` MODIFY `payment_status` ENUM('paid','unpaid') NOT NULL DEFAULT 'unpaid'");
        // Add bank column if it doesn't exist
        $schema = DB::select("SHOW COLUMNS FROM `orders` LIKE 'bank'");
        if(empty($schema)){
            DB::statement("ALTER TABLE `orders` ADD `bank` VARCHAR(191) NULL AFTER `payment_method`");
        }
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        // Revert enum and drop bank column. Be careful: reverting enum removes extra options.
        DB::statement("ALTER TABLE `orders` MODIFY `payment_method` ENUM('cod','paypal', 'bank','dana','gopay' ) NOT NULL DEFAULT 'cod'");
        DB::statement("ALTER TABLE `orders` MODIFY `payment_status` ENUM('paid','unpaid') NOT NULL DEFAULT 'unpaid'");
        $schema = DB::select("SHOW COLUMNS FROM `orders` LIKE 'bank'");
        if(!empty($schema)){
            DB::statement("ALTER TABLE `orders` DROP COLUMN `bank`");
        }
    }
}
