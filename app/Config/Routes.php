<?php

use CodeIgniter\Router\RouteCollection;

/** @var RouteCollection $routes */
$routes->get('/', 'Landing::index');
$routes->get('/registration', 'Registration::index');
$routes->post('/registration/register', 'Registration::register');
$routes->get('account-type', 'AccountType::index');
$routes->get('login', 'Login::index');
$routes->post('login/authenticate', 'Login::authenticate');
$routes->get('logout', 'Login::logout');
$routes->get('customer/dashboard', 'CustomerDashboard::index');
$routes->get('customer/profile', 'CustomerProfile::index');