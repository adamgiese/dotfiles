#!/usr/bin/env zx

const inquirer = require('inquirer');
const error = string => console.log(chalk.red(string))

void async function () { // to use "awaits"
  const pattern = argv._[argv._.length - 1]


  if (!pattern) {
    error('Please provide a git grep pattern')
    return
  }

  const results = await nothrow($`git grep -Il ${pattern} -- ':/'`)

  if (results.exitCode) {
    error('No matches found')
    return
  }

  const filesWithMatches = results.stdout.split('\n').filter(Boolean)

  const inquiry = await inquirer.prompt([
    {
      type: 'list',
      name: 'file',
      message: 'Which file would you like to open?',
      choices: filesWithMatches,
    }
  ])
  await $`vim ${inquiry.file}`
}()
