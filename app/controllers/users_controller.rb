class UsersController < ApplicationController
  def show
  end

  def update
    # binding.pry
    if current_user.update(user_params) # 更新出来たかを条件分岐する
 
      redirect_to root_path # 更新できたらrootパスへ
    else
      redirect_to "show" # 失敗すれば再度マイページへ
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :real_family_name, :real_first_name, :reading_family_name, :reading_first_name, :birthday, :birthday, :birthday)
   # 編集出来る情報を制限
  end
  
end