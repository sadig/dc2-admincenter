# encoding: UTF-8

class Admin::UsersController < ApplicationController
  before_filter :require_login
  before_filter :require_admin

  def index
    @menuname="Administration"
    @dcblist = Dcbackend.all()
    @users=User.all()
    respond_to do |format|
      format.html
      format.json { render :json => @users }
    end
  end

  def new
    @dcblist = Dcbackend.all()
    @menuname="Administration"
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    Rails::logger::debug @user.username
    respond_to do |format|
      if @user.save
        format.html { redirect_to(admin_users_path, :notice => "User successfully created") }
        format.json { 
          render :json  => @user,
          :status => :created,
          :location  => @user 
        }
      else
        format.html { render :action => "new" }
        format.json { 
          render  :json => @user.errors,
                  :status => :unprocessable_entity 
        }
      end
    end
  end

  def edit
    @dcblist=Dcbackend.all()
    @menuname="Administration"
    @user=User.first(:id => params[:id])
  end

  def update
    @user=User.first(:id => params[:id])
    if params[:user][:password] != nil and params[:user][:password] != ""
      @user.password=params[:user][:password]
    end
    @user.firstname=params[:user][:firstname]
    @user.lastname=params[:user][:lastname]
    @user.is_admin=params[:user][:is_admin]
    respond_to do |format| 
      if @user.save
        format.html { redirect_to(admin_users_path, :notice => "User succesfully updated") }
        format.json { render :json => @user, :status => :updated, :location => @user }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @user=User.first(:id => params[:id])
    respond_to do |format| 
      if @user.destroy
        format.json { head :no_content }
        format.html { redirect_to admin_users_path }
      end
    end
  end
end
