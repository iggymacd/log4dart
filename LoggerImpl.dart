/**
 * A logger implementation with appender and diagnostic support. Defaults to console logging.
 */
class LoggerImpl implements Logger {
   static Map<String, String> _context;
  
   final bool debugEnabled;
   final bool errorEnabled;
   final bool infoEnabled;
   final bool warnEnabled;
   final String name;
   
   Appender _appender;
   
   LoggerImpl(this.name, [this.debugEnabled=false, this.errorEnabled=true, this.infoEnabled=false, this.warnEnabled=true, this._appender=null]) { 
     if(_context == null) {
       _context = new LinkedHashMap();
     }
     if(_appender == null) {
       _appender = new ConsoleAppender();
     }
   }
  
   debug(String message) {
     if(debugEnabled) _append("DEBUG", message);
   }
   
   debugFormat(String format, List args) {
     if(debugEnabled) debug(_format(format, args));
   }
   
   error(String message) {
     if(errorEnabled) _append("ERROR", message);
   }
   
   errorFormat(String format, List args) {
     if(errorEnabled) error(_format(format, args));
   }
   
   info(String message) {
     if(infoEnabled) _append("INFO", message);
   }
   
   infoFormat(String format, List args) {
     if(infoEnabled) info(_format(format, args));
   }
   
   warn(String message) {
     if(warnEnabled) _append("WARN", message);
   }
   
   warnFormat(String format, List args) {
     if(warnEnabled) warn(_format(format, args));
   }
   
   void clearContext() => _context.clear();
   
   String getContect(String key) => _context[key];
   
   void putContext(String key, String val) {
     _context[key] = val;
   }
   
   void removeContext(String key) {
     _context.remove(key);
   }
   
   void _append(String level, String message) {
     String ctx = "";
     _context.forEach(f(k,v) => ctx += "$v:");
     // TODO format
     _appender.doAppend("[$level] $name${ctx.isEmpty() ? ':' : ' [$ctx]'} $message");
   }
   
   String _format(String format, List args) {
     throw new UnsupportedOperationException("implement sprintf");
   }
}
