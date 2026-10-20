<?php

namespace App\Controllers;

use App\Models\UserModel;

class CustomerProfile extends BaseController
{
    public function index()
    {
        if (
            ! session()->get('isLoggedIn') ||
            session()->get('user_type') !== 'Customer'
        ) {
            return redirect()->to(site_url('login'));
        }

        $userModel = new UserModel();

        $customer = $userModel->find(session()->get('user_id'));

        if (! $customer) {
            session()->destroy();

            return redirect()->to(site_url('login'));
        }

        return view('customer_profile', [
            'customer' => $customer
        ]);
    }
}
