# Stacked CLI

Note: This tool is only applicable to stacked / MVVM architecture project by FilledStack [Stacked Architecture](https://pub.dev/packages/stacked)

# Get Started

#### Run this command in your terninal
    
    pub global activate stacked_cli
 
# Usage

### **How to add view**:
   use this alias in your stacked architecture project.

        $ stacked view name-in-small-words
   For example:

        $ stacked view login

It will generate some files and folders (if not exist) in your lib folder with some starting code.

### **How to add service**:

        $ stacked service firestore

it will generate services folder and service file in it and it also injects that service in your app

