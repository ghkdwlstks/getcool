// 로그인 처리 함수
async function login(name, password) {
    const response = await fetch('http://localhost:3000/api/login', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ name, password })
    });

    if (response.ok) {
        const data = await response.json();
        alert('로그인 성공');
        // 로그인 성공 후, 장바구니 목록 불러오기
        fetchCart();
    } else {
        alert('로그인 실패');
    }
}

// 회원가입 처리 함수
async function register(name, password) {
    const response = await fetch('http://localhost:3000/api/register', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ name, password })
    });

    if (response.ok) {
        alert('회원가입 성공');
    } else {
        alert('회원가입 실패');
    }
}

// 회원가입 버튼 클릭 이벤트
document.getElementById('registerButton').addEventListener('click', () => {
    const name = document.getElementById('registerName').value;
    const password = document.getElementById('registerPassword').value;
    register(name, password);
});

// 장바구니 목록 가져오기
async function fetchCart() {
    const response = await fetch('http://localhost:3000/api/cart');
    if (response.ok) {
        const cartItems = await response.json();
        const wishlistContainer = document.querySelector('.wishlist');
        wishlistContainer.innerHTML = '<h3>장바구니</h3>';

        cartItems.forEach(item => {
            const wishlistItem = document.createElement('div');
            wishlistItem.className = 'wishlist-item';
            const productNames = {
                1: "사과",
                2: "바나나",
                3: "체리"
            };
            const productPrices = {
                1: 1000,
                2: 1500,
                3: 2000
            };
            wishlistItem.innerHTML = `
                <img src="item-placeholder.png" alt="상품 이미지">
                <div class="item-details">
                    <p>${productNames[item.product_id]} (${item.quantity})</p>
                    <p>${productPrices[item.product_id] * item.quantity}원</p>
                </div>
                <button class="remove-button" onclick="removeItem(${item.cart_id})">제거</button>
            `;
            wishlistContainer.appendChild(wishlistItem);
        });
    } else {
        console.error('장바구니 목록 가져오기 실패');
    }
}
