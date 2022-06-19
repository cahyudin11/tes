<?php

namespace App\Http\Controllers;

use BaconQrCode\Renderer\Color\Rgb;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LoginController extends Controller
{
    public function index()
    {
        if($user = Auth::user()){
            if($user->level == '1'){
                return redirect()->intended('dashboard');
            }elseif ($user->level == '2'){
                return redirect()->intended('dashboard');
            }
        }
        return view('auth.login');
    }

    public function proses(Request $request)
    {
        $request->validate([
            'username' => 'required',
            'password' => 'required',
        ],
        [
            'username.required' => 'Username tidak boleh kosong',
            'password.required' => 'Password tidak boleh kosong',
        ]
        );
        $kredensial = $request->only('username','password');
        if (Auth::attempt($kredensial)){

            $user= Auth::user();
            if($user->level == '1'){
                return redirect()->intended('dashboard');
            }
            return redirect()->intended('/login');
        }
        return back()->withErrors([
            'username' => 'Maaf username dan pasword tidak sesuai ',
        ])->onlyInput('username');
    }
    public function logout(Request $request)
    {
        Auth::logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();
        return redirect('login');
    }
}
