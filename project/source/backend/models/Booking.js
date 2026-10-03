const db = require("../config/db");

const bookFlight = async (userId, flightId, seats, totalPrice) => {
    const sql = "INSERT INTO bookings (user_id, flight_id, seats, total_price) VALUES (?, ?, ?, ?)";
    await db.execute(sql, [userId, flightId, seats, totalPrice]);
};

const getBookingsByUser = async (userId) => {
    const [rows] = await db.execute("SELECT * FROM bookings WHERE user_id = ?", [userId]);
    return rows;
};

module.exports = { bookFlight, getBookingsByUser };