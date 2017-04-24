class TaskiesController < ApplicationController
  before_action :set_tasky, only: [:show, :edit, :update, :destroy]
  
  def index
    @taskies = Tasky.order(created_at: :desc).page(params[:page]).per(3)
  end

  def show
  end

  def new
    @tasky = Tasky.new
  end

  def create
    @tasky = Tasky.new(tasky_params)

    if @tasky.save
      flash[:success] = 'タスク が正常に投稿されました'
      redirect_to @tasky
    else
      flash.now[:danger] = 'タスク が投稿されませんでした'
      render :new
    end
  end

  def edit
  end

  def update
    if @tasky.update(tasky_params)
      flash[:success] = 'タスクは正常に更新されました'
      redirect_to @tasky
    else
      flash.now[:danger] = 'タスクは更新されませんでした'
      render :edit
    end
  end

  def destroy
    @tasky.destroy

    flash[:success] = 'タスクは正常に削除されました'
    redirect_to taskies_url
  end
  
  private

  def set_tasky
    @tasky = Tasky.find(params[:id])
  end

  def tasky_params
    params.require(:tasky).permit(:content, :status)
  end
end
