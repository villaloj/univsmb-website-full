var Afrique = require('../../models/iptables/Afrique');

exports.render = async function (req, res) {
  var defaultComponent = new Afrique(req, res);

  await defaultComponent.initialize();
  
  var afriqueList = await defaultComponent.getAfriqueList();

  res.render('tmpl/continents/Afrique.html', { items: afriqueList});
}
