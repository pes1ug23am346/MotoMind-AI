const mongoose = require("mongoose");

const vehicleSchema = new mongoose.Schema(
  {
    owner: { type: mongoose.Schema.Types.ObjectId, ref: "User", required: true },
    nickname: { type: String, required: true, trim: true },
    make: { type: String, required: true },
    model: { type: String, required: true },
    year: { type: Number },
    regNumber: { type: String, trim: true },
    fuelType: { type: String, enum: ["petrol", "diesel", "electric", "hybrid"], default: "petrol" },
    odometer: { type: Number, default: 0 },
    imageUrl: { type: String, default: "" },
  },
  { timestamps: true }
);

module.exports = mongoose.model("Vehicle", vehicleSchema);
