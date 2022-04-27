var sql = require('../db/db_mariadb');

var connexion = null;

class Amerique {
  constructor(req, res) {
    this.req = req;
    this.res = res;

    connexion = new sql();

  }
  async initialize() {
    await connexion.startConnexion();

  }

  async getAmeriqueList() {
    try {
      this.ameriqueList = await connexion.query("SELECT name, ville FROM voyage WHERE id_continent=4");
      return this.ameriqueList;
    }
    catch (anError) {
      console.log('Error to get Amerique list !');

      // See error from SQL Client
      console.log(anError);
    }
  }
  getAmerique() {
    return this.ameriqueList;
  }
}