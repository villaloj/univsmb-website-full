
var Europe = require('../../models/iptables/Europe');

exports.render = async function (req, res) {
  var defaultComponent = new Europe(req, res);

  await defaultComponent.initialize();
  
  var europeList = await defaultComponent.getEuropeList();

  res.render('tmpl/continents/Europe.html', { items: europeList});
}
