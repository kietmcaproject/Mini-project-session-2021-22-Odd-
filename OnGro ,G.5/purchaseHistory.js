const Transaction = require("../database/models/Transaction");

module.exports = async (req, res) => {
  const transaction = await Transaction.find({
    userId: req.session.userId
  }).sort({ timestamp: -1 });
  console.log(transaction);
  res.render("purchaseHistory", { transaction });
};
