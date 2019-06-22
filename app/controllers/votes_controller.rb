class VotesController < ApplicationController
    def create
        @parent = parent
        @vote = @parent.votes.create(user: current_user)
         
    end
    
      private
    
      def parent
        if params[:question_id]
          Question.find(params[:question_id])
        else
          Answer.find(params[:answer_id])
        end
      
      end
end
