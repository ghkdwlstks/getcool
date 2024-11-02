// 수량 및 가격 업데이트 기능
document.querySelectorAll('.wishlist-item').forEach(item => {
    const quantityInput = item.querySelector('.item-quantity');
    const priceElement = item.querySelector('.item-price');
    const basePrice = parseInt(priceElement.getAttribute('data-price'));

    // 수량 증가/감소 이벤트
    item.querySelector('.increase-btn').addEventListener('click', () => {
        quantityInput.value = parseInt(quantityInput.value) + 1;
        updatePrice();
    });

    item.querySelector('.decrease-btn').addEventListener('click', () => {
        if (parseInt(quantityInput.value) > 1) {
            quantityInput.value = parseInt(quantityInput.value) - 1;
            updatePrice();
        }
    });

    // 가격 업데이트 함수
    function updatePrice() {
        const totalPrice = basePrice * parseInt(quantityInput.value);
        priceElement.textContent = `${totalPrice.toLocaleString()}원`;
    }
});

// 저장 버튼 클릭 이벤트 리스너
document.getElementById('save-cart-btn').addEventListener('click', async () => {
    console.log('저장 버튼 클릭됨');  // 클릭 이벤트 확인

    const items = document.querySelectorAll('.wishlist-item');
    const cartData = Array.from(items).map(item => {
        return {
            product_id: item.getAttribute('data-product-id'),
            quantity: parseInt(item.querySelector('.item-quantity').value)
        };
    });

    console.log('전송할 데이터:', cartData);  // 전송할 데이터 확인

    try {
        const response = await fetch('/api/cart/update', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ items: cartData }),
            credentials: 'include' // 세션 쿠키 포함
        });

        console.log('서버 응답 상태:', response.status);  // 서버 응답 상태 확인
        if (response.ok) {
            alert('장바구니가 저장되었습니다.');
        } else {
            alert('장바구니 저장에 실패했습니다.');
        }
    } catch (error) {
        console.error('Error:', error);
        alert('오류가 발생했습니다.');
    }
});


