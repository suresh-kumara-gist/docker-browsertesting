// See https://github.com/graphcool/chromeless/blob/master/examples/mocha-chai-test-example.js
const { Chromeless } = require('chromeless')
const { expect } = require('chai')

describe('Test To Do application', function () {
  it('allows entering to do items', async function () {
    this.timeout(10000);

    const chromeless = new Chromeless()

    try {
      console.log('About to take a screenshot of the to do app.');
      const screenshot = await chromeless.goto('http://myapp-container/todomvc/examples/angularjs/')
        .screenshot();
      console.log('Successfully took a screenshot of the app.');

      console.log('About to type something into the to do app.');
      const screenshot2 = await chromeless.goto('http://myapp-container/todomvc/examples/angularjs/')
        .wait('.new-todo')
        .type('call mom', '.new-todo')
        .press(13) // press enter
        .screenshot();
      console.log('Successfully typed something into the to do app.');

      console.log('Confirming that the .todo-count selector is present.');
      const result = await chromeless.exists('.todo-count')
      expect(result).to.be.true

      //
      // chromeless.type('buy cookies', '#new-todo')
      //   .focus('#new-todo')
      //   .press(13) // press enter
      //   .screenshot();
      //
    } catch(err) {
      // The exact string "Exception alert" is important here, as its
      // presence causes a non-0 exit code in ./docker-resources/run-tests.sh.
      console.log('Exception alert.');
    }

    await chromeless.queue.chrome.close()
  });
})
