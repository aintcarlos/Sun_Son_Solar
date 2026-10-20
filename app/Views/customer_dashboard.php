<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Dashboard | Sun Son Solar</title>
    <link rel="stylesheet" href="/css/customer-dashboard.css?v=2">
</head>

<body>

    <header class="dashboard-header">
        <a href="/" class="dashboard-brand">Sun Son Solar</a>
        <a href="/logout" class="logout-btn">Logout</a>
    </header>

    <main class="dashboard-container">
        <h1>
            Welcome, <?= esc(session()->get('first_name')) ?>!
        </h1>

        <p class="welcome-text">
            Welcome to your Sun Son Solar customer dashboard.
        </p>

        <div class="dashboard-grid">
            <section class="dashboard-card">
                <h2>My Bookings</h2>
                <p>View your service bookings and appointments.</p>
            </section>

            <section class="dashboard-card">
                <h2>Service History</h2>
                <p>View your previous and completed services.</p>
            </section>

            <section class="dashboard-card">
                <h2>My Profile</h2>

                <p>
                    Username:
                    <?= esc(session()->get('username')) ?>
                </p>

                <p>
                    Name:
                    <?= esc(session()->get('first_name')) ?>
                    <?= esc(session()->get('last_name')) ?>
                </p>

                <a href="/customer/profile" class="dashboard-link">
                    View My Profile
                </a>
            </section>

            <section class="dashboard-card">
                <h2>Support</h2>
                <p>Contact Sun Son Solar for help with your services.</p>
            </section>
        </div>
    </main>

</body>

</html>