const inquirer = require('inquirer');
const cmd = require('node-cmd');
const [x,y, ...choices] = process.argv

inquirer.prompt([
  {
    type: 'list',
    name: 'choice',
    message: 'Which choice would you like?',
    choices: choices,
  }
]).then(x => {
  cmd.run(`echo "${x.choice}" > choice`)
})
