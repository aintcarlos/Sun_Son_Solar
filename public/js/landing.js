const menuToggle = document.querySelector('.menu-toggle');
const navigation = document.querySelector('.navigation');

if (menuToggle && navigation) {
    menuToggle.addEventListener('click', () => {
        const isExpanded = menuToggle.getAttribute('aria-expanded') === 'true';
        menuToggle.setAttribute('aria-expanded', String(!isExpanded));
        menuToggle.setAttribute('aria-label', isExpanded ? 'Open navigation' : 'Close navigation');
        navigation.classList.toggle('is-open', !isExpanded);
        document.body.classList.toggle('menu-open', !isExpanded);
    });

    navigation.querySelectorAll('a').forEach((link) => {
        link.addEventListener('click', () => {
            menuToggle.setAttribute('aria-expanded', 'false');
            menuToggle.setAttribute('aria-label', 'Open navigation');
            navigation.classList.remove('is-open');
            document.body.classList.remove('menu-open');
        });
    });

    window.addEventListener('resize', () => {
        if (window.innerWidth > 800) {
            menuToggle.setAttribute('aria-expanded', 'false');
            menuToggle.setAttribute('aria-label', 'Open navigation');
            navigation.classList.remove('is-open');
            document.body.classList.remove('menu-open');
        }
    });
}

const faqQuestions = document.querySelectorAll('.faq-question');

faqQuestions.forEach((question) => {
    question.addEventListener('click', () => {
        const isExpanded = question.getAttribute('aria-expanded') === 'true';
        const answer = question.closest('.faq-item').querySelector('.faq-answer');

        question.setAttribute('aria-expanded', String(!isExpanded));
        answer.hidden = isExpanded;
    });
});

const currentYear = document.getElementById('current-year');
if (currentYear) {
    currentYear.textContent = new Date().getFullYear();
}
