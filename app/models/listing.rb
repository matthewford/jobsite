class Listing
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title
  field :position
  field :company
  field :description
  field :ending, :type => Date, :default => lambda { Date.today + 1.month }
  field :premium, :type => Boolean, :default => false
  
  field :city
  field :country
  
  # filter options 1-5 
  field :exotic_score, :type => Integer, :default => 1
  field :entrepenural_score, :type => Integer, :default => 1
  field :social_score, :type => Integer, :default => 1
  field :financial_score, :type => Integer, :default => 1

  referenced_in :user
  
  validates_presence_of :title, :position, :company, :city, :country
      
  def to_s
    title
  end
  
end
