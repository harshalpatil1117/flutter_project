This project uses flutter gen to generate assets.

For assets generation :
- If the issue cmd: command not found: fluttergen then execute the command follow 'dart pub global activate flutter_gen' then you have to do execute command export PATH="$PATH":"$HOME/.pub-cache/bin"
- Copy the assets inside (packages/smart_pay_assets/assets/images/)
- Run 'fluttergen -c pubspec.yaml' command inside my_assets directory to regenerate SmartPayAssets Class
- Also you can use 'flutter pub run build_runner build' command to regenerate the assets class
- You can access assets by SmartPayAssets.images.assets_name.image() 