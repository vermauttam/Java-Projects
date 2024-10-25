package BillingSoftware;
// Customer class
class Customer {
    private String name;
    private String email;

    public Customer(String name, String email) {
        this.name = name;
        this.email = email;
    }

    public String getCustomerDetails() {
        return "Customer: " + name + ", Email: " + email;
    }
}

// Invoice class (Parent class)
class Invoice {
    protected int invoiceId;
    protected Customer customer;
    protected double amount;

    public Invoice(int invoiceId, Customer customer, double amount) {
        this.invoiceId = invoiceId;
        this.customer = customer;
        this.amount = amount;
    }

    public String generateInvoice() {
        return "Invoice ID: " + invoiceId + ", " + customer.getCustomerDetails() + ", Amount: $" + amount;
    }
}

// RecurringInvoice class (Child class)
class RecurringInvoice extends Invoice {
    private String billingCycle;

    public RecurringInvoice(int invoiceId, Customer customer, double amount, String billingCycle) {
        super(invoiceId, customer, amount);
        this.billingCycle = billingCycle;
    }

    @Override
    public String generateInvoice() {
        return super.generateInvoice() + ", Billing Cycle: " + billingCycle;
    }
}

// Payment class with Polymorphism
abstract class Payment {
    abstract void processPayment();
}

class CreditCardPayment extends Payment {
    @Override
    void processPayment() {
        System.out.println("Processing Credit Card Payment...");
    }
}

// Main class to run the example
public class BillingSoftware {
    public static void main(String[] args) {
        Customer customer1 = new Customer("John Doe", "john@example.com");
        Invoice invoice1 = new Invoice(101, customer1, 500.00);
        RecurringInvoice recurringInvoice1 = new RecurringInvoice(102, customer1, 300.00, "Monthly");

        System.out.println(invoice1.generateInvoice());
        System.out.println(recurringInvoice1.generateInvoice());

        Payment payment = new CreditCardPayment();
        payment.processPayment();
    }
}
