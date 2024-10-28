const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');
const mysql = require('mysql');
const bcrypt = require('bcryptjs');

const app = express();
const PORT = 3000;

// MySQL 데이터베이스 연결 설정
const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'Mdbals@5525',
    database: 'myapp_db'
});

// 데이터베이스 연결
db.connect(err => {
    if (err) {
        console.error('데이터베이스 연결 실패:', err);
        return;
    }
    console.log('데이터베이스에 연결되었습니다.');
});

// Middleware 설정
//app.use(cors());
app.use(cors({
    origin: '*', // 모든 출처 허용
    methods: ['GET', 'POST'], // 허용할 HTTP 메소드
    credentials: true // 필요한 경우 true로 설정
}));



app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

// 회원가입 API (여기서는 간단하게 설명)
app.post('/api/register', (req, res) => {
    const { name, email, password, user_type, phone_number, address } = req.body;

    // 이메일 중복 체크
    db.query('SELECT * FROM users WHERE email = ?', [email], (err, results) => {
        if (err) {
            console.error('이메일 중복 체크 오류:', err);
            return res.status(500).json({ message: '서버 오류 발생', error: err.message });
        }
        if (results.length > 0) {
            return res.status(400).json({ message: '이미 등록된 이메일입니다.' });
        }

        const hashedPassword = bcrypt.hashSync(password, 10);

        db.query(
            'INSERT INTO users (name, email, password, user_type, phone_number, address) VALUES (?, ?, ?, ?, ?, ?)',
            [name, email, hashedPassword, user_type, phone_number, address],
            (err, results) => {
                if (err) {
                    console.error('회원가입 오류:', err);
                    return res.status(500).json({ message: '회원가입 요청 실패', error: err.message });
                }
                console.log(`회원가입 성공: ${name} (${email})`);
                return res.status(201).json({ message: '회원가입 성공!' });
            }
        );
    });
});

// 로그인 API
app.post('/api/login', (req, res) => {
    const { email, password } = req.body;

    // 이메일 확인
    db.query('SELECT * FROM users WHERE email = ?', [email], (err, results) => {
        if (err) {
            console.error('서버 오류:', err);
            return res.status(500).json({ message: '서버 오류가 발생했습니다.' });
        }

        if (results.length === 0) {
            return res.status(401).json({ message: '회원이 아닙니다.' }); // 이메일이 없는 경우
        }

        const user = results[0];

        // 비밀번호 확인
        const isPasswordValid = bcrypt.compareSync(password, user.password);
        if (!isPasswordValid) {
            return res.status(401).json({ message: '비밀번호가 틀렸습니다.' }); // 비밀번호 불일치
        }

        // 로그인 성공
        return res.status(200).json({ message: '로그인 성공!' });
    });
});

// 서버 시작
app.listen(PORT, () => {
    console.log(`서버가 http://localhost:${PORT}에서 실행 중입니다.`);
});