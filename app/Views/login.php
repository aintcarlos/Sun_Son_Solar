<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login | Sun Son Solar</title>
    <link rel="stylesheet" href="/css/login.css">
</head>

<body>

    <main class="login-container">
        <h1>Welcome Back!</h1>
        <p>Sign in to your Sun Son Solar account.</p>

        <?php if (session()->getFlashdata('error')): ?>
            <p class="login-message login-error">
                <?= esc(session()->getFlashdata('error')) ?>
            </p>
        <?php endif; ?>

        <?php if (session()->getFlashdata('success')): ?>
            <p class="login-message login-success">
                <?= esc(session()->getFlashdata('success')) ?>
            </p>
        <?php endif; ?>
        <form action="/login/authenticate" method="post">
            <?= csrf_field() ?>

            <label for="username">Username or Email</label>
            <input type="text" id="username" name="username" placeholder="Enter your username or email" required>

            <label for="password">Password</label>
            <input type="password" id="password" name="password" placeholder="Enter your password" required>

            <button type="submit">Login</button>
        </form>

        <p class="register-link">
            Don't have an account?
            <a href="/registration">Register here</a>
        </p>

        <a class="home-link" href="/">Back to Home</a>
    </main>

</body>

</html>