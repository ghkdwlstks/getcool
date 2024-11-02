document.addEventListener("DOMContentLoaded", function () {
    const slider = document.querySelector('.product-image-slider');
    const slides = document.querySelectorAll('.product-image-slide');
    const indicators = document.querySelectorAll('.indicator');
    let currentIndex = 0;
    let isDragging = false;
    let startX = 0;
    let currentTranslate = 0;

    function showSlide(index) {
        currentTranslate = -index * 100;
        slider.style.transform = `translateX(${currentTranslate}%)`;
        indicators.forEach((indicator, i) => {
            indicator.classList.toggle('active', i === index);
        });
    }

    function nextSlide() {
        currentIndex = (currentIndex + 1) % slides.length;
        showSlide(currentIndex);
    }

    function prevSlide() {
        currentIndex = (currentIndex - 1 + slides.length) % slides.length;
        showSlide(currentIndex);
    }

    // 터치 이벤트 처리
    slider.addEventListener('touchstart', (e) => {
        startX = e.touches[0].clientX;
        isDragging = true;
        slider.style.transition = 'none'; // 터치할 때 슬라이드 이동 부드럽게 하기 위해 애니메이션 제거
    });

    slider.addEventListener('touchmove', (e) => {
        if (!isDragging) return;
        const currentX = e.touches[0].clientX;
        const diffX = startX - currentX;
        const movePercentage = (diffX / window.innerWidth) * 100;
        slider.style.transform = `translateX(${currentTranslate - movePercentage}%)`;
    });

    slider.addEventListener('touchend', (e) => {
        isDragging = false;
        const diffX = startX - e.changedTouches[0].clientX;
        const threshold = window.innerWidth / 4; // 터치 이동 거리 임계값 설정
        slider.style.transition = 'transform 0.5s ease';

        if (diffX > threshold) {
            nextSlide();
        } else if (diffX < -threshold) {
            prevSlide();
        } else {
            showSlide(currentIndex);
        }
    });

    // 초기 슬라이드 설정
    showSlide(currentIndex);
});

//상세 정보 버튼
document.addEventListener("DOMContentLoaded", function () {
    const detailsButton = document.querySelector('.details-button');
    const detailsContent = document.querySelector('.details-content');
    const imageContainer = document.querySelector('.image-container');

    detailsButton.addEventListener('click', function () {
        detailsContent.classList.toggle('active');
        if (detailsContent.classList.contains('active')) {
            detailsButton.textContent = '숨기기'; // 버튼 텍스트 변경
            imageContainer.style.maxHeight = "100%"; // 이미지 전체 표시
        } else {
            detailsButton.textContent = '더보기';
            imageContainer.style.maxHeight = "calc(100vh - 300px)"; // 이미지 부분만 표시
        }
    });
});

//하단 팝업
document.addEventListener("DOMContentLoaded", function () {
    const decreaseButton = document.getElementById('decrease');
    const increaseButton = document.getElementById('increase');
    const quantityInput = document.getElementById('quantity');
    const estimatedPrice = document.getElementById('estimated-price');
    const productPrice = 10000; // 상품 가격 (할인된 가격)

    // 수량 감소
    decreaseButton.addEventListener('click', function () {
        let quantity = parseInt(quantityInput.value);
        if (quantity > 1) {
            quantity -= 1;
            quantityInput.value = quantity;
            updatePrice(quantity);
        }
    });

    // 수량 증가
    increaseButton.addEventListener('click', function () {
        let quantity = parseInt(quantityInput.value);
        quantity += 1;
        quantityInput.value = quantity;
        updatePrice(quantity);
    });

    // 가격 업데이트
    function updatePrice(quantity) {
        const totalPrice = productPrice * quantity;
        estimatedPrice.textContent = `₩${totalPrice.toLocaleString()}`;
    }
});

document.addEventListener("DOMContentLoaded", function () {
    const popup = document.getElementById('popup');
    const openPopup = document.getElementById('open-popup');
    let startY = 0;
    let currentY = 0;
    let isDragging = false;

    // 팝업 열기
    openPopup.addEventListener('click', function () {
        popup.classList.toggle('active');
        if (popup.classList.contains('active')) {
            // 팝업이 열렸을 때 스크롤 비활성화
            document.body.style.overflow = 'hidden';
        } else {
            // 팝업이 닫히면 스크롤 다시 활성화
            document.body.style.overflow = 'auto';
        }
    });

    // 터치 시작 시 Y 좌표 저장
    popup.addEventListener('touchstart', function (e) {
        startY = e.touches[0].clientY;
        isDragging = true;
    });

    // 터치 이동 감지
    popup.addEventListener('touchmove', function (e) {
        if (!isDragging) return;
        currentY = e.touches[0].clientY;
        const diffY = currentY - startY;

        // 드래그하는 동안 팝업을 아래로 이동시키는 효과
        if (diffY > 0) {
            popup.style.transform = `translateY(${diffY}px)`;
        }
    });

    // 터치 종료 시
    popup.addEventListener('touchend', function (e) {
        isDragging = false;
        const diffY = currentY - startY;

        // 일정 거리 이상 드래그하면 팝업 닫기
        if (diffY > 100) {
            popup.classList.remove('active');
            // 팝업이 닫히면 스크롤 다시 활성화
            document.body.style.overflow = 'auto';
        }

        // 팝업 원래 위치로 복귀
        popup.style.transform = 'translateY(0)';
    });

    // 위로 이동 버튼 관련 코드
    const scrollToTopBtn = document.getElementById('scrollToTopBtn');

    window.addEventListener('scroll', () => {
        if (window.pageYOffset > 300) { // 스크롤이 300px 이상일 때 버튼 보이기
            scrollToTopBtn.classList.add('show');
        } else {
            scrollToTopBtn.classList.remove('show');
        }
    });

    scrollToTopBtn.addEventListener('click', () => {
        window.scrollTo({
            top: 0,
            behavior: 'smooth' // 부드럽게 스크롤
        });
    });
});

