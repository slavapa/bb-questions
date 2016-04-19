(function() {
  var attempts, createWebsocket, generateInterval, ws;

  attempts = 1;

  generateInterval = function(attempts) {
    var maxInterval;
    maxInterval = (Math.pow(2, attempts) - 1) * 1000;
    if (maxInterval > 30 * 1000) {
      maxInterval = 30 * 1000;
    }
    return Math.random() * maxInterval;
  };

  ws = null;

  createWebsocket = function() {
    var scheme, uri;
    scheme = "wss://";
    uri = scheme + window.document.location.host + '/';
    ws = new WebSocket(uri);
    ws.onopen = function() {
      return attempts = 1;
    };
    ws.onmessage = function(message) {
      var data;
      data = JSON.parse(message.data);
      
      if (typeof(ModeratorLibrary) != "undefined"){
          ModeratorLibrary.onMessage(data);
      }
      else{
          $('#chat-text').prepend('<div class=\'panel panel-default\'><div class=\'panel-heading\'>' + data.name + ' From ' + data.from + '</div><div class=\'panel-body\'>' + data.question + '</div></div>');
          return $('#chat-text').stop().animate({
            scrollTop: $('#chat-text')[0].scrollHeight
          }, 800);
      }
    };
    return ws.onclose = function() {
      return setTimeout(function() {
        attempts++;
        return createWebsocket();
      }, generateInterval(attempts));
    };
  };

  createWebsocket();

  $(function() {
    return $('#input-form').on('submit', function(event) {
      var from, name, question;
      event.preventDefault();
      name = $('#name').val();
      from = $('#from').val();
      question = $('#question').val();
      ws.send(JSON.stringify({
        name: name,
        from: from,
        question: question
      }));
      $('#question').val('');
    });
  });

}).call(this);
