import 'dart:io';

class ProgressBar {
  bool shouldRun = false;

  void start() {
    shouldRun = true;
    stdout.write('\n');
    startProgress();
  }

  void stop() {
    shouldRun = false;
    stdout.write('\n');
    stdout.write('\x1B[2J\x1B[0;0H');
  }

  void startProgress() async {
    print('\n\x1b[38;5;39mBUILDING CODE\x1b[0m');
    while (true) {
      if (!shouldRun) {
        break;
      }
      for (var i = 0; i <= 100; i++) {
        if (!shouldRun) {
          break;
        }
        drawProgressBar(i / 100.0, 20);
        await Future.delayed(const Duration(milliseconds: 25));
      }
    }
    stdout.write('\n');
  }

  void drawProgressBar(double amount, int size) {
    final limit = (size * amount).toInt();
    stdout.write(
      '\r\x1b[38;5;75;51m' +
          String.fromCharCodes(List.generate(size, (int index) {
            if (index < limit) {
              return 0x2593;
            }
            return 0x2591;
          })) +
          '\x1b[0m',
    );
  }
}
