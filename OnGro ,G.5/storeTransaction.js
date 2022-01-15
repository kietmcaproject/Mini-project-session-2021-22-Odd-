const transaction = require("../database/models/Transaction");
const Item = require("../database/models/Item");
module.exports = (req, res) => {
  itemId = req.session.cart;
  address = req.body.address;
  console.log(address);
  userId = req.session.userId;
  CartItems = req.session.cart.items;
  CartPrice = req.session.cart.price;
  currentDate = new Date();
  req.session.cart = "";
  if (CartPrice > 0) {
    transaction.create(
      {
        userId,
        items: CartItems,
        timestamp: currentDate,
        totalPrice: CartPrice,
        deliveryAddress: address
      },
      (error, transaction) => {
        if (error) {
          console.log(error);
        } else {
          for (var i in CartItems) {
            Item.update(
              { _id: CartItems[i].itemId },
              {
                $inc: { totalQuantity: -CartItems[i].quantity }
              },
              (error, item) => {
                console.log(error);
              }
            );
          }
        }
        res.render("transactionCompleted", {
          userId,
          CartItems,
          currentDate,
          CartPrice,
          address
        });
      }
    );
  } else {
    var alreadyPurchased = 1;
    res.render("transactionCompleted", { alreadyPurchased });
  }
};
