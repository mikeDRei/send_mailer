defmodule SendMailer.Service.DateTime do
  @moduledoc false
  def date_time() do
    utc = DateTime.now!("America/Sao_Paulo")
    "#{utc.hour}:#{utc.minute} #{utc.day}/#{utc.month}/#{utc.year}"
  end
end
