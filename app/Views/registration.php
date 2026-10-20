<?php
$successMessage = session()->getFlashdata('success');
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Customer Registration | Sun Son Solar</title>

    <link rel="stylesheet" href="/css/registration.css">
</head>

<body>

<div class="registration-container">

    <h1>Sun Son Solar</h1>
    <p class="subtitle">Create Your Customer Account</p>

    <?php if ($successMessage): ?>
        <div class="form-message form-success">
            <?= esc($successMessage) ?>
        </div>
    <?php endif; ?>

    <?php if (isset($validation)): ?>
        <div class="form-message form-error">
            Please check the form and correct the highlighted errors.
        </div>
    <?php endif; ?>

    <form action="/registration/register" method="post">

        <div class="form-row">

            <div class="form-group">
                <label for="first_name">First Name *</label>
                <input
                    type="text"
                    name="first_name"
                    id="first_name"
                    maxlength="50"
                    required>
                <?php if (isset($validation) && $validation->hasError('first_name')): ?>
                    <small class="field-error"><?= esc($validation->getError('first_name')) ?></small>
                <?php endif; ?>
            </div>

            <div class="form-group">
                <label for="middle_name">Middle Name</label>
                <input
                    type="text"
                    name="middle_name"
                    id="middle_name"
                    maxlength="50">
                <?php if (isset($validation) && $validation->hasError('middle_name')): ?>
                    <small class="field-error"><?= esc($validation->getError('middle_name')) ?></small>
                <?php endif; ?>
            </div>

        </div>

        <div class="form-group">
            <label for="last_name">Last Name *</label>
            <input
                type="text"
                name="last_name"
                id="last_name"
                maxlength="50"
                required>
            <?php if (isset($validation) && $validation->hasError('last_name')): ?>
                <small class="field-error"><?= esc($validation->getError('last_name')) ?></small>
            <?php endif; ?>
        </div>

        <div class="form-row">

            <div class="form-group">
                <label for="birthdate">Birthdate *</label>
                <input
                    type="date"
                    name="birthdate"
                    id="birthdate"
                    required>
                <?php if (isset($validation) && $validation->hasError('birthdate')): ?>
                    <small class="field-error"><?= esc($validation->getError('birthdate')) ?></small>
                <?php endif; ?>
            </div>

            <div class="form-group">
                <label for="gender">Gender *</label>
                <select name="gender" id="gender" required>
                    <option value="">Select Gender</option>
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                    <option value="Other">Other</option>
                </select>
                <?php if (isset($validation) && $validation->hasError('gender')): ?>
                    <small class="field-error"><?= esc($validation->getError('gender')) ?></small>
                <?php endif; ?>
            </div>

        </div>

        <div class="form-row">

            <div class="form-group">
                <label for="email">Email Address *</label>
                <input
                    type="email"
                    name="email"
                    id="email"
                    maxlength="100"
                    required>
                <?php if (isset($validation) && $validation->hasError('email')): ?>
                    <small class="field-error"><?= esc($validation->getError('email')) ?></small>
                <?php endif; ?>
            </div>

            <div class="form-group">
                <label for="phone_number">Phone Number *</label>
                <input
                    type="tel"
                    name="phone_number"
                    id="phone_number"
                    maxlength="20"
                    placeholder="09XXXXXXXXX"
                    required>
                <?php if (isset($validation) && $validation->hasError('phone_number')): ?>
                    <small class="field-error"><?= esc($validation->getError('phone_number')) ?></small>
                <?php endif; ?>
            </div>

        </div>

        <div class="form-group">
            <label for="address">Address *</label>
            <textarea
                name="address"
                id="address"
                rows="3"
                maxlength="255"
                required></textarea>
            <?php if (isset($validation) && $validation->hasError('address')): ?>
                <small class="field-error"><?= esc($validation->getError('address')) ?></small>
            <?php endif; ?>
        </div>

        <div class="form-group">
            <label for="username">Username *</label>
            <input
                type="text"
                name="username"
                id="username"
                minlength="4"
                maxlength="50"
                autocomplete="username"
                required>
            <?php if (isset($validation) && $validation->hasError('username')): ?>
                <small class="field-error"><?= esc($validation->getError('username')) ?></small>
            <?php endif; ?>
        </div>

        <div class="form-row">

            <div class="form-group">
                <label for="password">Password *</label>
                <input
                    type="password"
                    name="password"
                    id="password"
                    minlength="8"
                    maxlength="255"
                    autocomplete="new-password"
                    required>
                <?php if (isset($validation) && $validation->hasError('password')): ?>
                    <small class="field-error"><?= esc($validation->getError('password')) ?></small>
                <?php endif; ?>
            </div>

            <div class="form-group">
                <label for="confirm_password">Confirm Password *</label>
                <input
                    type="password"
                    name="confirm_password"
                    id="confirm_password"
                    minlength="8"
                    maxlength="255"
                    autocomplete="new-password"
                    required>
                <?php if (isset($validation) && $validation->hasError('confirm_password')): ?>
                    <small class="field-error"><?= esc($validation->getError('confirm_password')) ?></small>
                <?php endif; ?>
            </div>

        </div>

        <p class="form-note">Fields marked with * are required.</p>

        <button type="submit">Create Account</button>

    </form>

    <p class="registration-back">
        Already have an account?
        <a href="/login">Log in</a>
    </p>

    <p class="registration-back">
        <a href="/">Back to Home</a>
    </p>

</div>

</body>
</html>