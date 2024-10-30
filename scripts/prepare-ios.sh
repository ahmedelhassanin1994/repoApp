

rm ios/pods
npx pod-install



cd ios
bundle install
bundle exec fastlane install_plugins
cd ..
