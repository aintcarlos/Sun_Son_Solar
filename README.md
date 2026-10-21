# Sun Son Solar System

**Team:** TRIPPLE S  
**Framework:** CodeIgniter 4  
**Language:** PHP 8.2+  
**Database:** MySQL
**Local development environment:** XAMPP

## Project Overview

The Sun Son Solar System is a web-based system being developed to help Sun Son Solar manage customer accounts, solar products and services, service bookings, employees, technician assignments, notifications, support requests, payments, and reports.

The public website introduces the company and its products and services. Customers can create their own accounts and use a customer portal. Employee accounts are created by an authorized Admin or HR user; employees do not self-register through the public customer registration flow.

## Main Features

### Public Website and Authentication
- Company landing page and service/product information
- Customer registration and login
- Login for customer and employee accounts
- Role-based access checks for portal pages

### Customer Portal
- Customer dashboard and profile view
- View and manage service bookings
- Service history and receipt pages
- Notifications
- Support tickets

### Admin and Employee Management
- Admin dashboard with summary cards
- User and employee account management
- Create and maintain employee accounts, including role and department assignment
- Manage products and services
- Manage bookings and technician assignments
- Manage announcements and notifications
- Review technician service reports
- View reports and record payment information
- Manage customer support tickets

### Technician Portal
- View assigned work
- Record site check-in with browser location support where available
- Submit service reports and equipment/problem details
- View relevant announcements and reminders

## User Roles and Departments

The implementation includes role-based workflows for:

- **Customer** — self-registration and customer portal access
- **Admin** — system and account management
- **HR** — employee account creation and announcements
- **Dispatcher** — booking coordination and technician assignment
- **Technician** — assigned jobs, site check-in, and service reporting
- **Employee** — access according to assigned role and department

Departments defined for the project include Administration, IT, Dispatch, Accounting, HR, Marketing, Sales, and Customer Service.

## Technology Stack

- **Backend:** PHP with CodeIgniter 4
- **Database:** MySQL / MariaDB
- **Frontend:** HTML, CSS, and JavaScript
- **Local server:** XAMPP Apache/MySQL or the CodeIgniter development server
- **Version control:** Git and GitHub

## Requirements

- PHP **8.2 or later**
- Composer
- MySQL or MariaDB
- PHP extensions required by the project, including `intl`, `mbstring`, and `mysqli`
- XAMPP or an equivalent local PHP/MySQL environment

## Local Setup (Windows + XAMPP)

### 1. Get the project files

Clone the repository or open the project folder in VS Code. The project root should contain files such as `spark`, `app/`, `public/`, `system/`, `writable/`, and `composer.json`.

### 2. Start MySQL

Open XAMPP Control Panel and start **MySQL**. Start Apache too if you plan to use phpMyAdmin or Apache hosting.

### 3. Create/configure the database

Create a MySQL database named `sun_son_solar` and ensure the project schema and required lookup data (roles, departments, and service categories) are installed.

For a **new, empty database**, use the clean schema installer supplied with the project/package if included. Do not import a clean installer into an existing database that already contains customer records, bookings, or other system data.

For an **existing database**, back it up first. Apply only the required migration statements after checking whether the relevant columns already exist. Do not import a raw database export containing real user records or password hashes into a shared/public repository.

### 4. Configure environment settings

Copy the root `env` file to `.env` if `.env` does not already exist. Update the local settings in `.env` for the project URL and database connection. Example values for a typical local XAMPP setup:

```ini
CI_ENVIRONMENT = development
app.baseURL = 'http://127.0.0.1:8081/'

database.default.hostname = localhost
database.default.database = sun_son_solar
database.default.username = root
database.default.password =
database.default.DBDriver = MySQLi
database.default.port = 3306
```

Adjust the username, password, and port to match your local MySQL configuration. **Do not commit `.env` to Git.**

### 5. Install dependencies

From the project root, run:

```powershell
composer install
```

If Composer or PHP is not available in your `PATH`, use the full path to the executable installed on your machine.

### 6. Check routes and start the site

```powershell
php spark routes
php spark serve --host 127.0.0.1 --port 8081
```

Keep the terminal running while using the site. Open these URLs in your browser:

- Home: `http://127.0.0.1:8081/`
- Login: `http://127.0.0.1:8081/login`
- Customer registration: `http://127.0.0.1:8081/registration`
- Customer dashboard after login: `http://127.0.0.1:8081/customer/dashboard`
- Admin dashboard after Admin login: `http://127.0.0.1:8081/admin/dashboard`

## Creating the First Admin Account

The initial Admin setup is performed using the CodeIgniter CLI command, not public registration:

```powershell
php spark sunsonsolar:create-first-admin
```

Follow the prompts and use a strong, unique password. The command is intended to assign the Admin role and Administration department automatically. The database must contain the expected Admin role and Administration department records before the command can succeed.

If the command fails, check the latest file in `writable/logs/`. Database schema requirements must also match the application; for example, if the command allows an optional middle name, the `users.middle_name` column must allow `NULL` or the command must be updated to store an appropriate value.

After the first Admin exists, Admin/HR users should create employee accounts through Employee Management. Do not enable public employee self-registration unless the project requirements are formally changed.

## Database Notes

The implementation uses the existing project database design. Core tables include:

- `users`, `customers`, `employees`
- `roles`, `departments`
- `products`, `services`
- `bookings`, `booking_assignments`, `site_checkins`
- `service_reports`, `announcements`, `notifications`
- `payments`, `support_tickets`, `audit_logs`

Table names and column requirements must match the models and controllers installed in the project. Before running SQL changes, back up the database and inspect the current schema. Never run a clean-install SQL file against a populated database.

## Security and Privacy

- Never commit `.env`, database exports, real customer details, password hashes, or private credentials.
- Use unique, strong passwords for Admin and employee accounts. Do not use example or interview passwords as permanent credentials.
- Keep CodeIgniter CSRF protection enabled.
- Retain role/permission checks on protected pages; do not remove guards just to make a page open.
- Treat booking CSV exports and service reports as confidential because they may contain customer or employee information.
- Removing a sensitive database file from the latest Git commit does not automatically remove it from earlier Git history. If a real-data export was committed, restrict repository access, review the Git history, and rotate any credentials that may have been exposed.

## Known Scope and Limitations

- The system has been run locally, and the customer dashboard/profile and Admin dashboard have been opened during development. Not every form, database operation, or role-specific access path has been verified end to end.
- Payments are manually recorded/verified; no payment gateway is configured.
- Receipt pages are printable HTML records, not fiscal or tax-certified receipts.
- Notifications are stored in the application; external email/SMS delivery is not configured.
- Booking calendar views do not synchronize with an external calendar service.
- Customer notification preferences may be stored without controlling delivery behavior yet.
- Audit logs cover key changes but may not record every read action.

This project should be treated as a local development/academic system until all required workflows, access controls, backups, and deployment settings have been reviewed and tested.

## Development Notes

- Preserve the existing landing page and its stylesheet when updating portal modules unless a change is intentionally required.
- Shared portal styles are defined in `public/css/portal.css`; customer-specific styles may also exist in separate CSS files.
- When adding or changing routes, edit `app/Config/Routes.php` carefully and check the result with `php spark routes`.
- Check error details in `writable/logs/` when a page displays CodeIgniter's generic “Whoops” error.

## License

Refer to the repository's `LICENSE` file for license information.
