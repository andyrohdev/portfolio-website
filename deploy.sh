#!/usr/bin/env sh



echo "Building the project..."
npm run build

echo "Navigating to the dist directory..."
cd dist

echo "Initializing git repository..."
git init

# Switch to gh-pages branch to match the remote
git checkout -b gh-pages

echo "Adding and committing changes..."
git add -A
git commit -m 'New Deployment'

echo "Pushing to gh-pages branch..."
git push -f https://github.com/andyrohdev/portfolio-website.git gh-pages

echo "Returning to the previous directory..."
cd -
