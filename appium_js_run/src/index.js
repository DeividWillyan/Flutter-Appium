const wdio = require('webdriverio');
const assert = require('assert');
const find = require('appium-flutter-finder');

const osSpecificOps = process.argv[2] === 'android' ? {
  platformName: 'Android',
  deviceName: 'emulator-5556',
  app: __dirname + '/../../appium_example/build/app/outputs/apk/debug/app-debug.apk',
} : process.argv[2] === 'ios' ? {
  platformName: 'iOS',
  platformVersion: '12.2',
  deviceName: 'iPhone X',
  noReset: true,
  app: __dirname + '/../apps/Runner.zip',

} : {};



const opts = {
  port: 4723,
  capabilities: {
    ...osSpecificOps,
    automationName: 'Flutter'
  }
};


(async () => {
  console.log(osSpecificOps);
  console.log('Initial app testing')

  const driver = await wdio.remote(opts);
  assert.strictEqual(await driver.execute('flutter:checkHealth'), 'ok');
  await driver.execute('flutter:clearTimeline');
  await driver.execute('flutter:forceGC');

  //Enter One page
  await driver.execute('flutter:waitFor', find.byValueKey('btn-login'));
  await driver.elementSendKeys(find.byValueKey('input-user'), 'test@gmail.com')
  await driver.elementSendKeys(find.byValueKey('input-password'), '123456')
  await driver.elementClick(find.byType('RaisedButton'));

  //Enter Two page
  await driver.execute('flutter:waitFor', find.byType('Scaffold'));
  assert.strictEqual(await driver.getElementText(find.byText('Custom Widget')), 'Custom Widget');
  await driver.elementClick(find.byType('CustomTextExample'));
  assert.strictEqual(await driver.getElementText(find.byValueKey('count-key')), '1');
  await driver.elementClick(find.byType('CustomTextExample'));
  assert.strictEqual(await driver.getElementText(find.byValueKey('count-key')), '2');

  // return page
  await driver.elementClick(find.pageBack())

  driver.deleteSession();
})();

