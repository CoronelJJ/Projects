const dummyApiResponse = {
  showLightAndDarkMode: true,
  showTicTacToe: false,
  showRandomColorGenerator: true,
  showAccordian: true,
  showTreeView: true,
};

function featureFlagsDataServiceCall() {
  return new Promise((resolve, reject) => {
    if (dummyApiResponse) setTimeout(resolve(dummyApiResponse), 500);
    else reject("An error has occured");
  });
}

export default featureFlagsDataServiceCall;
