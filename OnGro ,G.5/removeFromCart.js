const transaction = require("../database/models/Transaction");
module.exports = (req, res) => {
  itemId = req.body.itemId;

  if (!req.session.userId) {
    return res.redirect("/login");
  }
  userId = req.session.userId;

  if (req.session.cart) {
    console.log("Removing from carts");
    Cart = req.session.cart;
    console.log(Cart);
    alreadyPresent = false;
    for (var i in Cart.items) {
      console.log(Cart.items[i].itemId);
      if (Cart.items[i].itemId == itemId) {
        console.log("My Cart");
        console.log(Cart);
        price = parseFloat(Cart.items[i].price, 10);
        Cart.price = parseFloat(Cart.price, 10) - price + "";
        Cart.items.splice(i, 1);
        console.log(Cart);
        req.session.cart = Cart;
      }
    }
    console.log("Cart is here :", Cart);
  }

  res.redirect("/cart");
};
