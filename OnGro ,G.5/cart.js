const item = require("../database/models/Item");
module.exports = (req, res) => {
  try {
    ItemsArray = req.session.cart.items;
    if (ItemsArray.length == 0) {
      EmptyCart = "Cart is Empty";
      return res.render("cart", { EmptyCart });
    }
  } catch {
    EmptyCart = "Cart is Empty";
    return res.render("cart", { EmptyCart });
  }

  price = req.session.cart.price;
  res.render("cart", { ItemsArray, price });
};
