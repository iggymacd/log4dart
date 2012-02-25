/**
 * A simple appender that logs to the console
 */
class ConsoleAppender implements Appender {
  void doAppend(message) {
    print("$message");      
  }
}
