var Home = require('../../models/homepage/homepage');

exports.render = async function (req, res) {
  var defaultComponent = new Home(req, res);

  await defaultComponent.initialize();
  

  res.render('tmpl/homepage.html' );
}
