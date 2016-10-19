class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def create
    p "*/"* 50
    p "create user name:"
    p params

    p name = params[:user][:name]
    p email = params[:user][:email]
    p password = params[:user][:password]
    @user = User.new(name: name, email: email, password: password)

      if @user.save
        # format.html { redirect_to @user, notice: 'User was successfully created.' }
        # format.json { render :show, status: :created, location: @user }
        p "true"
      else
        # format.html { render :new }
        # format.json { render json: @user.errors, status: :unprocessable_entity }
        p "false"
      end

    render ''
  end

  def new
    p "*"* 50
    p @user = User.new
    p "new user name:#{params[:name]} email:#{params[:email]}"
    p params
  end

  def 
    
  end
end
