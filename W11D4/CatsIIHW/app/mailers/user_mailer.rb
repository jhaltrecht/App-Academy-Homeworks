class UserMailer < ApplicationMailer
    default from: 'everybody@appacademy.io'

    def welcome_email(user)
        @user=user
        # using username as email (as done in the video )
        # will also use username for practice to incorporate instance variables in mail view layout
        mail(to: user.username, subject: 'Welcome to Cats')
    end
end
