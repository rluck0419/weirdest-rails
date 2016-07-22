class UsersController < ApplicationController
  def index
    render json: { users: User.all, status: 200 }
  end

  def show
    if User.exists?(params[:id])
      render json: { user: User.find(params[:id]), status: 200 }
    else
      render json: { message: "User not found.", status: 404 }
    end
  end

  def new
    render json: { user: User.new, status: 200 }
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    if current_user != @user
      flash[:alert] = "You cannot edit other users."
      redirect_to users_path
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if @user.id == current_user.id
      @user.destroy
    end

    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :username, :email, :password)
  end
end
