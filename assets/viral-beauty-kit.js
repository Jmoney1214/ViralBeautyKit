document.addEventListener('DOMContentLoaded', () => {
    // Initialize Lucide icons if they don't render automatically
    if (typeof lucide !== 'undefined') {
        lucide.createIcons();
    }

    // Mobile menu toggle
    const mobileMenuButton = document.getElementById('mobile-menu-button');
    const mobileMenu = document.getElementById('mobile-menu');
    if (mobileMenuButton && mobileMenu) {
        mobileMenuButton.addEventListener('click', (e) => {
            e.stopPropagation();
            mobileMenu.classList.toggle('hidden');
        });
    }

    // Add shadow to header on scroll
    const header = document.getElementById('header');
    if (header) {
        window.addEventListener('scroll', () => {
            if (window.scrollY > 10) {
                header.classList.add('shadow-lg');
            } else {
                header.classList.remove('shadow-lg');
            }
        });
    }

    // NOTE: The cart count is now handled by Shopify's {{ cart.item_count }}
    // The "Quick Add" functionality will require more advanced JavaScript
    // to interact with Shopify's Cart API. The code below is a placeholder
    // for visual feedback but does not add to the actual Shopify cart.
    
    const quickAddButtons = document.querySelectorAll('.quick-add');
    
    quickAddButtons.forEach(button => {
        button.addEventListener('click', () => {
            // Provide visual feedback
            const originalText = button.textContent;
            button.textContent = 'Added!';
            button.classList.add('bg-accent');
            setTimeout(() => {
                button.textContent = originalText;
                button.classList.remove('bg-accent');
            }, 1500);

            // To make this functional, you would add an AJAX API call here
            // to add the product variant to the cart, then update the cart count.
            // Example:
            //
            // let formData = {
            //  'items': [{
            //   'id': VARIANT_ID_HERE,
            //   'quantity': 1
            //  }]
            // };
            //
            // fetch('/cart/add.js', {
            //   method: 'POST',
            //   headers: { 'Content-Type': 'application/json' },
            //   body: JSON.stringify(formData)
            // })
            // .then(response => response.json())
            // .then(data => {
            //   // Update cart count display
            //   document.getElementById('cart-count').textContent = data.item_count;
            // })
            // .catch((error) => {
            //   console.error('Error:', error);
            // });
        });
    });
});