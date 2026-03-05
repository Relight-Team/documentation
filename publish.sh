git status

echo "Commit Message:"
read CommitComment

clear

git add .

echo ""

git commit -m "$CommitComment"

git push origin main

mkdocs gh-deploy
