var Amerique = require('../../models/continents/Amerique');

exports.render = async function (req, res) {
  var defaultComponent = new Amerique(req, res);

  await defaultComponent.initialize();
  
  var ameriqueList = await defaultComponent.getAmeriqueList();

  res.render('tmpl/continents/Amerique.html', { items: ameriqueList});
}
