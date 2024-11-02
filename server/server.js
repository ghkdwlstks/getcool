// server.js
const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const path = require('path');
const db = require('./db'); // MySQL 연결 설정이 포함된 파일
const wishlistRoutes = require('./wishlist'); // 경로가 올바른지 확인
const app = express();
const port = 3000;

// 미들웨어 설정
app.use(cors());
app.use(bodyParser.json());
app.use(express.static(path.join(__dirname, 'public'))); // 정적 파일 제공 (HTML, CSS, JS)


// 라우터 설정
app.use(wishlistRoutes);

// 새로운 API 엔드포인트 - cart 테이블에 데이터 추가

app.post('/api/cart', (req, res) => {
  console.log("POST request received at /api/cart");
  console.log("Request Body:", req.body);

  const { buyer_id, product_id, quantity, price } = req.body;

  // 수신된 price 확인
  console.log("Received Price:", price); 

  const query = `
      INSERT INTO cart 
      (buyer_id, product_id, quantity, price)
      VALUES (?, ?, ?, ?)
  `;

  db.query(query, [buyer_id, product_id, quantity, price], (err, result) => {
      if (err) {
          console.error("Database insert error:", err);
          res.status(500).send("Database insert error");
          return;
      }
      console.log("Product added to cart successfully");
      res.status(200).json({ message: "Product added to cart successfully" });
  });
});



// 서버 시작
app.listen(port, () => {
  console.log(`Server is running at http://localhost:${port}`);
});
