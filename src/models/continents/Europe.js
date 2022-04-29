var sql = require('../db/db_mariadb');

var connexion = null;

class Europe {
  constructor(req, res) {
    this.req = req;
    this.res = res;

    connexion = new sql();

  }
  async initialize() {
    await connexion.startConnexion();

  }

  async getEuropeList() {
    try {
      this.europeList = await connexion.query("SELECT id_pays, ville FROM voyage WHERE id_continent=1");
      return this.europeList;
    }
    catch (anError) {
      console.log('Error to get Europe list !');

      // See error from SQL Client
      console.log(anError);
    }
  }
  getEurope() {
    return this.europeList;
  }
}

module.exports = Europe;
