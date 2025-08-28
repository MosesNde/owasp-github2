 # typed: strict
 class Advertisement < ApplicationRecord
   belongs_to :category
  belongs_to :user
 
   #Money-Rails
   monetize :price_cents