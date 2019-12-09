class ResetMailer < ActionMailer::Base
  default from: "reset.npnl@gmail.com"

  UI_BASE_ADDRESS = "http://npnl.s3-website-us-west-1.amazonaws.com"
  # UI_BASE_ADDRESS = "http://localhost:3006"

  def reset_password(user, token)
    @user = user
    @password_reset_info = {:url => "#{UI_BASE_ADDRESS}/reset_password/update_password/#{token}"}
    mail(to: @user.email, subject: 'Leaderboard Password Reset Request')
  end
end
