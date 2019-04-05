const { expect } = require('chai')
const fs = require('fs')

it('It should be possible to search for something on Google', async function() {
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
    console.log('go to google homepage')
    await page.goto('https://google.com')
    console.log('input "puppeteer"')
    await page.type('input[name="q"]', 'puppeteer')
    await page.keyboard.press('Enter');
    await page.waitForSelector('#resultStats')
    console.log('taking a screenshot')
    await page.screenshot({path: '/artifacts/a-screenshot.png'})
    console.log('saving state of the DOM (source code)')
    var html = await page.content();
    fs.writeFile("/artifacts/a-screenshot.html", html, function(err) {
      if (err) {
        return console.log(err);
      }
      else {
        console.log('File has been saved.');
        result = true
      }
      expect(result).to.be.true;
    });
  }
  catch (error) {
    console.log('Exception alert')
    await browser.close()
    console.log(error);
  }
  await browser.close()
});
