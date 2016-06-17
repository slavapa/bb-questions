// (function() {
//   var attempts, createWebsocket, generateInterval, ws;

//   attempts = 1;

//   generateInterval = function(attempts) {
//     var maxInterval;
//     maxInterval = (Math.pow(2, attempts) - 1) * 1000;
//     if (maxInterval > 30 * 1000) {
//       maxInterval = 30 * 1000;
//     }
//     return Math.random() * maxInterval;
//   };

//   ws = null;

//   createWebsocket = function() {
//     var scheme, uri;
//     scheme = "wss://";
//     uri = scheme + window.document.location.host + '/';
//     ws = new WebSocket(uri);
//     ws.onopen = function() {
//       return attempts = 1;
//     };
//     ws.onmessage = function(message) {
//       var data;
//       data = JSON.parse(message.data);
      
//       if (typeof(ModeratorLibrary) != "undefined"){
//         ModeratorLibrary.onMessage(data);
//       }
//       else if (typeof(ClientQuestionMonitorLibrary) != "undefined") {
//         ClientQuestionMonitorLibrary.onMessage(data);
//       }
//     };
    
//     return ws.onclose = function() {
//       return setTimeout(function() {
//         attempts++;
//         return createWebsocket();
//       }, generateInterval(attempts));
//     };
//   };

//   createWebsocket();
  
//   if (typeof(ClientQuestionMonitorLibrary) != "undefined") {
//     ClientQuestionMonitorLibrary.initUI(ws);
//   }

// }).call(this);


(function (Socket) {
  Socket.createWebsocket = function() {
    var attempts = 1;
    var scheme = "wss://";
    var uri = scheme + window.document.location.host + '/';
    var ws = new WebSocket(uri);
    
    ws.onopen = function() {
      return attempts = 1;
    };
    
    ws.onclose = function() {
      return setTimeout(function() {
        attempts++;
        return Socket.createWebsocket();
      }, window.Common.generateInterval(attempts));
    };
    
    return ws;
  };   
}(window.Socket = window.Socket || {}));



