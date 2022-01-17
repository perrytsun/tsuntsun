class ConsultationsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]

  def index
    if params[:search] == nil
      @consultations= Consultation.all
     elsif params[:search] == ''
      @consultations= Consultation.all
     else
      @consultations = Consultation.where("body LIKE ? ",'%' + params[:search] + '%')
    end
       @consultations = Consultation.all
       @rank_consultations = Consultation.all.sort {|a,b| b.liked_users.count <=> a.liked_users.count}
       @consultations= Consultation.includes(:user)
  end

    def new
        @consultation = Consultation.new
     end

     def create
        consultation = Consultation.new(consultation_params)
        consultation.user_id = current_user.id
        if consultation.save
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end

      def show
        @consultation = Consultation.find(params[:id])
        @comments = @consultation.comments
        @comment = Comment.new
      end
    
      def edit
        @consultation = Consultation.find(params[:id])
      end

      def update
        consultation = Consultation.find(params[:id])
        if consultation.update(consultation_params)
          redirect_to :action => "show", :id => consultation.id
        else
          redirect_to :action => "new"
        end
      end

      def destroy
        tweet = Consultation.find(params[:id])
        tweet.destroy
        redirect_to action: :index
      end

      private

      def consultation_params
         params.require(:consultation).permit(:body, :image) 
      end
      
end



