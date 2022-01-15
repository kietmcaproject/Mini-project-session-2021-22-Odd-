const Item = require("../database/models/Item");
module.exports = async (req, res) => {
  const items = await Item.find({
    $and: [{ available: true }, { totalQuantity: { $gt: 0 } }]
  });
  console.log(req.session);
  res.render("index", { items });
};
