
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Profile | Sun Son Solar</title>
    <link rel="stylesheet" href="/css/customer-profile.css">
</head>
<body>

    <header class="profile-header">
        <a href="/customer/dashboard" class="profile-brand">
            Sun Son Solar
        </a>

        <a href="/logout" class="profile-logout">Logout</a>
    </header>

    <main class="profile-container">
        <a href="/customer/dashboard" class="back-link">
            &larr; Back to Dashboard
        </a>

        <h1>My Profile</h1>
        <p class="profile-description">
            View your registered account information.
        </p>

        <section class="profile-card">
            <h2>Personal Information</h2>

            <div class="profile-field">
                <span>Full Name</span>
                <p>
                    <?= esc($customer['first_name']) ?>
                    <?= esc($customer['middle_name'] ?? '') ?>
                    <?= esc($customer['last_name']) ?>
                </p>
            </div>

            <div class="profile-field">
                <span>Birthdate</span>
                <p><?= esc($customer['birthdate']) ?></p>
            </div>

            <div class="profile-field">
                <span>Gender</span>
                <p><?= esc($customer['gender']) ?></p>
            </div>

            <div class="profile-field">
                <span>Email</span>
                <p><?= esc($customer['email']) ?></p>
            </div>

            <div class="profile-field">
                <span>Phone Number</span>
                <p><?= esc($customer['phone_number']) ?></p>
            </div>

            <div class="profile-field">
                <span>Address</span>
                <p><?= esc($customer['address']) ?></p>
            </div>

            <div class="profile-field">
                <span>Username</span>
                <p><?= esc($customer['username']) ?></p>
            </div>
        </section>
    </main>

</body>
</html>
