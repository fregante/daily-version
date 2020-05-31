const test = require('ava');
const {execFileSync} = require('child_process');
const utcVersion = require('utc-version');
const dailyVersion = require('.');

test('api: simple', t => {
	t.is(
		dailyVersion(),
		utcVersion({short: true})
	);
});

test('api: with prefix', t => {
	t.is(
		dailyVersion('v'),
		'v' + utcVersion({short: true})
	);
});

test('cli: simple', t => {
	t.is(
		execFileSync('npx', ['.'], {encoding: 'utf8'}),
		utcVersion({short: true}) + '\n'
	);
});

test('cli: with prefix', t => {
	t.is(
		execFileSync('npx', ['.', 'v'], {encoding: 'utf8'}),
		'v' + utcVersion({short: true}) + '\n'
	);
});

test.todo('use git mocks');
