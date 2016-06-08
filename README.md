#### New Feature Workflow
  1. `git checkout -b <branch-name>`
  2. `git add`
  3. `git commit -m`
  4. `git push origin <branch-name>`
  5. Go to github and click **compare pull request**
  6. **Submit** button
  7. After pull request is approved:
    * `git checkout master`
    * `git pull upstream master`
  8. `git push origin master`
  9. Rinse and Repeat
