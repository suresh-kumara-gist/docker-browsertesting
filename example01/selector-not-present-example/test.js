const { expect } = require('chai')
const fs = require('fs')

it('This always fails; it is looking for a selector which does not exist', async function() {
  this.timeout(15000);
  const puppeteer = require('puppeteer')
  const browser = await puppeteer.launch({
     headless: true,
     args: ['--no-sandbox', '--disable-setuid-sandbox']
  })
  var result = false
  try {
    const page = await browser.newPage()
    console.log('set viewport')
    await page.setViewport({ width: 1280, height: 800 })
    await page.goto('https://www.amazon.com')
    console.log('This is logged');
    await page.waitForSelector('#this-does-not-exist')
    console.log('This is never logged');
  }
  catch (error) {
    console.log('Exception alert')
    await browser.close()
    console.log(error);
  }
  await browser.close()
});
