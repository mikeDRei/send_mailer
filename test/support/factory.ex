defmodule SendMailer.Factory do
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
      "other_values" => %{"exam_code" => "45454", "name" => "michael"},
      "attachment_links" => ["teste attachment_links"]
    }
  end

  def set_email_data_factory do
    %{
    "payload" => %{"exam_code" => "45454", "name" => "michael"},
    "type_email" => "test type email"
    }
  end
end
