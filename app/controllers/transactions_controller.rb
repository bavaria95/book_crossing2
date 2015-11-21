class TransactionsController < ApplicationController
	before_action :set_request, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!

	def index
		own_id = current_user.id
		all_transactions = Transaction.all
		@transactions_to_me = []

		# awful way to do that :/
		all_transactions.each do |t|
			if Book.find(t.requested_book_id).user_id == current_user.id and not t.status_requested
				@transactions_to_me << t
			end
		end

		# @transaction_to_me = Transaction.where(:requested => own_id).where.not(:accepted => "deleted")
    	@my_transactions = Transaction.where(user_id: own_id)
	end

	# creates new request for a book
	def new
	    user_id = params['user_id'].to_i
	    requested_book_id = params['requested_book_id'].to_i

	    @transaction = Transaction.new(:user_id => user_id, :requested_book_id => requested_book_id)
	    @transaction.save

	    redirect_to transactions_path
	end

	  def show
	  end


	  def edit
	  end


	private
	    # Use callbacks to share common setup or constraints between actions.
	    def set_request
	      @transaction = Transaction.find(params[:id])
	    end

	    # Never trust parameters from the scary internet, only allow the white list through.
	    def request_params
	      params.require(:transaction).permit(:requested_book_id, :requester_book_id, :status_requested, :status_requester, :user_id)
	    end
end
