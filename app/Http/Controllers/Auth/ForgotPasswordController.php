<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\SendsPasswordResetEmails;

class ForgotPasswordController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Kontroler Reset Kata Sandi
    |--------------------------------------------------------------------------
    |
    | Kontroler ini bertanggung jawab untuk menangani email reset kata sandi dan
    | menyertakan trait yang membantu mengirim notifikasi ini dari
    | aplikasi Anda ke pengguna. Silakan jelajahi trait ini jika perlu.
    |
    */

    use SendsPasswordResetEmails;
}
