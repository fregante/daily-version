const {execFileSync} = require('child_process');
const utcVersion = require('utc-version');

module.exports = (prefix = '') => {
	const today = prefix + utcVersion({
		short: true
	});

	const tagExists = execFileSync('git', ['tag', '-l', today], {
		encoding: 'utf8'
	});

	if (!tagExists) {
		return today;
	}

	// Return non-short version
	return prefix + utcVersion();
};
