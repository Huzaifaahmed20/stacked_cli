# Stacked CLI tool

Note: This tool is only applicable to stacked / MVVM architecture project by FilledStack [Stacked Architecture](https://pub.dev/packages/stacked)

### **How to use this tool**:
1. Make sure you have dart sdk installed in your pc.

    [install dark SDK](https://dart.dev/get-dart)

    and add environment variable your path

        PATH_TO_FLUTTER_SDK/bin/cache/dart-sdk/bin 

2. Clone this repo.

       git clone https://github.com/Huzaifaahmed20/stacked_cli.git

3. Install dependencies:
    
       cd stacked_cli && pub get

4. Add alias for quick access.

       alias generate_stacked_view='dart PATH-TO-CLONED_DIR/bin/main.dart view $1' 
5. use this alias in your stacked architecture project.

        $ generate_stacked_view view-name-in-small-words
    For example:

        $ generate_stacked_view login

It will generate some files and folders (if not exist) in your lib folder with some starting code.
