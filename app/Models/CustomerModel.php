<?php

namespace App\Models;

use CodeIgniter\Model;

class CustomerModel extends Model
{
    protected $table = 'customers';
    protected $primaryKey = 'customer_id';
    protected $returnType = 'array';

    protected $allowedFields = [
        'user_id',
        'first_name',
        'middle_name',
        'last_name',
        'birthdate',
        'gender',
        'email',
        'phone_number',
        'address'
    ];
}
