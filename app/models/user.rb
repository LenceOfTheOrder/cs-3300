class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         #:recoverable, :rememberable, :validatable,
         #:confirmable, :timeoutable
end

# TODO: Implement :confirmable and :timeoutable

# From Devise docs: https://github.com/heartcombo/devise#:~:text=It%27s%20composed%20of%2010%20modules%3A
# * indicates default devise module;
# ** indicates added by me;
# *** indicates that I wanted to add it, but something got in the way
  #* "Database Authenticatable: hashes and stores a password in the database to validate the authenticity of a user while signing in. The authentication can be done both through POST requests or HTTP Basic Authentication."
  #** "Confirmable: sends emails with confirmation instructions and verifies whether an account is already confirmed during sign in."
  #* "Recoverable: resets the user password and sends reset instructions."
  #* "Registerable: handles signing up users through a registration process, also allowing them to edit and destroy their account."
  #* "Rememberable: manages generating and clearing a token for remembering the user from a saved cookie."
  # "Trackable: tracks sign in count, timestamps and IP address."
  #** "Timeoutable: expires sessions that have not been active in a specified period of time."
  #* "Validatable: provides validations of email and password. It's optional and can be customized, so you're able to define your own validations."
  #*** "Lockable: locks an account after a specified number of failed sign-in attempts. Can unlock via email or after a specified time period."
  # "Omniauthable: adds OmniAuth (https://github.com/omniauth/omniauth) support."