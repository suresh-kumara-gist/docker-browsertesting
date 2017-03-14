casper.test.begin('Test To Do application', 4, function(test) {
  casper.start('http://myapp/todomvc/examples/angularjs', function() {
    this.fillSelectors('form#todo-form', {
      '#new-todo': 'call mom'
    }, true);
  });

  casper.then(function() {
    test.assertSelectorHasText('#todo-count', 'item left');
    test.assertSelectorDoesntHaveText('#todo-count', 'items left');
    this.fillSelectors('form#todo-form', {
      '#new-todo': 'buy cookies'
    }, true);
    test.assertSelectorHasText('#todo-count', 'items left');
    test.assertSelectorDoesntHaveText('#todo-count', 'item left');
  });

  casper.run(function() {
    test.done();
  });
});
