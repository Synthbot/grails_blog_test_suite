class RegistrationPage < BasePage
  page_url "http://localhost:8080/user/create"

  text_field(:username, id: 'username')
  text_field(:password, id: 'password')
  button(:create, id:'create')
end