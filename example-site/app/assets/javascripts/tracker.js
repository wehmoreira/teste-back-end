window.onload = function() {
  function uuidv4() {
    return ([1e7]+-1e3+-4e3+-8e3+-1e11).replace(/[018]/g, c =>
      (c ^ crypto.getRandomValues(new Uint8Array(1))[0] & 15 >> c / 4).toString(16)
    )
  }
  var setGuid = function() {
    var cookies = document.cookie.split(';');
    for(var i=0 ; i < cookies.length ; ++i) {
      var pair = cookies[i].trim().split('=');
      if(pair[0] == 'guid') {
        var guid = pair[1];
        return guid;
      }
    }
    var guid = uuidv4();
    document.cookie = "guid="+guid+";path=/";
    return guid
  };
  var url = window.location.href;
  var pathname = window.location.pathname;

  var today = new Date();
  var date = today.getFullYear()+'-'+(today.getMonth()+1)+'-'+today.getDate();
  var time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
  var dateTime = date+' '+time;

  var payload = {
    guid: setGuid(),
    url: url,
    datetime: dateTime
  };

  var xhr = new XMLHttpRequest();
  xhr.open("POST", "http://localhost:3000/api/v1/trackers", true);
  xhr.setRequestHeader('Content-Type', 'application/json');
  xhr.send(JSON.stringify({ "tracker": payload }));
}
