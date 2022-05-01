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
      this.afriqueList = await connexion.query("SELECT name_pays, ville FROM voyage INNER JOIN pays ON voyage.id_pays=pays.id_pays AND voyage.id_continent=3");
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

  async getCountryList() {
    var countryList;
    try {
      this.countryList = await connexion.query("SELECT name_pays FROM pays WHERE id_continent=3");
      console.log("charging");
      return this.countryList;
    }
    catch (anError) {
      console.log('Error to get Countrys of Afrique list !');

      // See error from SQL Client
      console.log(anError);
    }
  }

  getCountrys() {
    console.log("charging2");
    console.log(this.countryList);
    return this.countryList;
  }

  async getVillesList(pays) {
    var villesList;
    try {
      this.villesList = await connexion.query("SELECT ville, name_pays FROM voyage INNER JOIN pays ON voyage.id_pays=pays.id_pays WHERE pays.name_pays='"+pays+"'");
      return this.villesList;
    }
    catch (anError) {
      console.log('Error to get villes !');

      // See error from SQL Client
      console.log(anError);
    }
  }

  getVilles() {
    return this.villesList;
  }
  
}

/*
    var countryList=Afrique.getCountrys;
    var villes = new Array(countryList.length);
    for(var i=0; i<countryList.length; i++){
        villes[countryLists[i]]=getVilles(countryLists[i]);
    }
*/


module.exports = Afrique;