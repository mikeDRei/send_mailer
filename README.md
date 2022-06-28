# SendMailer

## Run Project

```bash
mix deps.get
mix deps.compile
mix phx.server
```
# Config
```elixir
config :send_mailer, SendMailer.Service.EmailServer,
  adapter: Bamboo.SendGridAdapter,
  api_key: "your api key sendgrid"
```
# Test API
## params
route api: /api/send_email
```json
{
  "email_args": {
	  "from": "example@gmail.com",
	  "to": [
		  "exampleto@gmail.com"
    ],
    "cc": [
      "bccexample@gmail.com"
    ],
    "subject": "Welcome!!",
    "content": "content body email",
    "email_name": "template eex name",
    "other_values": {
      "param1": "param1",
      "param2": "param2",
      "param2": "param3"
    }
  }
}
```
# Template test
you can create an ex-like test template and add elixir code to populate the html tags

```html
<html>
  <head>
  </head>
  <body>
    <div>
      <p> Welcome!! </p>
      <p> Test <%= @email_args["content"]%> </p>
    </div>
  </body>
</html>
```
# Environment Variables

```bash
export SENDGRID_APY_KEY=''
export DATABASE_PASSWORD=''
export EMAIL_FROM=''
export DB_USERNAME=''
export DB_HOSTNAME=''
```
