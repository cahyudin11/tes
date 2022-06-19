<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;

class UserData extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $user = [
            [
                'name' => 'admin',
                'username' => 'admin',
                'password' => bcrypt('admin'),
                'level' => 1,
                'email' => 'admin@kelompok1.com'
            ],
            [
                'name' => 'kasir',
                'username' => 'kasir',
                'password' => bcrypt('kasir'),
                'level' => 2,
                'email' => 'kasir@kelompok1.com'
            ],
        ];
        foreach($user as $key => $value){
            User::create($value);
        }
    }
}
