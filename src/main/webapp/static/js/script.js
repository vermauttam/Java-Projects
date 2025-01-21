document.getElementById('userForm').addEventListener('submit', function(event) {
    event.preventDefault(); // Prevent form submission

    // Validate form fields
    const name = document.getElementById('name').value;
    const email = document.getElementById('email').value;
    const country = document.getElementById('country').value;
    const password = document.getElementById('password').value;

    // Basic validation checks
    if (name === '' || email === '' || country === '' || password === '') {
        alert('All fields are required!');
        return;
    }

    // Password strength check (example: minimum length, one uppercase letter, and one digit)
    const passwordRegex = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,20}$/;
    if (!passwordRegex.test(password)) {
        alert('Password must be between 6-20 characters and include at least one number and one uppercase letter.');
        return;
    }

    // Simple email validation regex
    const emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
    if (!emailRegex.test(email)) {
        alert('Please enter a valid email address.');
        return;
    }

    // If validation passes, proceed with form submission (example with fetch)
    alert('Form submitted successfully!');

    // You could replace this alert with an AJAX call like below:
    // fetch('/submitForm', {
    //     method: 'POST',
    //     body: JSON.stringify({ name, email, country, password }),
    //     headers: { 'Content-Type': 'application/json' }
    // })
    // .then(response => {
    //     if (!response.ok) {
    //         throw new Error('Form submission failed');
    //     }
    //     return response.json();
    // })
    // .then(data => {
    //     alert('Form submitted successfully!');
    //     document.getElementById('userForm').reset(); // Clear the form
    // })
    // .catch(error => {
    //     alert('Error submitting form: ' + error.message);
    // });
});
