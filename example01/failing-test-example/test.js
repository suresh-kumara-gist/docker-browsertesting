const { expect } = require('chai')

it('A failing test should make the script exit with an error code', async function() {
  expect(true).to.be.false;
});
