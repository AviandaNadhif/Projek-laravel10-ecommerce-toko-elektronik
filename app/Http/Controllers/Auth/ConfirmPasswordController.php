<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Providers\RouteServiceProvider;
use Illuminate\Foundation\Auth\ConfirmsPasswords;

class ConfirmPasswordController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Kontroler Konfirmasi Kata Sandi
    |--------------------------------------------------------------------------
    |
    | Kontroler ini bertanggung jawab untuk menangani konfirmasi kata sandi dan
    | menggunakan trait sederhana untuk menyertakan perilaku tersebut. Anda bebas
    | untuk menjelajahi trait ini dan menimpa fungsi apa pun yang memerlukan kustomisasi.
    |
    */

    use ConfirmsPasswords;

    /**
     * Kemana mengarahkan pengguna ketika URL yang dimaksud gagal.
     *
     * @var string
     */
    protected $redirectTo = RouteServiceProvider::HOME;

    /**
     * Membuat instance controller baru.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }
}
