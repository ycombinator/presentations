//
// Inputs:
// - Base value, x. Default = 5
// - Fluctuation percentage (0 = none, 1 = x +/- x, 2 = x +/- 2x, etc.). Default = 0.8
// - Events interval in seconds, t. Default = 1
//

var baseValue = parseInt(process.env.BASE_VALUE) || 5,
  fluctuationPercentage = process.env.FLUCTUATION_PERCENTAGE || 0.5,
  intervalInSeconds = process.env.INTERVAL_IN_S || 1,
  anomalousEventIndex = parseInt(process.env.ANOMALOUS_EVENT_INDEX) || 10;

var generateEvent = function() {

  var sign = ( Math.round(Math.random() * 100) % 2 == 0 ) ? -1 : 1,
    value;

  --anomalousEventIndex;
  if (anomalousEventIndex == 0) {
      value = baseValue + ( Math.random() * 10 );
  } else {
    value = baseValue + ( fluctuationPercentage * baseValue * Math.random() * sign );
  }

  console.log(JSON.stringify({ value: value }));

};

setInterval(generateEvent, intervalInSeconds * 1000);