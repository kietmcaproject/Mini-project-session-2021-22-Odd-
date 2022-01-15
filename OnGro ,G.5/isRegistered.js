const user = require("../database/models/User");
module.exports = (req, res) => {
  id = req.params.id;
  user.findOne({ _id: id }, (error, user) => {
    if (error) {
      console.log(error);
    }
    if (user) {
      res.json({ alreadyRegistered: true });
    } else {
      res.json({ alreadyRegistered: false });
    }
  });
};
