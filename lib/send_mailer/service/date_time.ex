defmodule SendMailer.Service.DateTime do
  def dateTime() do
    utc = DateTime.now!("America/Sao_Paulo")
    "[#{utc.hour}:#{utc.minute}:#{utc.second} #{utc.day}-#{utc.month}-#{utc.year}]"
  end
end
