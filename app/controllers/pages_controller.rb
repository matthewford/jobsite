class PagesController < ApplicationController
  def home
    @listings = Listing.desc(:created_at).limit(20)
  end
end
