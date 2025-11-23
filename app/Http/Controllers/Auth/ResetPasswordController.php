<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Providers\RouteServiceProvider;
use Illuminate\Foundation\Auth\ResetsPasswords;

class ResetPasswordController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Kontroler Reset Kata Sandi
    |--------------------------------------------------------------------------
    |
    | Kontroler ini bertanggung jawab untuk menangani permintaan reset kata sandi
    | dan menggunakan trait sederhana untuk menyertakan perilaku ini. Anda bebas
    | untuk menjelajahi trait ini dan menimpa metode apa pun yang ingin Anda sesuaikan.
    |
    */

    use ResetsPasswords;

    /**
     * Kemana mengarahkan pengguna setelah mereset kata sandi mereka.
     *
     * @var string
     */
    protected $redirectTo = RouteServiceProvider::HOME;
}
