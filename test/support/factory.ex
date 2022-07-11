defmodule SendMailer.Factory do
  @moduledoc false
  use ExMachina
  
  def email_factory do
    %{
      "from" => "michaalvesreino@gmail.com",
      "to" => ["michael#{Enum.random(0..100)}@gmail.com"],
      "cc" => ["joao#{Enum.random(0..100)}@gmail.com"],
      "bcc" => ["joao#{Enum.random(0..100)}@gmail.com"],
      "subject" => "title headers email",
      "content" => "Text content email",
      "email_name" => "test",
      "other_values" => %{"exam_code" => "45454", "name" => "michael"}
    }
  end

  def set_email_data_factory do
    %{
    "_json" => [
      %{
        "email" => "userone@gmail.com",
        "event" => "processed",
        "send_at" => 0,
        "sg_event_id" => "cHJvY2Vzc2VkLTI3Mjk3ODU4LVhlLUhYcjJXUWd5TE5YelRFRmoyUkEtMA",
        "sg_message_id" => "Xe-HXr2WQgyLNXzTEFj2RA.filterdrecv-679d49d7d8-q2xs4-1-62BCB5F4-4A.0",
        "smtp-id" => "<Xe-HXr2WQgyLNXzTEFj2RA@geopod-ismtpd-1-1>",
        "timestamp" => 1_656_534_516
      },
      %{
        "email" => "usertwo@gmail.com",
        "event" => "processed",
        "send_at" => 0,
        "sg_event_id" => "cHJvY2Vzc2VkLTI3Mjk3ODU4LVhlLUhYcjJXUWd5TE5YelRFRmoyUkEtMQ",
        "sg_message_id" => "Xe-HXr2WQgyLNXzTEFj2RA.filterdrecv-679d49d7d8-q2xs4-1-62BCB5F4-4A.1",
        "smtp-id" => "<Xe-HXr2WQgyLNXzTEFj2RA@geopod-ismtpd-1-1>",
        "timestamp" => 1_656_534_516
      },
      %{
        "email" => "usermail@gmail.com",
        "event" => "delivered",
        "sg_event_id" => "ZGVsaXZlcmVkLTAtMjcyOTc4NTgtWGUtSFhyMldRZ3lMTlh6VEVGajJSQS0w",
        "sg_message_id" => "Xe-HXr2WQgyLNXzTEFj2RA.filterdrecv-679d49d7d8-q2xs4-1-62BCB5F4-4A.0",
        "smtp-id" => "<Xe-HXr2WQgyLNXzTEFj2RA@geopod-ismtpd-1-1>"
      }
    ]
  }
  end

  def sendgrid_params_factory do
    %{
      "client_id" => "78945645645asas",
      "client_secret" => "secret7894564564"
    }
  end
end
