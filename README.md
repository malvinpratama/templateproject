# template

Template project for flutter

## Getting Started

1. Add env variable to .env. If want multiple env file see the .staging.env
2. Add config for env in lib/src/configs/envs ignore .g.dart file. This file is generated from step 3.
3. Run "flutter pub run build_runner build --delete-conflicting-outputs"
4. Add env file to .gitignore (.env, env.g.dart, staging.env, staging.env.g.dart)