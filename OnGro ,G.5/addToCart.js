const transaction = require("../database/models/Transaction");
const Item = require("../database/models/Item");

module.exports = async (req, res) => {
  itemId = req.body._id;
  item_price = req.body.price;
  item_name = req.body.name;
  item_imgPath = req.body.imagePath;
  console.log(item_imgPath);
  if (!req.session.userId) {
    return res.redirect("/login");
  }
  userId = req.session.userId;
  console.log(new Date());

  if (req.session.cart) {
    console.log("ALready Have a cart");
    Cart = req.session.cart;
    alreadyPresent = false;

    for (var i in Cart.items) {
      total = 0;
      const item = await Item.findById(Cart.items[i].itemId);
      quantityAvailable = item.totalQuantity;
      console.log(quantityAvailable);
      console.log(Cart.items[i].itemId);
      if (Cart.items[i].itemId == itemId) {
        if (Cart.items[i].quantity < quantityAvailable) {
          price = parseFloat(Cart.items[i].price, 10);
          Cart.items[i].price =
            (price + parseFloat(item_price, 10)).toFixed(2) + "";
          Cart.price =
            (parseFloat(Cart.price, 10) + parseFloat(item_price, 10)).toFixed(
              2
            ) + "";
          Cart.items[i].quantity = Cart.items[i].quantity + 1;
        }
        alreadyPresent = true;
      }
    }
    if (!alreadyPresent) {
      Cart.items.push({
        itemId: itemId,
        quantity: 1,
        price: item_price,
        name: item_name,
        imagePath: item_imgPath
      });
      Cart.price =
        (parseFloat(Cart.price, 10) + parseFloat(item_price, 10)).toFixed(2) +
        "";
    }
    req.session.cart = Cart;
    console.log("Cart is here :", Cart);
  } else {
    console.log("Creating a cart");
    req.session.cart = {
      items: Array({
        itemId: itemId,
        quantity: 1,
        price: item_price,
        name: item_name,
        imagePath: item_imgPath
      }),
      price: item_price
    };
  }
  res.redirect("/cart");
};
