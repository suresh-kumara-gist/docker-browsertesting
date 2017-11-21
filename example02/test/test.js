// See https://github.com/graphcool/chromeless/blob/master/examples/mocha-chai-test-example.js
const { Chromeless } = require('chromeless')
const { expect } = require('chai')

// make sure you do npm i chai
// to run this example just run
// mocha path/to/this/file

describe('Test To Do application', function () {
  it('allows entering to do items', async function () {
    this.timeout(10000); //we need to increase the timeout or else mocha will exit with an error
    const chromeless = new Chromeless()

    const screenshot = await chromeless.goto('http://myapp/todomvc/examples/angularjs')
      .wait('#new-todo')
      .type('call mom', '#new-todo')
      .press(13) // press enter
      .screenshot();

    const result = await chromeless.exists('#todo-count')
    expect(result).to.be.true

    chromeless.type('buy cookies', '#new-todo')
      .focus('#new-todo')
      .press(13) // press enter
      .screenshot();

    await chromeless.end()
  })
})
