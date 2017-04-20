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

    if @message.save
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
  end

  def destroy
  end
  
   # Strong Parameter
  def tasky_params
    params.require(:tasky).permit(:content)
  end
end

