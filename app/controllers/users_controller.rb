class UsersController < ApplicationController
  def register   
    mobile_number = params[:mobile_number]
    unless mobile_number.blank?
          user = User.new(:mobile_number => mobile_number)
          if user.save
            render :json => {status: true, message: "Thank you for registering, your verification code is #{user.sms}"} and return
          else
            render :json => {status: false, message: "There is something which went wrong!"} and return
          end
    else
          render :json => {status: false, message: "There is some error!"} and return
    end
  end
  
  def login
    mobile_number = params[:mobile_number]
    sms = params[:sms]
    user = User.where("mobile_number = ? and sms = ?", mobile_number, sms).first
    unless user.blank?
      user.update_columns({:auth_code => rand(100000..100000000), :sms => nil})
      render :json => {status: true, message: "Thank you for login", auth_code: user.auth_code} and return
    else
      render :json => {status: false, message: "There is some error!"} and return
    end
  end

  def logout
    mobile_number = params[:mobile_number]
    auth_code = params[:auth_code]
    user = User.where("mobile_number = ? and auth_code = ?", mobile_number, auth_code).first
    unless user.blank?
      user.update_column(:auth_code, nil)
      render :json => {status: true, message: "Thank you for using this application"} and return
    else
      render :json => {status: false, message: "There is some error!"} and return
    end
  end
end
