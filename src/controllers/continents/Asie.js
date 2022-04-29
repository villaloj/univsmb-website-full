var Asie = require('../../models/continents/Asie');

exports.render = async function (req, res) {
  var defaultComponent = new Asie(req, res);

  await defaultComponent.initialize();
  
  var asieList = await defaultComponent.getAsieList();

  res.render('tmpl/continents/Asie.html', { items: asieList});
}
