const { Chromeless } = require('chromeless')
const { expect } = require('chai')

it('Example of a test which always fails because an expected selector is not present', async function() {
  this.timeout(2000);
  const chromeless = new Chromeless()

  try {
    const result = await chromeless
      .goto('https://www.google.com')
      .wait('.this-selector-is-not-present')
      // No screenshot is ever made.
      .screenshot();
      console.log('This is never called');
  } catch(err) {
    // The exact string "Exception alert" is important here, as its
    // presence causes a non-0 exit code in ./docker-resources/run-tests.sh.
    console.log('Exception alert.');
  }

  await chromeless.queue.chrome.close()
});
