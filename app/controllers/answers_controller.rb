class AnswersController < ApplicationController

  

    def create

        @question = Question.find(params[:question_id])
        @answer = @question.answers.new(ans_params)

        respond_to do |format|

            if @answer.save
                format.html { redirect_to question_path(@question) }
                format.js
                flash[:success] = "Comentario agregado correctamente"
            else 
                format.html { "question/show" }
                flash[:error] = "La respuesta no se ha agregado correctamente"
            end
        end
    end

    
    private

    def ans_params
    
        params.require(:answer).permit(:content, :rating).merge(user: current_user)

    end

  

    

end
