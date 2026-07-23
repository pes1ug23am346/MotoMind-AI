require("dotenv").config();
const express = require("express");
const cors = require("cors");
const connectDB = require("./config/db");

const authRoutes = require("./routes/authRoutes");
const vehicleRoutes = require("./routes/vehicleRoutes");

const app = express();

app.use(cors());
app.use(express.json());

app.get("/", (req, res) => res.json({ status: "MotoMind AI API running" }));

app.use("/api/auth", authRoutes);
app.use("/api/vehicles", vehicleRoutes);

// 404 handler
app.use((req, res) => res.status(404).json({ message: "Route not found" }));

const PORT = process.env.PORT || 5000;

connectDB().then(() => {
  app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
});
