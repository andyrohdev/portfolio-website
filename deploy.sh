set -e

echo "Building the project..."
npm run build

echo "Navigating to the dist directory..."
cd dist

echo "Initializing git repository..."
git init

echo "Adding and committing changes..."
git add -A
git commit -m 'New Deployment'

echo "Pushing to gh-pages branch..."
git push -f https://github.com/andyrohdev/portfolio-website.git master:gh-pages

echo "Returning to the previous directory..."
cd -
