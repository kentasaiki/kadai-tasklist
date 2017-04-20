class TaskiesController < ApplicationController
  def index
    @taskies = Tasky.all
  end

  def show
    @tasky = Tasky.find(params[:id])
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
    @tasky = Tasky.find(params[:id])
  end

  def update
    @tasky = Tasky.find(params[:id])

    if @tasky.update(tasky_params)
      flash[:success] = 'タスクは正常に更新されました'
      redirect_to @tasky
    else
      flash.now[:danger] = 'タスクは更新されませんでした'
      render :edit
    end
  end

  def destroy
    @tasky = Tasky.find(params[:id])
    @tasky.destroy

    flash[:success] = 'タスクは正常に削除されました'
    redirect_to taskies_url
  end
  
   # Strong Parameter
  def tasky_params
    params.require(:tasky).permit(:content)
  end
end

