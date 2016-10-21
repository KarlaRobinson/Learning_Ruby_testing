class UsersController < ApplicationController

  # skip_before_action :require_login, only: [:new, :create]

  def index
    @users = User.all
  end

  def show
  end

  def create
    name = params[:user][:name]
    email = params[:user][:email]
    password = params[:user][:password]
    @user = User.new(name: name, email: email, password: password)

    if @user.save
      # format.html { redirect_to @user, notice: 'User was successfully created.' }
      # format.json { render :show, status: :created, location: @user }
      flash[:notice] = "Your account has been created successfully"
      session[:id] = @user.id
      render 'show'
    else
      # format.html { render :new }
      # format.json { render json: @user.errors, status: :unprocessable_entity }
      p errors = @user.errors.messages
      p errors[:name] if errors[:name] != []
      p errors[:email] if errors[:email] != []
      flash[:error] = "Your account could not be created"
      redirect_back fallback_location: new_user_path
    end
  end

  def login
    @user = User.find_by_email(params[:user][:email])

    if !@user.nil?
      if @user.password == params[:user][:password]
        session[:id] = @user.id
        flash[:notice] = "Welcome, #{@user.name}!"
        render 'show'
      else
        flash[:error] = 'Incorrect password'
        redirect_back fallback_location: new_user_path
      end
    else
      flash[:error] = 'User does not exist'
      redirect_back fallback_location: new_user_path
    end
  end

  def new
    @user = User.new
  end

  def logout
    session.clear
    @user = User.new
    render 'new'
  end


  private
    # Using a private method to encapsulate the permissible parameters
    # is just a good pattern since you'll be able to reuse the same
    # permit list between create and update. Also, you can specialize
    # this method with per-user checking of permissible attributes.
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
end
