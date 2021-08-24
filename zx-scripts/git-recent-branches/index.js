#!/usr/bin/env zx

const inquirer = require('inquirer');

void async function () { // to use "awaits"
  const recentBranchesOutput = await $`git list-recent-branches`
  const recentBranches = recentBranchesOutput.stdout.split('\n').filter(Boolean)

  const inquiry = await inquirer.prompt([
    {
      type: 'list',
      name: 'branch',
      message: 'Which choice would you like?',
      choices: recentBranches,
    }
  ])
  await $`git checkout ${inquiry.branch}`
}()
