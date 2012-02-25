#library('qalqo:common:log4dart');

#source('Appender.dart');
#source('ConsoleAppender.dart');
#source('Logger.dart');
#source('LoggerImpl.dart');
#source('TestRunner.dart');
#source('LoggerFactory.dart');

main() {
  LoggerFactory.configureBuilder((String name) => new LoggerImpl(name, debugEnabled:true));
  new TestRunner();
}