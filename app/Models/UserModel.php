<?php

namespace App\Models;

use CodeIgniter\Model;

class UserModel extends Model
{
    protected $table = 'users';
    protected $primaryKey = 'user_id';

    protected $allowedFields = [
        'user_type',
        'role_id',
        'job_title',
        'first_name',
        'middle_name',
        'last_name',
        'birthdate',
        'gender',
        'email',
        'phone_number',
        'address',
        'username',
        'password',
        'department_id'
    ];
}
