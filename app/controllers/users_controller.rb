class UsersController < ApplicationController
  def show
    # Pathパラメータ（URLの:id）を使って、該当するユーザーを取得
    @user = User.find(params[:id])
  end
end
