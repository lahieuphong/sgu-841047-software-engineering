const express = require("express");
const pool = require("../config/db");
const jwt = require("jsonwebtoken");
const router = express.Router();

// Middleware kiểm tra token
const verifyToken = (req, res, next) => {
    const authHeader = req.headers["authorization"];
    if (!authHeader) return res.status(401).json({ message: "Không có token!" });

    const token = authHeader.split(" ")[1];
    if (!token) return res.status(401).json({ message: "Token không hợp lệ!" });

    jwt.verify(token, process.env.JWT_SECRET, (err, decoded) => {
        if (err) return res.status(403).json({ message: "Token không hợp lệ!" });
        req.user = decoded;
        next();
    });
};

// 📌 API đặt vé máy bay (yêu cầu xác thực)
router.post("/", verifyToken, async (req, res) => {
    const { flight_id, seats } = req.body;

    if (!flight_id || !seats) {
        return res.status(400).json({ message: "Vui lòng nhập đầy đủ thông tin đặt vé!" });
    }

    try {
        // Kiểm tra chuyến bay có tồn tại không
        const [flight] = await pool.query("SELECT * FROM flights WHERE id = ?", [flight_id]);
        if (flight.length === 0) {
            return res.status(404).json({ message: "Chuyến bay không tồn tại!" });
        }

        // Kiểm tra số ghế còn trống
        if (flight[0].seatsAvailable < seats) {
            return res.status(400).json({ message: "Không đủ ghế trống!" });
        }

        // Thêm đặt vé vào cơ sở dữ liệu
        const [booking] = await pool.query(
            "INSERT INTO bookings (user_id, flight_id, seats) VALUES (?, ?, ?)",
            [req.user.id, flight_id, seats]
        );

        // Cập nhật số ghế trống
        await pool.query(
            "UPDATE flights SET seatsAvailable = seatsAvailable - ? WHERE id = ?",
            [seats, flight_id]
        );

        res.status(201).json({ message: "Đặt vé thành công!", bookingId: booking.insertId });
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: "Lỗi server!" });
    }
});

// 📌 API lấy danh sách vé đã đặt của người dùng (yêu cầu xác thực)
router.get("/my-bookings", verifyToken, async (req, res) => {
    try {
        const [bookings] = await pool.query(
            "SELECT b.id, f.airline, f.from_location, f.to_location, f.date, f.time, b.seats " +
            "FROM bookings b " +
            "JOIN flights f ON b.flight_id = f.id " +
            "WHERE b.user_id = ?",
            [req.user.id]
        );

        res.json(bookings);
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: "Lỗi server!" });
    }
});

module.exports = router;
