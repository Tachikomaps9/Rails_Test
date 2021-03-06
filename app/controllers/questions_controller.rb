class QuestionsController < ApplicationController
  # アクションが実行される前に実行される
  # この様に共通化を行う
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  
  def index
    @questions = Question.all
  end

  def show
    #byebug
    #Questionモデルからparams[:id]のデータを取得する
    @question = Question.find(params[:id])
    @answer = Answer.new
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to root_path, notice: 'Success!'
    else
      flash[:alert] = 'Save error!'
      render :new
    end
  end

  def edit
    #@question = Question.find(params[:id])
  end

  def update
    #@question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to root_path, notice: 'Success!'
    else
      flash[:alert] = 'Save error!'
      render :edit
    end
  end

  def destroy
    #@question = Question.find(params[:id])
    @question.destroy
    redirect_to root_path, notice: 'Success!'
  end

  private
    def set_question
      @question = Question.find(params[:id])
    end

    def question_params
      # byebug
      # ストロングパラメータ　指定したパラメータのみ受け取るようにしている
      # 例.IDが飛んできても受け付けない
      params.require(:question).permit(:name, :title, :content)
    end
end
