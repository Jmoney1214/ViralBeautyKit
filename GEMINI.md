# Project Briefing: ViralBeautyKit Shopify Theme

## 1. High-Level Goal
To create a modern, clean, and high-performance custom Shopify theme for "ViralBeautyKit.com". The design is inspired by the aesthetic of beautyblender.com, focusing on a bold hero section, a clean product grid, and strong brand colors.

## 2. Core Technologies
- **Templating:** Shopify Liquid (`.liquid`)
- **Styling:** Tailwind CSS (loaded via CDN).
- **Custom CSS:** A supplementary file at `assets/viral-beauty-kit.css` for animations and specific styles not easily achieved with Tailwind.
- **JavaScript:** Vanilla JavaScript (modern ES6+) for all client-side interactivity, located in `assets/viral-beauty-kit.js`. No jQuery or other external JS frameworks are used.
- **Icons:** Lucide icons, loaded via CDN.

## 3. Brand & Style Guide
- **Primary Color (Fuchsia):** `#D946EF`
- **Accent Color (Lime Green):** `#BEF264`
- **Typography:** 'Inter' font family. Use bold (`font-bold`) and extra-bold (`font-extrabold` or `font-black`) weights for headings.
- **Layout:** Clean, spacious, with a focus on a grid-based structure for products. The design must be fully responsive and mobile-first.

## 4. Key Architectural Rules
- **File Structure:** Adhere strictly to the standard Shopify theme structure:
    - Main layout in `layout/theme.liquid`.
    - Page templates in `templates/`.
    - Reusable components (like header/footer) go into `snippets/`.
    - All CSS and JS files must be in the `assets/` directory.
- **JavaScript Logic:**
    - All scripts must be wrapped in a `document.addEventListener('DOMContentLoaded', () => { ... });` block.
    - Interactivity to implement includes: mobile menu toggle, sticky header with shadow on scroll, and a cart counter that updates when "Quick Add" buttons are clicked.
- **Critical Don'ts:**
    - **DO NOT** use the `alert()` or `window.confirm()` functions. All user notifications must be done through UI elements on the page.
    - **DO NOT** use placeholder images (`placehold.co`) in final component generation. Use descriptive text or colored divs as placeholders if needed.

## 5. Important Code Snippets & Patterns

### Standard Product Card Structure:
```html
<!-- Use this structure for product cards -->
<div class="bg-white rounded-lg overflow-hidden group text-center product-card">
    <div class="relative">
       <img src="{{ product.featured_image | image_url: width: 400 }}" alt="{{ product.featured_image.alt | escape }}" class="w-full h-64 object-cover">
       <button class="quick-add absolute bottom-4 left-1/2 -translate-x-1/2 w-4/5 bg-white text-gray-900 font-bold py-3 rounded-md opacity-0 group-hover:opacity-100 transition-opacity">Quick Add</button>
    </div>
    <div class="p-6">
        <h3 class="font-semibold text-lg mb-1">{{ product.title }}</h3>
        <p class="text-gray-500 text-sm mb-2">Short product description</p>
        <p class="text-gray-900 font-bold text-lg">{{ product.price | money }}</p>
    </div>
</div>