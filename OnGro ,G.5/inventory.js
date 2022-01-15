const Item = require("../database/models/Item");
module.exports = async (req, res) => {
  const items = await Item.find({});
  console.log(req.session);
  res.render("inventory", { items });
};
