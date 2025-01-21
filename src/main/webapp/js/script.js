let products = [];
let currencyRates = {
    INR: 1,
    USD: 0.013,
    EUR: 0.012,
};
let currentCurrency = "INR";

function addProduct() {
    const productName = document.getElementById("product").value;
    const price = parseFloat(document.getElementById("price").value);
    const quantity = parseInt(document.getElementById("quantity").value);
    const taxRate = parseFloat(document.getElementById("tax").value);

    if (productName && price > 0 && quantity > 0) {
        const productTotal = price * quantity;
        const taxAmount = (taxRate / 100) * productTotal;
        const product = { productName, price, quantity, taxRate, productTotal, taxAmount, totalWithTax: productTotal + taxAmount };
        products.push(product);
        updateInvoice();
    } else {
        alert("Please fill out all fields correctly.");
    }

    // Clear input fields
    document.getElementById("product").value = '';
    document.getElementById("price").value = '';
    document.getElementById("quantity").value = '';
    document.getElementById("tax").value = '';
}

function updateInvoice() {
    const tableBody = document.querySelector("#invoice-table tbody");
    tableBody.innerHTML = "";

    let totalAmount = 0;
    let taxAmount = 0;

    products.forEach((product, index) => {
        totalAmount += product.productTotal;
        taxAmount += product.taxAmount;

        const row = document.createElement("tr");

        row.innerHTML = `
            <td>${product.productName}</td>
            <td>${convertCurrency(product.price)}</td>
            <td>${product.quantity}</td>
            <td>${product.taxRate}%</td>
            <td>${convertCurrency(product.totalWithTax)}</td>
            <td>
                <button onclick="editProduct(${index})">Edit</button>
                <button onclick="removeProduct(${index})">Remove</button>
            </td>
        `;

        tableBody.appendChild(row);
    });

    document.getElementById("total-amount").textContent = convertCurrency(totalAmount);
    document.getElementById("tax-amount").textContent = convertCurrency(taxAmount);
    updateGrandTotal(totalAmount, taxAmount);
}

function editProduct(index) {
    const product = products[index];
    document.getElementById("product").value = product.productName;
    document.getElementById("price").value = product.price;
    document.getElementById("quantity").value = product.quantity;
    document.getElementById("tax").value = product.taxRate;
    products.splice(index, 1); // Remove the existing product
}

function removeProduct(index) {
    products.splice(index, 1);
    updateInvoice();
}

function applyDiscount() {
    const discountRate = parseFloat(document.getElementById("discount").value) || 0;
    const totalAmount = parseFloat(document.getElementById("total-amount").textContent.replace(/[^\d.-]/g, ''));
    updateGrandTotal(totalAmount, discountRate);
}

function updateGrandTotal(totalAmount, taxAmount) {
    const discountRate = parseFloat(document.getElementById("discount").value) || 0;
    const discountAmount = (discountRate / 100) * totalAmount;
    const grandTotal = totalAmount + taxAmount - discountAmount;
    document.getElementById("grand-total").textContent = convertCurrency(grandTotal);
}

function finalizeInvoice() {
    const totalAmount = parseFloat(document.getElementById("total-amount").textContent.replace(/[^\d.-]/g, ''));
    const grandTotal = parseFloat(document.getElementById("grand-total").textContent.replace(/[^\d.-]/g, ''));

    if (totalAmount > 0) {
        alert("Invoice finalized. Grand total: " + convertCurrency(grandTotal));
        saveInvoice(grandTotal);
    } else {
        alert("No products to finalize.");
    }
}

function saveInvoice(grandTotal) {
    const invoice = {
        products: products,
        grandTotal: grandTotal,
        date: new Date().toLocaleString(),
    };

    const savedInvoices = JSON.parse(localStorage.getItem('invoices')) || [];
    savedInvoices.push(invoice);
    localStorage.setItem('invoices', JSON.stringify(savedInvoices));
    displaySavedInvoices();
    clearInvoice();
}

function displaySavedInvoices() {
    const savedInvoices = JSON.parse(localStorage.getItem('invoices')) || [];
    const invoiceList = document.getElementById("invoice-list");
    invoiceList.innerHTML = "";
    savedInvoices.forEach((invoice, index) => {
        const listItem = document.createElement("li");
        listItem.innerHTML = `
            <strong>Invoice #${index + 1}</strong> - ${invoice.date} <br>
            Total: ${convertCurrency(invoice.grandTotal)}
        `;
        invoiceList.appendChild(listItem);
    });
}

function clearInvoice() {
    products = [];
    updateInvoice();
    document.getElementById("discount").value = "";
}

function updateCurrency() {
    currentCurrency = document.getElementById("currency").value;
    updateInvoice();
}

function convertCurrency(amount) {
    return `${currentCurrency} ${amount.toFixed(2) * currencyRates[currentCurrency]}`;
}

window.onload = displaySavedInvoices;
