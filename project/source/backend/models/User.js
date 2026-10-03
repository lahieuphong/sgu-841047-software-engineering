const db = require("../config/db");

const registerUser = async (name, email, password) => {
    const sql = "INSERT INTO users (name, email, password) VALUES (?, ?, ?)";
    await db.execute(sql, [name, email, password]);
};

const findUserByEmail = async (email) => {
    const [rows] = await db.execute("SELECT * FROM users WHERE email = ?", [email]);
    return rows[0];
};

module.exports = { registerUser, findUserByEmail };