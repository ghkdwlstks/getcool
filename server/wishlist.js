// wishlist.js
const express = require('express');
const db = require('./db'); // MySQL 연결 설정이 포함된 파일
const router = express.Router();

// 가장 최근에 추가된 cart 항목을 가져오는 API
router.get('/api/wishlist', (req, res) => {
    console.log("GET request received at /api/wishlist");

    const query = `
        SELECT * FROM cart 
        ORDER BY cart_id DESC 
        LIMIT 1
    `;

    db.query(query, (err, result) => {
        if (err) {
            console.error("Database query error:", err); // 오류 로그
            res.status(500).json({ error: "Database query error" });
            return;
        }
        console.log("Query result:", result); // 쿼리 결과 확인
        res.json(result[0] || {}); // 가장 최근 항목 반환
    });
});

module.exports = router;
