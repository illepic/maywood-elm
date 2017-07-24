(function App($, sr) {
  const ss = 'https://docs.google.com/spreadsheets/d/1dFObk4oMsdzsGRfZhByybkydtPDcheMO9IS8sehsBLE/edit#gid=0';

  // $('#app-table').sheetrock({
  //   url: ss
  // });

  function processSpreadsheet (error, options, response) {
    console.log(response);
  }

  sr({
    url: ss,
    callback: processSpreadsheet
  });

})(jQuery, sheetrock);
