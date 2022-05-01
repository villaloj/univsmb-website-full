var Afrique = require('../../models/continents/Afrique');

exports.render = async function (req, res) {
  var defaultComponent = new Afrique(req, res);

  await defaultComponent.initialize();
  
  var afriqueList = await defaultComponent.getAfriqueList();

  var villeList = await defaultComponent.getVillesList();
  //console.log("villeList");
  console.log(villeList);

  var countrysList = await defaultComponent.getCountryList();

 
  var villes = new Array(countrysList.length);
  console.log("pys")
  for(var i=0; i<countrysList.length; i++){
    console.log("hola");
    //console.log(villeList[i].name_pays);
    let p = villeList[i];
    console.log(p);
    //query_villes_p --> Resultat Query
    let query_villes_p = await defaultComponent.getVillesList(p);
    //villes_p --> Resultat Query
    let villes_p = new Array(query_villes_p.length);
    for(var j=0; j<query_villes_p.length; j++){
      console.log("villes");
      console.log(query_villes_p[j].ville);
      villes_p.push(query_villes_p[j].ville);
    }
    villes[p]=villes_p;

    console.log(villes_p);
    console.log("--");
  }
  console.log(villes);

  function villeChange(selectObj) { 
    console.log("kasndknask");
    // get the index of the selected option 
    var idx = selectObj.selectedIndex; 
    // get the value of the selected option 
    var which = selectObj.options[idx].value; 
    // use the selected option value to retrieve the list of items from the villeLists array 
    cList = villes[which]; 
    // get the ville select element via its known id 
    var cSelect = document.getElementById("ville"); 
    // remove the current options from the ville select 
    var len=cSelect.options.length; 
    console.log("1");
    while (cSelect.options.length > 0) { 
    cSelect.remove(0); 
    } 
    var newOption; 
    // create new options 
    for (var i=0; i<cList.length; i++) { 
    newOption = document.createElement("option"); 
    newOption.value = cList[i];  // assumes option string and value are the same 
    newOption.text=cList[i]; 
    console.log("2");
    // add the new option 
    try { 
    cSelect.add(newOption);  // this will fail in DOM browsers but is needed for IE 
    } 
    catch (e) { 
    cSelect.appendChild(newOption); 
    } 
    } 
    } 

  res.render('tmpl/continents/Afrique.html', { items: afriqueList, villes: villeList, villes: villes});
}
