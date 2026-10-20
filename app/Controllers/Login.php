<?php

namespace App\Controllers;

class Login extends BaseController
{
    public function index()
    {
        return view('login');
    }

    public function authenticate()
    {
        $username = trim(
            (string) $this->request->getPost('username')
        );

        $password = (string) $this->request->getPost('password');

        if ($username === '' || $password === '') {
            return redirect()->to(site_url('login'))
                ->with('error', 'Please enter your username and password.');
        }

        $db = \Config\Database::connect();

        $user = $db->table('users u')
            ->select(
                'u.user_id, u.user_type, u.role_id, u.username, ' .
                'u.password, u.first_name, u.last_name, r.role_name'
            )
            ->join('roles r', 'r.role_id = u.role_id', 'left')
            ->groupStart()
                ->where('u.username', $username)
                ->orWhere('u.email', $username)
            ->groupEnd()
            ->get()
            ->getRowArray();

        if (
            ! $user ||
            ! password_verify($password, $user['password'])
        ) {
            return redirect()->to(site_url('login'))
                ->with('error', 'Invalid username or password.');
        }

        $userType = strtolower(trim($user['user_type']));
        $roleName = strtolower(trim($user['role_name'] ?? ''));

        // Customer login
        if ($userType === 'customer' && $roleName === 'customer') {
            $customer = $db->table('customers')
                ->where('user_id', $user['user_id'])
                ->get()
                ->getRowArray();

            if (! $customer) {
                return redirect()->to(site_url('login'))
                    ->with('error', 'Customer profile not found.');
            }

            session()->regenerate(true);

            session()->set([
                'user_id'    => $user['user_id'],
                'user_type'  => 'Customer',
                'role_name'  => $user['role_name'],
                'username'   => $user['username'],
                'first_name' => $user['first_name'],
                'last_name'  => $user['last_name'],
                'isLoggedIn' => true
            ]);

            return redirect()->to(site_url('customer/dashboard'));
        }

        // Employee login
        $allowedRoles = [
            'admin',
            'hr',
            'dispatcher',
            'technician',
            'employee'
        ];

        if (
            $userType !== 'employee' ||
            ! in_array($roleName, $allowedRoles, true)
        ) {
            return redirect()->to(site_url('login'))
                ->with('error', 'Invalid account type or role.');
        }

        $employee = $db->table('employees')
            ->where('user_id', $user['user_id'])
            ->get()
            ->getRowArray();

        if (! $employee) {
            return redirect()->to(site_url('login'))
                ->with('error', 'Employee profile not found.');
        }

        session()->regenerate(true);

        session()->set([
            'user_id'       => $user['user_id'],
            'user_type'     => 'Employee',
            'role_name'     => $user['role_name'],
            'employee_id'   => $employee['employee_id'],
            'department_id' => $employee['department_id'],
            'job_title'     => $employee['job_title'],
            'username'      => $user['username'],
            'first_name'    => $user['first_name'],
            'last_name'     => $user['last_name'],
            'isLoggedIn'    => true
        ]);

        return redirect()->to(site_url('employee/dashboard'));
    }

    public function logout()
    {
        session()->destroy();

        return redirect()->to(site_url('login'))
            ->with('success', 'You have logged out successfully.');
    }
}
