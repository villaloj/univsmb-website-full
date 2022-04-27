var sql = require('../db/db_mariadb');

var connexion = null;

class Asie {
  constructor(req, res) {
    this.req = req;
    this.res = res;

    connexion = new sql();

  }
  async initialize() {
    await connexion.startConnexion();

  }

  async getAsieList() {
    try {
      this.asieList = await connexion.query("SELECT name, ville FROM voyage WHERE id_continent=2");
      return this.asieList;
    }
    catch (anError) {
      console.log('Error to get Asie list !');

      // See error from SQL Client
      console.log(anError);
    }
  }
  getAsie() {
    return this.asieList;
  }
}

module.exports = Asie;