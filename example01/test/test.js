// See https://github.com/graphcool/chromeless/blob/master/examples/mocha-chai-test-example.js
const { Chromeless } = require('chromeless')
const { expect } = require('chai')

describe('When searching on google', function () {
  it('shows results', async function () {
    this.timeout(10000); //we need to increase the timeout or else mocha will exit with an error
    const chromeless = new Chromeless()

    try {
      const screenshot = await chromeless.goto('https://google.com')
        .wait('input[name="q"]')
        .type('chromeless github', 'input[name="q"]')
        .press(13) // press enter
        .wait('#resultStats')
        .screenshot();

      const result = await chromeless.exists('a[href*="graphcool/chromeless"]')

      expect(result).to.be.true
    } catch(err) {
      // The exact string "Exception alert" is important here, as its
      // presence causes a non-0 exit code in ./docker-resources/run-tests.sh.
      console.log('Exception alert.');
    }

    await chromeless.queue.chrome.close()
  })
})
