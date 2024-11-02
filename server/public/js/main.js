document.addEventListener("DOMContentLoaded", function () {
    const adBanner = document.querySelector('.ad-banner');
    const slides = document.querySelectorAll('.ad-slide');
    const indicators = document.querySelectorAll('.indicator');
    let currentIndex = 0;
    const slideIntervalTime = 4000; // 4초 간격으로 슬라이드 전환
    let startX = 0;
    let isDragging = false;
    let autoSlide;

    function startAutoSlide() {
        autoSlide = setInterval(nextSlide, slideIntervalTime);
    }

    function stopAutoSlide() {
        clearInterval(autoSlide);
    }

    function showSlide(index) {
        adBanner.style.transform = `translateX(-${index * 100}%)`;

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

    // 자동 슬라이드 시작
    startAutoSlide();

    // 터치 이벤트 처리
    adBanner.addEventListener('touchstart', (e) => {
        stopAutoSlide(); // 터치 중에는 자동 슬라이드 정지
        startX = e.touches[0].clientX;
        isDragging = true;
    });

    adBanner.addEventListener('touchmove', (e) => {
        if (!isDragging) return;
        const currentX = e.touches[0].clientX;
        const diffX = startX - currentX;

        if (diffX > 50) {
            nextSlide();
            isDragging = false;
        } else if (diffX < -50) {
            prevSlide();
            isDragging = false;
        }
    });

    adBanner.addEventListener('touchend', () => {
        isDragging = false;
        startAutoSlide(); // 터치가 끝난 후 자동 슬라이드 재개
    });
});
