defmodule SendMailer.Factory do
  use ExMachina
  
  def email_factory do
    %{
      "from" => "michaalvesreino@gmail.com",
      "to" => ["michael#{Enum.random(0..100)}@gmail.com"],
      "cc" => ["joão#{Enum.random(0..100)}@gmail.com"],
      "bcc" => ["joão#{Enum.random(0..100)}@gmail.com"],
      "subject" => "title headers email",
      "content" => "Text content email",
      "email_name" => "test",
      "other_values" => %{"exam_code" => "45454", "name" => "michael"},
      "attachment_links" => ["teste attachment_links"]
    }
  end

    def email_incorret_param_factory do
    %{
      "from" => "michaalvesreinogmail.com",
      "to" => ["michael#{Enum.random(0..100)}@gmail.com"],
      "cc" => ["joão#{Enum.random(0..100)}@gmail.com"],
      "bcc" => ["joão#{Enum.random(0..100)}@gmail.com"],
      "subject" => "title headers email",
      "content" => "Text content email",
      "email_name" => "test",
      "other_values" => %{"exam_code" => "45454", "name" => "michael"},
      "attachment_links" => ["teste attachment_links"]
    }
  end
end
