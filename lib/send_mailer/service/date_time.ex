defmodule SendMailer.Service.DateTime do
  @moduledoc false
  def utc_hour() do
    utc = DateTime.now!("America/Sao_Paulo")
    "#{utc.hour}:#{utc.minute}"
  end

  def utc_date() do
    utc = DateTime.now!("America/Sao_Paulo")
    "#{utc.day}/#{utc.month}/#{utc.year}"
  end
end
