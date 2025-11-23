<?php

namespace App\Models;

use App\User as BaseUser;

class User extends BaseUser
{
    /**
     * Hitung pengguna dengan status aktif.
     * @return int
     */
    public static function countActiveUser()
    {
        return self::where('status', 'active')->count();
    }

    /**
     * Placeholder: tambahkan helper lain yang diperlukan di view atau controller.
     */
}
