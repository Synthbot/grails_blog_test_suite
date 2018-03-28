class LoginPage < BasePage
  page_url "http://localhost:8080/login/auth"

  text_field(:username, id: 'username')
  text_field(:password, id: 'password')
  button(:login, id:'submit')
end