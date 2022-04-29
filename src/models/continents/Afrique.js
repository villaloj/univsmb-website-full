var sql = require('../db/db_mariadb');

var connexion = null;

class Afrique {
  constructor(req, res) {
    this.req = req;
    this.res = res;

    connexion = new sql();

  }
  async initialize() {
    await connexion.startConnexion();

  }

  async getAfriqueList() {
    try {
      this.afriqueList = await connexion.query("SELECT id_pays, ville FROM voyage WHERE id_continent=2");
      return this.afriqueList;
    }
    catch (anError) {
      console.log('Error to get Afrique list !');

      // See error from SQL Client
      console.log(anError);
    }
  }
  getAfrique() {
    return this.afriqueList;
  }
}

module.exports = Afrique;