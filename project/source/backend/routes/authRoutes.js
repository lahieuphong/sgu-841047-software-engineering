const express = require("express");
const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");
const { body, validationResult } = require("express-validator");
const pool = require("../config/db");

const router = express.Router();

// 🔹 Đăng ký người dùng
router.post(
    "/register",
    [
        body("name").notEmpty().withMessage("Tên không được để trống"),
        body("email").isEmail().withMessage("Email không hợp lệ"),
        body("password").isLength({ min: 6 }).withMessage("Mật khẩu ít nhất 6 ký tự"),
    ],
    async (req, res) => {
        const errors = validationResult(req);
        if (!errors.isEmpty()) {
            return res.status(400).json({ errors: errors.array() });
        }

        const { name, email, password } = req.body;

        try {
            // Kiểm tra email đã tồn tại chưa
            const [existingUser] = await pool.query("SELECT * FROM users WHERE email = ?", [email]);
            if (existingUser.length > 0) {
                return res.status(400).json({ message: "Email đã được sử dụng!" });
            }

            // Mã hóa mật khẩu
            const salt = await bcrypt.genSalt(10);
            const hashedPassword = await bcrypt.hash(password, salt);

            // Thêm người dùng vào database
            const [result] = await pool.query("INSERT INTO users (name, email, password) VALUES (?, ?, ?)", [
                name,
                email,
                hashedPassword,
            ]);

            res.status(201).json({ message: "Đăng ký thành công!", userId: result.insertId });
        } catch (error) {
            console.error(error);
            res.status(500).json({ message: "Lỗi server!" });
        }
    }
);

// 🔹 Đăng nhập người dùng
router.post(
    "/login",
    [
        body("email").isEmail().withMessage("Email không hợp lệ"),
        body("password").notEmpty().withMessage("Mật khẩu không được để trống"),
    ],
    async (req, res) => {
        const errors = validationResult(req);
        if (!errors.isEmpty()) {
            return res.status(400).json({ errors: errors.array() });
        }

        const { email, password } = req.body;

        try {
            // Kiểm tra email có tồn tại không
            const [users] = await pool.query("SELECT * FROM users WHERE email = ?", [email]);
            if (users.length === 0) {
                return res.status(400).json({ message: "Email không tồn tại!" });
            }

            const user = users[0];

            // Kiểm tra mật khẩu
            const isMatch = await bcrypt.compare(password, user.password);
            if (!isMatch) {
                return res.status(400).json({ message: "Sai mật khẩu!" });
            }

            // Tạo JWT token
            const token = jwt.sign({ id: user.id, email: user.email }, "secret_key", { expiresIn: "1h" });

            res.json({ message: "Đăng nhập thành công!", token });
        } catch (error) {
            console.error(error);
            res.status(500).json({ message: "Lỗi server!" });
        }
    }
);

module.exports = router;


