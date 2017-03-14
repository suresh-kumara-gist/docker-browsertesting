casper.test.begin('Test Google.com', 1, function(test) {
  casper.start('http://google.com', function() {
    this.fill('form[action="/search"]', {
      'q': 'javascript'
    }, true);
  });

  casper.then(function() {
    test.assertTitle('javascript - Google Search', 'Google search results page doesnt have expected title');
  });

  casper.run(function() {
    test.done();
  });
});
