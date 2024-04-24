class LoginPage
  def initialize
    @txt_username = { id: 'username' }
    @txt_password = { id: 'password' }
    @btn_login = { id: 'loginButton' }
    @btn_logout = { id: 'logoutButton' }
    @lbl_login = { id: 'successMessage' }
  end

  def fill_user_name(user_name)
    PageHelper.find(@txt_username).send_keys(user_name)
  end

  def fill_password(user_password)
    PageHelper.find(@txt_password).send_keys(user_password)
  end

  def click_login_button
    hide_keyboard
    PageHelper.click_element(@btn_login)
  end

  def verify_login
    PageHelper.find(@lbl_login).text.should == "Login Successful!"
    PageHelper.is_element_enabled(@btn_logout).should == true
  end

end