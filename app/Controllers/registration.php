<?php

namespace App\Controllers;

use App\Models\UserModel;
use App\Models\CustomerModel;

class Registration extends BaseController
{
    public function index()
    {
        return view('registration');
    }

    public function register()
    {
        $rules = [
            'first_name' => 'required|max_length[50]',
            'middle_name' => 'permit_empty|max_length[50]',
            'last_name' => 'required|max_length[50]',
            'birthdate' => 'required|valid_date',
            'gender' => 'required|max_length[20]',
            'email' => 'required|valid_email|max_length[100]|is_unique[users.email]',
            'phone_number' => 'required|max_length[20]',
            'address' => 'required|max_length[255]',
            'username' => 'required|min_length[4]|max_length[50]|is_unique[users.username]',
            'password' => 'required|min_length[8]|max_length[255]',
            'confirm_password' => 'required|matches[password]'
        ];

        if (! $this->validate($rules)) {
            return view('registration', [
                'validation' => $this->validator
            ]);
        }

        $db = \Config\Database::connect();

        // Find the Customer role
        $role = $db->table('roles')
            ->select('role_id')
            ->where('role_name', 'Customer')
            ->get()
            ->getRowArray();

        if (! $role) {
            return redirect()->to(site_url('registration'))
                ->with('error', 'Customer role is not configured.');
        }

        $userModel = new UserModel();
        $customerModel = new CustomerModel();

        $middleName = trim(
            (string) ($this->request->getPost('middle_name') ?? '')
        );

        $userData = [
            'user_type' => 'Customer',
            'role_id' => $role['role_id'],
            'job_title' => null,
            'first_name' => trim($this->request->getPost('first_name')),
            'middle_name' => $middleName !== '' ? $middleName : null,
            'last_name' => trim($this->request->getPost('last_name')),
            'birthdate' => $this->request->getPost('birthdate'),
            'gender' => $this->request->getPost('gender'),
            'email' => trim($this->request->getPost('email')),
            'phone_number' => trim($this->request->getPost('phone_number')),
            'address' => trim($this->request->getPost('address')),
            'username' => trim($this->request->getPost('username')),
            'password' => password_hash(
                $this->request->getPost('password'),
                PASSWORD_DEFAULT
            ),
            'department_id' => null
        ];

        // Start transaction
        $db->transBegin();

        // Save login account
        if ($userModel->insert($userData) === false) {
            $db->transRollback();

            return redirect()->to(site_url('registration'))
                ->with('error', 'Unable to create the account. Please try again.');
        }

        $userId = $userModel->getInsertID();

        // Save customer profile
        $customerData = [
            'user_id' => $userId,
            'first_name' => $userData['first_name'],
            'middle_name' => $userData['middle_name'],
            'last_name' => $userData['last_name'],
            'birthdate' => $userData['birthdate'],
            'gender' => $userData['gender'],
            'email' => $userData['email'],
            'phone_number' => $userData['phone_number'],
            'address' => $userData['address']
        ];

        if ($customerModel->insert($customerData) === false) {
            $db->transRollback();

            return redirect()->to(site_url('registration'))
                ->with('error', 'Unable to save the customer profile. Please try again.');
        }

        if ($db->transStatus() === false) {
            $db->transRollback();

            return redirect()->to(site_url('registration'))
                ->with('error', 'Registration failed. Please try again.');
        }

        $db->transCommit();

        return redirect()->to(site_url('login'))
            ->with(
                'success',
                'Customer account created successfully. Please log in.'
            );
    }
}
