const bcrypt = require("bcrypt-nodejs");
const user = require("../database/models/User");
module.exports = (req, res) => {
  console.log(req.body);
  const { _id, password } = req.body;
  user.findOne({ _id }, (error, user) => {
    if (user) {
      bcrypt.compare(password, user.password, (error, same) => {
        if (same) {
          req.session.userId = user._id;
          res.redirect("/");
        } else {
          res.redirect("/login");
        }
      });
    } else {
      return res.redirect("/login");
    }
  });
};
