const fs = require('fs');
const documents = fs.readFileSync('./documents.csv');
const no_matches = fs.readFileSync('./no_matches.csv');
// console.log(documents.toString().split('\n').length);
const unmatchedTypes = no_matches.toString().split('\n').map(line => line.split(',')[0]);
// console.log(unmatchedTypes);
const docs = documents.toString().split('\n').map(line => line.split(','));
// console.lo
const filtered = docs.filter(doc => doc.length >1 && unmatchedTypes.includes(doc[1].toLowerCase()));
console.log(filtered.map(line => line.join(',')).join('\n'));

