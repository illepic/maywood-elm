// pull in desired CSS/SASS files
require( './styles/main.scss' );
// var $ = jQuery = require( '../../node_modules/jquery/dist/jquery.js' );           // <--- remove if jQuery not needed
// require( '../../node_modules/bootstrap-sass/assets/javascripts/bootstrap.js' );   // <--- remove if Bootstrap's JS not needed
const sheetrock =  require('sheetrock');



const spreadsheet = 'https://docs.google.com/spreadsheets/d/1dFObk4oMsdzsGRfZhByybkydtPDcheMO9IS8sehsBLE/edit#gid=0';
sheetrock({
  url: spreadsheet,
  callback: (error, options, response) => {
    console.log(response);
  }
});

// inject bundled Elm app into div#main
const Elm = require( '../elm/Main' );
Elm.Main.embed( document.getElementById( 'main' ) );

