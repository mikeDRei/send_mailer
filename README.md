# SendMailer

## Run Project

```bash
mix deps.get
mix deps.compile
mix phx.server
```
# Tests
```bash
mix test
```
# Config
```elixir
config :send_mailer, SendMailer.Service.Server.EmailServer,
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
```
```bash
export DATABASE_PASSWORD=''
```
```bash
export DB_USERNAME=''
```
```bash
export DB_HOSTNAME=''
```
```bash
export EMAIL_FROM=''
```
```bash
export CLIENT_ID=''
```
```bash
export CLIENT_SECRET=''
```
To generate the Bearer Token enter the following commands in your terminal

```bash
iex -S mix start
import SendMailerWeb.AuthorizationController
```
To generate the token, the CLIENT_ID and CLIENT_SECRET environment variables must have been created beforehand.

```bash
encrypt_sendgrid_token_env(System.get_env("CLIENT_ID") <> System.get_env("CLIENT_SECRET"))
```
To make sure the bearer_token was generated:
```bash
System.get_env("BEARER_TOKEN")
```
