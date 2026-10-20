<?php

namespace App\Controllers;

class CustomerDashboard extends BaseController
{
    public function index()
    {
        if (
            ! session()->get('isLoggedIn') ||
            session()->get('user_type') !== 'Customer'
        ) {
            return redirect()->to(site_url('login'))
                ->with('error', 'Please log in to access your dashboard.');
        }

        return view('customer_dashboard');
    }
}
