document.getElementById('userForm').addEventListener('submit', function(event) {
    event.preventDefault(); // Prevent form submission

    // Validate form fields
    const name = document.getElementById('name').value;
    const email = document.getElementById('email').value;
    const country = document.getElementById('country').value;
    const password = document.getElementById('password').value;

    if (name === '' || email === '' || country === '' || password === '') {
        alert('All fields are required!');
        return;
    }

    // If validation passes, you can proceed with form submission (e.g., via AJAX)
    alert('Form submitted successfully!');
});