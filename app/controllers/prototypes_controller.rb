class PrototypesController < ApplicationController
  # prototypeを取得する（index, new, create以外で適用）
  before_action :set_prototype, except: [:index, :new, :create]
  
  # ログインしていないユーザーは index, show 以外アクセス不可
  before_action :authenticate_user!, except: [:index, :show]
  
  # 投稿者以外は edit, update, destroy へアクセス不可
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]

  def index
    @prototypes = Prototype.includes(:user)
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @comment = Comment.new
    @comments = @prototype.comments
  end

  def edit
  end

  def update
    if @prototype.update(prototype_params)
      redirect_to prototype_path(@prototype)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @prototype.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  # ストロングパラメータ + 作成者情報を追加
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

  # 指定された prototype をセット
  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  # 投稿者確認
  def contributor_confirmation
    redirect_to root_path unless current_user == @prototype.user
  end
end
