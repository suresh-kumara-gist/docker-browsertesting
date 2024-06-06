import puppeteer from 'puppeteer';
import { expect } from 'chai';
import fs from 'fs';

it('It should be possible to add a "todo" item to our app', async function() {
  this.timeout(15000);
  const browser = await puppeteer.launch({
     headless: true,
     args: ['--no-sandbox', '--disable-setuid-sandbox']
  })
  let result = false
  try {
    const page = await browser.newPage()
    console.log('set viewport')
    await page.setViewport({ width: 1280, height: 800 })
    console.log('go to our todo app')
    await page.goto('http://myapp-container/todomvc/examples/angularjs_require/')
    console.log('taking a screenshot')
    await page.screenshot({path: '/artifacts/todo-screenshot.png'})
    console.log('About to type something into the to do app.')
    await page.type('.new-todo', 'call mom')
    await page.keyboard.press('Enter');
    console.log('taking another screenshot')
    await page.screenshot({path: '/artifacts/todo-screenshot2.png'})
    console.log('Successfully typed something into the to do app.');
    console.log('Confirming that the .todo-count selector is present.');
    await page.waitForSelector('.todo-count')
    // if any of the above fail, an exception will be thrown.
    let html = await page.content();
    fs.writeFile("/artifacts/todo-screenshot.html", html, function(err) {
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
