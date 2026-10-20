-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 21, 2026 at 01:21 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sun_son_solar`
--

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `announcement_id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `message` text NOT NULL,
  `created_by_user_id` int(11) NOT NULL,
  `target_department_id` int(11) DEFAULT NULL,
  `published_at` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `audit_logs`
--

CREATE TABLE `audit_logs` (
  `audit_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `action` varchar(100) NOT NULL,
  `entity_type` varchar(100) DEFAULT NULL,
  `entity_id` int(11) DEFAULT NULL,
  `details` text DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `booking_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `service_type` varchar(100) NOT NULL,
  `preferred_date` date NOT NULL,
  `preferred_time` time NOT NULL,
  `service_address` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `status` varchar(30) NOT NULL DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `booking_assignments`
--

CREATE TABLE `booking_assignments` (
  `assignment_id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `employee_user_id` int(11) NOT NULL,
  `assigned_by_user_id` int(11) DEFAULT NULL,
  `assigned_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `assignment_status` enum('Assigned','Accepted','In Progress','Completed','Cancelled') NOT NULL DEFAULT 'Assigned',
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) NOT NULL,
  `birthdate` date NOT NULL,
  `gender` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `address` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `user_id`, `first_name`, `middle_name`, `last_name`, `birthdate`, `gender`, `email`, `phone_number`, `address`, `created_at`) VALUES
