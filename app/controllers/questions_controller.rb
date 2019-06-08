class QuestionsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show] 
  before_action :set_question, only: [:show, :edit, :update, :destroy]


  def index

    @questions = Question.all.order(id: :desc)

  end

  def show

  end

  def new

    @question = Question.new

  end

  def update

    @question = Question.find(params[:id])
      if @question.update(question_params)
        redirect_to questions_path, notice: "Question has been successfully Updated"
      else
        render :edit
      end
  end

  def create

  	@question = Question.new(question_params)
  	@question.user = current_user

  		if @question.save 
  			flash[:success] = "Question Posted"
  			redirect_to questions_path
  		else
  			render :new
  		end
  end

  def destroy

    question = Question.find(params[:id])
    question.destroy

    redirect_to questions_path, notice: "The Question has been deleted"

  end

  private

   def set_question
      @question = Question.find(params[:id])
    end

   def question_params

      params.require(:question).permit(:title, :content, :rating, :user_id)
    
    end



end
