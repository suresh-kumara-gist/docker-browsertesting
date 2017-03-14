casper.test.begin('Test Google.com', 2, function(test) {
  casper.start('http://google.com', function() {
    this.fill('form[action="/search"]', {
      'q': 'javascript'
    }, true);
  });

  casper.then(function() {
    test.assertTitleMatch(/^.*javascript.*$/, 'Google search results page doesnt have expected title');
    test.assertTitleMatch(/^.*Google.*$/, 'Google search results page doesnt have expected title');
  });

  casper.run(function() {
    test.done();
  });
});
