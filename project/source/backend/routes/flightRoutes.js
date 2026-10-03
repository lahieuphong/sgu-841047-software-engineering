const express = require("express");
const pool = require("../config/db"); // Kết nối MySQL
const router = express.Router();

// 🛫 Lấy danh sách chuyến bay
router.get("/", async (req, res) => {
    try {
        const [flights] = await pool.query("SELECT * FROM flights");
        res.json(flights);
    } catch (error) {
        console.error("Lỗi khi lấy danh sách chuyến bay:", error);
        res.status(500).json({ message: "Lỗi server!" });
    }
});

// 🆕 Thêm chuyến bay mới
router.post("/add", async (req, res) => {
    const { airline, from, to, date, time, price, seatsAvailable } = req.body;

    if (!airline || !from || !to || !date || !time || !price || !seatsAvailable) {
        return res.status(400).json({ message: "Vui lòng nhập đầy đủ thông tin!" });
    }

    try {
        const [result] = await pool.query(
            "INSERT INTO flights (airline, `from`, `to`, date, time, price, seatsAvailable) VALUES (?, ?, ?, ?, ?, ?, ?)",
            [airline, from, to, date, time, price, seatsAvailable]
        );

        res.status(201).json({ message: "Chuyến bay đã được thêm!", flightId: result.insertId });
    } catch (error) {
        console.error("Lỗi khi thêm chuyến bay:", error);
        res.status(500).json({ message: "Lỗi server!" });
    }
});

module.exports = router;