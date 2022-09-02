class FriendRequestsController < ApplicationController
  before_action :set_friend_request, except: [:index, :new, :create]

  # GET /friend_requests or /friend_requests.json
  def index
    @incoming = FriendRequest.where(friend: current_user)
    @outgoing = current_user.friend_requests
  end

  # GET /friend_requests/1 or /friend_requests/1.json
  def show
  end

  # GET /friend_requests/new
  def new
    @friend_request = FriendRequest.new
  end

  # GET /friend_requests/1/edit
  def edit
  end

  # POST /friend_requests or /friend_requests.json
  def create
    @friend = User.find(params[:friend_id])
    @friend_request = current_user.friend_requests.new(friend: @friend)

    respond_to do |format|
      if @friend_request.save
        format.html { redirect_to users_path notice: "Friend request was successfully created." }
        format.json { render :show, status: :created, location: @friend_request }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @friend_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /friend_requests/1 or /friend_requests/1.json
  def update
    @friend_request.accept
    respond_to do |format|
      format.html { redirect_to users_path, notice: "Friend request was accepted!" }
      format.json { head :no_content }
    end
  end

  # DELETE /friend_requests/1 or /friend_requests/1.json
  def destroy
    @friend_request.destroy

    respond_to do |format|
      format.html { redirect_to users_path, notice: "Friend request was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friend_request
      @friend_request = FriendRequest.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def friend_request_params
      params.require(:friend_request).permit(:user_id, :friend_id)
    end
end
