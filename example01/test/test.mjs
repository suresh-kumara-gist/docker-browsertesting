import puppeteer from 'puppeteer';
import { expect } from 'chai';
import fs from 'fs';

it('It should be possible to search for something on Google', async function() {
  this.timeout(15000);
  const browser = await puppeteer.launch({
     headless: true,
     args: ['--no-sandbox', '--disable-setuid-sandbox']
  })
  let result = false
  try {
    const page = await browser.newPage()
    console.log('...set viewport')
    await page.setViewport({ width: 1280, height: 800 })
    console.log('...go to google homepage')
    await page.goto('https://google.com')
    console.log('...input "puppeteer"')
    await page.type('textarea[name="q"]', 'puppeteer')
    console.log('...about to press enter')
    await page.keyboard.press('Enter');
    console.log('...waiting for selector')
    await page.waitForSelector('#taw')
    console.log('...taking a screenshot')
    await page.screenshot({path: '/artifacts/a-screenshot.png'})
    console.log('...saving state of the DOM (source code)')
    let html = await page.content();
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
