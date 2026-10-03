const jwt = require("jsonwebtoken");

const authenticateToken = (req, res, next) => {
    const authHeader = req.header("Authorization");
    if (!authHeader || !authHeader.startsWith("Bearer ")) {
        console.log("❌ Không có token hoặc sai định dạng!");
        return res.status(401).json({ message: "Không có token, quyền truy cập bị từ chối!" });
    }

    const token = authHeader.split(" ")[1];
    console.log("🔍 Token nhận được từ request:", token);

    try {
        const decoded = jwt.verify(token, process.env.JWT_SECRET);
        console.log("✅ Token hợp lệ! Dữ liệu giải mã:", decoded);
        req.user = decoded;
        next();
    } catch (error) {
        console.error("❌ Lỗi xác thực token:", error.message);
        return res.status(403).json({ message: "Token không hợp lệ!", error: error.message });
    }
};

module.exports = authenticateToken;