(1, 1, 'test', 'user', 'solar', '2001-09-20', 'Male', 'test@kahoot.com', '09284917974', 'pasig tangina maynila to eh', '2026-10-20 22:57:48'),
(2, 2, 'Carlos', 'user', 'Samson', '1999-02-10', 'Male', 'miguelsamson3@gmail.com', '09284917974', 'pasig', '2026-10-20 22:57:48'),
(3, 3, 'Carlos', 'user', 'Samson', '2002-06-06', 'Female', 'miguelsamson32@gmail.com', '09284917974', 'weqewqe', '2026-10-20 22:57:48'),
(4, 4, 'gamit', 'leandro', 'mark', '2001-03-23', 'Male', 'leandronyek@hotmail.com', '09284917324', 'maynilla yarn', '2026-10-20 22:57:48'),
(5, 5, 'Carlos', 'user', 'Samson', '1998-06-12', 'Male', 'miguelsamson324@gmail.com', '09284917326', 'maynila ako bro', '2026-10-20 22:57:48'),
(8, 6, 'kim', 'kimberlee', 'balme', '1998-03-28', 'Female', 'kimbalme@hotmail.com', '09284912345', 'santolan bruu', '2026-10-20 23:08:34');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `department_id` int(11) NOT NULL,
  `department_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`department_id`, `department_name`) VALUES
(5, 'Accounting'),
(3, 'Administration'),
(9, 'Customer Service'),
(2, 'Dispatch'),
(6, 'HR'),
(4, 'IT'),
(7, 'Marketing'),
(8, 'Sales');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `employee_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) NOT NULL,
  `birthdate` date NOT NULL,
  `gender` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `address` varchar(255) NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  `job_title` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `notification_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `booking_id` int(11) DEFAULT NULL,
  `notification_type` varchar(50) NOT NULL DEFAULT 'General',
  `title` varchar(150) NOT NULL,
  `message` text NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `read_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `payment_status` enum('Pending','Paid','Failed','Refunded') NOT NULL DEFAULT 'Pending',
  `transaction_reference` varchar(100) DEFAULT NULL,
  `receipt_number` varchar(100) DEFAULT NULL,
  `paid_at` datetime DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(150) NOT NULL,
  `category` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(12,2) NOT NULL DEFAULT 0.00,
  `is_available` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(50) NOT NULL,
  `role_description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`role_id`, `role_name`, `role_description`, `created_at`) VALUES
(1, 'Customer', 'Customer account', '2026-10-20 22:42:27'),
(2, 'Admin', 'System administration', '2026-10-20 22:42:27'),
(3, 'HR', 'Employee account management and announcements', '2026-10-20 22:42:27'),
(4, 'Dispatcher', 'Booking schedules and technician assignments', '2026-10-20 22:42:27'),
(5, 'Technician', 'Assigned jobs and site service reports', '2026-10-20 22:42:27'),
(6, 'Employee', 'Other employee access based on department and permissions', '2026-10-20 22:42:27');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `service_id` int(11) NOT NULL,
  `service_name` varchar(150) NOT NULL,
  `description` text DEFAULT NULL,
  `base_price` decimal(12,2) DEFAULT NULL,
  `is_available` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`service_id`, `service_name`, `description`, `base_price`, `is_available`, `created_at`, `updated_at`) VALUES
(1, 'Consultation', NULL, NULL, 1, '2026-10-20 22:46:19', '2026-10-20 22:46:19'),
(2, 'Design', NULL, NULL, 1, '2026-10-20 22:46:19', '2026-10-20 22:46:19'),
(3, 'Permitting', NULL, NULL, 1, '2026-10-20 22:46:19', '2026-10-20 22:46:19'),
(4, 'Installation', NULL, NULL, 1, '2026-10-20 22:46:19', '2026-10-20 22:46:19'),
(5, 'Maintenance', NULL, NULL, 1, '2026-10-20 22:46:19', '2026-10-20 22:46:19'),
(6, 'Repair', NULL, NULL, 1, '2026-10-20 22:46:19', '2026-10-20 22:46:19'),
(7, 'Monitoring', NULL, NULL, 1, '2026-10-20 22:46:19', '2026-10-20 22:46:19');

-- --------------------------------------------------------

--
-- Table structure for table `service_reports`
--

CREATE TABLE `service_reports` (
  `report_id` int(11) NOT NULL,
  `assignment_id` int(11) NOT NULL,
  `technician_user_id` int(11) NOT NULL,
  `work_performed` text NOT NULL,
  `findings` text DEFAULT NULL,
  `recommendations` text DEFAULT NULL,
  `parts_used` text DEFAULT NULL,
  `report_status` enum('Draft','Submitted','Reviewed') NOT NULL DEFAULT 'Submitted',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `site_checkins`
--

CREATE TABLE `site_checkins` (
  `checkin_id` int(11) NOT NULL,
  `assignment_id` int(11) NOT NULL,
  `technician_user_id` int(11) NOT NULL,
  `latitude` decimal(10,7) NOT NULL,
  `longitude` decimal(10,7) NOT NULL,
  `accuracy_meters` decimal(8,2) DEFAULT NULL,
  `checked_in_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_tickets`
--

CREATE TABLE `support_tickets` (
  `ticket_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `subject` varchar(150) NOT NULL,
  `message` text NOT NULL,
  `status` enum('Open','In Progress','Resolved','Closed') NOT NULL DEFAULT 'Open',
  `assigned_to_user_id` int(11) DEFAULT NULL,
  `resolution` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_type` varchar(20) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `job_title` varchar(100) DEFAULT NULL,
  `first_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `birthdate` date NOT NULL,
  `gender` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `address` varchar(255) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_type`, `role_id`, `job_title`, `first_name`, `middle_name`, `last_name`, `birthdate`, `gender`, `email`, `phone_number`, `address`, `username`, `password`, `department_id`, `created_at`) VALUES
(1, 'Customer', 1, NULL, 'test', 'user', 'solar', '2001-09-20', 'Male', 'test@kahoot.com', '09284917974', 'pasig tangina maynila to eh', 'testusersolar', '$2y$10$I4VgEtlCxurAkdlGLoYjCO7fhdCk/CNklAVhmtfatNWMufUJBCpYu', NULL, '2026-10-20 19:36:10'),
(2, 'Customer', 1, NULL, 'Carlos', 'user', 'Samson', '1999-02-10', 'Male', 'miguelsamson3@gmail.com', '09284917974', 'pasig', 'miguelsamson3@gmail.com', '$2y$10$1kY7fAQYPfR/h7CQcclHaOW93GUdkAZtfvUEj8pActIJfjSqQl6ji', NULL, '2026-10-20 19:41:46'),
(3, 'Customer', 1, NULL, 'Carlos', 'user', 'Samson', '2002-06-06', 'Female', 'miguelsamson32@gmail.com', '09284917974', 'weqewqe', 'miguelsamson23@gmail.com', '$2y$10$XpdJPwW8wF/XDDxaReGn0uJRfd0h7iZsJKEOp1.mgL7I516h0eqwG', NULL, '2026-10-20 20:06:22'),
(4, 'Customer', 1, NULL, 'gamit', 'leandro', 'mark', '2001-03-23', 'Male', 'leandronyek@hotmail.com', '09284917324', 'maynilla yarn', 'maynilayarnnn', '$2y$10$mGN.6Npn5guQnT/w1FetkO4N3Xr9Ho1sNWRIi4t5XOUQfqVe0iBrK', NULL, '2026-10-20 20:09:05'),
(5, 'Customer', 1, NULL, 'Carlos', 'user', 'Samson', '1998-06-12', 'Male', 'miguelsamson324@gmail.com', '09284917326', 'maynila ako bro', 'maynilaakobro', '$2y$10$b8UMZ.RVlQkBJ/9l5rw8aeFPM4f9Fz9UCIzH9eyy0LYax6cpyp48O', NULL, '2026-10-20 21:13:29'),
(6, 'Customer', 1, NULL, 'kim', 'kimberlee', 'balme', '1998-03-28', 'Female', 'kimbalme@hotmail.com', '09284912345', 'santolan bruu', 'kimbalmes', '$2y$10$H6ojevTOsnAbfzS1WdMDneCpXU5I3hJfCpjasaAQxNGekki1qNoyK', NULL, '2026-10-20 23:08:34');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`announcement_id`),
  ADD KEY `idx_announcements_active` (`is_active`),
  ADD KEY `idx_announcements_department` (`target_department_id`),
  ADD KEY `fk_announcements_creator` (`created_by_user_id`);

--
-- Indexes for table `audit_logs`
--
ALTER TABLE `audit_logs`
  ADD PRIMARY KEY (`audit_id`),
  ADD KEY `idx_audit_user` (`user_id`),
  ADD KEY `idx_audit_action` (`action`),
  ADD KEY `idx_audit_created` (`created_at`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `fk_bookings_user` (`user_id`);

--
-- Indexes for table `booking_assignments`
--
ALTER TABLE `booking_assignments`
  ADD PRIMARY KEY (`assignment_id`),
  ADD UNIQUE KEY `unique_booking_employee` (`booking_id`,`employee_user_id`),
  ADD KEY `fk_assignment_employee` (`employee_user_id`),
  ADD KEY `fk_assignment_assigner` (`assigned_by_user_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`department_id`),
  ADD UNIQUE KEY `department_name` (`department_name`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`employee_id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD KEY `fk_employees_department` (`department_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `idx_notifications_user_read` (`user_id`,`is_read`),
  ADD KEY `fk_notifications_booking` (`booking_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD UNIQUE KEY `receipt_number` (`receipt_number`),
  ADD KEY `idx_payments_status` (`payment_status`),
  ADD KEY `fk_payments_booking` (`booking_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`),
  ADD UNIQUE KEY `role_name` (`role_name`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`service_id`),
  ADD UNIQUE KEY `service_name` (`service_name`);

--
-- Indexes for table `service_reports`
--
ALTER TABLE `service_reports`
  ADD PRIMARY KEY (`report_id`),
  ADD KEY `fk_report_assignment` (`assignment_id`),
  ADD KEY `fk_report_technician` (`technician_user_id`);

--
-- Indexes for table `site_checkins`
--
ALTER TABLE `site_checkins`
  ADD PRIMARY KEY (`checkin_id`),
  ADD UNIQUE KEY `assignment_id` (`assignment_id`),
  ADD KEY `fk_checkin_technician` (`technician_user_id`);

--
-- Indexes for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`ticket_id`),
  ADD KEY `idx_tickets_user_status` (`user_id`,`status`),
  ADD KEY `fk_ticket_assigned_user` (`assigned_to_user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `department_id` (`department_id`),
  ADD KEY `fk_users_role` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `announcement_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `audit_logs`
--
ALTER TABLE `audit_logs`
  MODIFY `audit_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `booking_assignments`
--
ALTER TABLE `booking_assignments`
  MODIFY `assignment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `department_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `service_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `service_reports`
--
ALTER TABLE `service_reports`
  MODIFY `report_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `site_checkins`
--
ALTER TABLE `site_checkins`
  MODIFY `checkin_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `ticket_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `announcements`
--
ALTER TABLE `announcements`
  ADD CONSTRAINT `fk_announcements_creator` FOREIGN KEY (`created_by_user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `fk_announcements_department` FOREIGN KEY (`target_department_id`) REFERENCES `departments` (`department_id`) ON DELETE SET NULL;

--
-- Constraints for table `audit_logs`
--
ALTER TABLE `audit_logs`
  ADD CONSTRAINT `fk_audit_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL;

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `fk_bookings_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `booking_assignments`
--
ALTER TABLE `booking_assignments`
  ADD CONSTRAINT `fk_assignment_assigner` FOREIGN KEY (`assigned_by_user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_assignment_booking` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`booking_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_assignment_employee` FOREIGN KEY (`employee_user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `fk_customers_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `fk_employees_department` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_employees_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `fk_notifications_booking` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`booking_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_notifications_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `fk_payments_booking` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`booking_id`);

--
-- Constraints for table `service_reports`
--
ALTER TABLE `service_reports`
  ADD CONSTRAINT `fk_report_assignment` FOREIGN KEY (`assignment_id`) REFERENCES `booking_assignments` (`assignment_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_report_technician` FOREIGN KEY (`technician_user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `site_checkins`
--
ALTER TABLE `site_checkins`
  ADD CONSTRAINT `fk_checkin_assignment` FOREIGN KEY (`assignment_id`) REFERENCES `booking_assignments` (`assignment_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_checkin_technician` FOREIGN KEY (`technician_user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD CONSTRAINT `fk_ticket_assigned_user` FOREIGN KEY (`assigned_to_user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_ticket_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_role` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

USE sun_son_solar;

-- Default departments
INSERT IGNORE INTO departments (department_name) VALUES
('Administration'),
('IT'),
('Dispatch'),
('Accounting'),
('HR'),
('Marketing'),
('Sales'),
('Customer Service');

-- Default roles
INSERT IGNORE INTO roles (role_name, role_description) VALUES
('Customer', 'Customer account'),
('Admin', 'System administration'),
('HR', 'Employee account management and announcements'),
('Dispatcher', 'Booking schedules and technician assignments'),
('Technician', 'Assigned jobs and site service reports'),
('Employee', 'Other employee access based on department and permissions');

-- Default services
INSERT IGNORE INTO services (service_name) VALUES
('Consultation'),
('Design'),
('Permitting'),
('Installation'),
('Maintenance'),
('Repair'),
('Monitoring');
