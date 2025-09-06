/* Filename: viral-beauty-kit.js | Folder: assets */
document.addEventListener('DOMContentLoaded', () => {
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

    // Interactive Cart (Placeholder Functionality)
    const cartCountElement = document.getElementById('cart-count');
    const quickAddButtons = document.querySelectorAll('.quick-add');
    let cartItemCount = cartCountElement ? parseInt(cartCountElement.textContent, 10) : 0; // In a real theme, this would come from the cart object

    if (cartCountElement && quickAddButtons.length) {
        quickAddButtons.forEach(button => {
            button.addEventListener('click', () => {
                cartItemCount++;
                cartCountElement.textContent = cartItemCount;
                cartCountElement.classList.add('cart-count-updated');
                setTimeout(() => {
                    cartCountElement.classList.remove('cart-count-updated');
                }, 500);
            });
        });
    }
});